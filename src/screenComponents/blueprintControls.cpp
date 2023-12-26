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
    for (auto & [name, sqt] : target_spaceship->getSquadronCompositions())
    {
        BlueprintRow row;
        row.layout = new GuiElement(this, id + "_ROW_" + string(n));
        row.layout->setSize(GuiElement::GuiSizeMax, 50)->setAttribute("layout", "horizontal");
        row.bp_toggle_button = new GuiToggleButton(row.layout, id + "_" + string(n) + "_LOAD_BUTTON", tr("cic",name), [&sqt, this](bool value) {
            if (!target_spaceship)
                return;
            sqt.activated = value;
        });
        row.bp_toggle_button->setValue(sqt.activated);
        row.bp_toggle_button->setSize(130, 50);
        
        row.loading_bar = new GuiProgressbar(row.layout, id + "_" + string(n) + "_PROGRESS", 0, 1.0, 0);
        row.loading_bar->setColor(glm::u8vec4(128, 128, 128, 255))->setSize(200, 50);

        pdi = new GuiPowerDamageIndicator(row.loading_bar, id + "_" + string(n) + "_PDI", SYS_MissileSystem, sp::Alignment::CenterRight, target_spaceship);
        pdi->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

        row.loading_label = new GuiLabel(row.loading_bar, id + "_" + string(n) + "_PROGRESS_LABEL", tr("cic","In progress"), 35);
        row.loading_label->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

        row.compo_name = name;

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

    std::map<string, PlayerSpaceship::SquadronTemplate>& templates = target_spaceship->getSquadronCompositions();

    for(auto &row : rows)
    {
        if(templates[row.compo_name].available == true)
        {
            row.layout->show();
        }
        else
        {
            row.layout->hide();
        }

        
        unsigned int cur_sq = target_spaceship->getSquadronCount(row.compo_name);
        unsigned int max_sq = templates[row.compo_name].max_created;
        if(cur_sq >= max_sq)
        {
            row.loading_bar->show();
            row.loading_bar->setValue(0);
            row.loading_label->setText(tr("cic",tr("All available") + "(" + string(max_sq) + ")"));
        }
        else
        {
            row.loading_label->setText(tr("cic",tr("In progress") + "(" + string(cur_sq) + "/" + string(max_sq) + ")"));
            row.loading_bar->show();
            row.loading_bar->setValue(target_spaceship->getSquadronCreationProgression(row.compo_name));
                                                       
        }
    }
}

