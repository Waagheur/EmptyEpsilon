#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "blueprintControls.h"
#include "powerDamageIndicator.h"

#include "gui/gui2_button.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_label.h"
#include "gui/gui2_togglebutton.h"

GuiBlueprintsControls::GuiBlueprintsControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship)
: GuiElement(owner, id), target_spaceship(targetSpaceship)
{
    if(!target_spaceship)
    {
        return;
    }
    setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    setAttribute("layout", "verticalbottom");

    //rows.resize(max_weapon_tubes);
    //load_type_rows.resize(MW_Count);


    int n = 0;
    for (auto & sqt: target_spaceship->getSquadronCompositions())
    {
        BlueprintRow row;
        row.layout = new GuiElement(this, id + "_ROW_" + string(n));
        row.layout->setSize(GuiElement::GuiSizeMax, 40)->setAttribute("layout", "horizontal");
        row.bp_toggle_button = new GuiToggleButton(row.layout, id + "_" + string(n) + "_LOAD_BUTTON", tr("cic",sqt.template_name), [n, this](bool value) {
            if (!target_spaceship)
                return;
            target_spaceship->commandSetBlueprintActivation(n, value);
        });
        row.bp_toggle_button->setValue(sqt.activated);
        row.bp_toggle_button->setSize(130, 40);
        row.bp_toggle_button->setTextSize(30);
        
        row.loading_bar = new GuiProgressbar(row.layout, id + "_" + string(n) + "_PROGRESS", 0, 1.0, 0);
        row.loading_bar->setColor(glm::u8vec4(128, 128, 128, 255))->setSize(100, 40);
    
        pdi = new GuiPowerDamageIndicator(row.loading_bar, id + "_" + string(n) + "_PDI", SYS_Hangar, sp::Alignment::CenterRight, target_spaceship);
        pdi->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

        row.loading_label = new GuiLabel(row.loading_bar, id + "_" + string(n) + "_PROGRESS_LABEL", tr("cic",""), 25);
        row.loading_label->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

        row.compo_name = sqt.template_name;

        if(sqt.available == false)
        {
            row.layout->hide();
        }
        rows.push_back(row);
        n++;
    }
    
}

void GuiBlueprintsControls::setTargetSpaceship(P<PlayerSpaceship> targetSpaceship){
    target_spaceship = targetSpaceship;
    pdi->setTargetSpaceship(target_spaceship);
}

void GuiBlueprintsControls::onUpdate()
{
    if (!target_spaceship || !isVisible())
        return;

    std::vector<SquadronTemplate>& templates = target_spaceship->getSquadronCompositions();

    int n =0;
    for(auto &row : rows)
    {
        if(target_spaceship->isBlueprintAvailable(n) == true)
        {
            row.layout->show();
        }
        else
        {
            row.layout->hide();
        }

        
        unsigned int cur_sq = target_spaceship->getSquadronCount(n);
        unsigned int max_sq = templates[n].max_created;
        if(cur_sq >= max_sq)
        {
            row.loading_bar->show();
            row.loading_bar->setValue(0);
            row.loading_label->setText(tr("cic",tr("Max") + "(" + string(max_sq) + ")"));
        }
        else
        {
            row.loading_label->setText(tr("cic","(" + string(cur_sq) + "/" + string(max_sq) + ")"));
            row.loading_bar->show();
            row.loading_bar->setValue(target_spaceship->getSquadronCreationProgression(n));
                                                       
        }
        n++;
    }
}

void GuiBlueprintsControls::onDraw(sp::RenderTarget& target)
{
     if (!target_spaceship || !isVisible())
        return;

    int n =0;
    for(auto &row : rows)
    {
        row.bp_toggle_button->setValue(target_spaceship->isBlueprintActivated(n));
        n++;
    }
}

