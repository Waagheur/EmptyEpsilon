#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "squadronControls.h"
#include "powerDamageIndicator.h"
#include "gameGlobalInfo.h"

#include "gui/gui2_button.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_label.h"
#include "gui/gui2_togglebutton.h"
#include "gui/gui2_keyvaluedisplay.h"

GuiSquadronControls::GuiSquadronControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship)
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
}

void GuiSquadronControls::selectSquadron(const string &name)
{
    for(auto & [key, row] : name_to_rows)
    {
        row.squadron_button->setValue(key == name);
    }
}

void GuiSquadronControls::updateSquadronRows()
{

    std::set<string> names;
    for (auto & sq : target_spaceship->getLaunchedSquadrons())
    {
        string &squadron_name = sq.squadron_name;
        names.insert(squadron_name);
        if(name_to_rows.find(squadron_name) == name_to_rows.end())
        {
            /*
             GuiElement* layout;
        GuiButton* squadron_button;
        GuiButton* order_show_and_change;
        GuiButton* target_show_and_change;
        GuiKeyValueDisplay* order_target_desc;
        GuiButton* validate_button;
        GuiButton* recall_button;
            
            */
            //We have a new squadron
            SquadronRow row;
            
            row.layout = new GuiElement(this, "LAUNCHED_SQUADRON_ROW_" + squadron_name);
            row.layout->setSize(GuiElement::GuiSizeMax, 40)->setAttribute("layout", "horizontal");
            
            row.squadron_button = new GuiToggleButton(row.layout, squadron_name + "_SELECT", squadron_name, [squadron_name, this](bool value)
            {
                selectSquadron(squadron_name);
            });

            row.squadron_button->setSize(140,40);
            row.squadron_button->setTextSize(30);
            
            P<CpuShip> cpu = sq.ships[0];
            string target{""};
            if(cpu)
            {
                P<SpaceObject> spo = cpu->getOrderTarget();
                if(spo)
                {
                    target = spo->getCallSign();
                }
                else
                {
                    target = getStringFromPosition(cpu->getOrderTargetLocation());
                }
            }

            row.order_target_desc = new GuiKeyValueDisplay(row.layout, squadron_name + "ORDER_AND_TARGET", 0.63, getAIOrderString(cpu->getOrder()), target);
            row.order_target_desc->setTextSize(20)->setSize(170, 40);
            // row.bp_toggle_button = new GuiToggleButton(row.layout, "LAUNCHED_SQUADRON_ROW_" + name + "_LOAD_BUTTON", name), [&sqt, this](bool value) {
            //     if (!target_spaceship)
            //         return;
            //     sqt.activated = value;
            // });
            // row.bp_toggle_button->setValue(sqt.activated);
            // row.bp_toggle_button->setSize(130, 40);
            // row.bp_toggle_button->setTextSize(30);
            
            // row.loading_bar = new GuiProgressbar(row.layout, id + "_" + string(n) + "_PROGRESS", 0, 1.0, 0);
            // row.loading_bar->setColor(glm::u8vec4(128, 128, 128, 255))->setSize(100, 40);
        
            // pdi = new GuiPowerDamageIndicator(row.loading_bar, id + "_" + string(n) + "_PDI", SYS_MissileSystem, sp::Alignment::CenterRight, target_spaceship);
            // pdi->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

            // row.loading_label = new GuiLabel(row.loading_bar, id + "_" + string(n) + "_PROGRESS_LABEL", tr("cic",""), 25);
            // row.loading_label->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

            // row.compo_name = name;
            name_to_rows.insert({squadron_name, row});
        }
        //We remove squadrons which are not in space now. could be optimized but meh
    }
    for (auto it = name_to_rows.begin(); it != name_to_rows.end();)
    {
        if(names.find(it->first) == names.end())
        {
            it->second.layout->destroy();
            it = name_to_rows.erase(it);
        }
        else
        {
            it++;
        }
    }
    // {
    //     BlueprintRow row;
    //     row.layout = new GuiElement(this, id + "_ROW_" + string(n));
    //     row.layout->setSize(GuiElement::GuiSizeMax, 40)->setAttribute("layout", "horizontal");
    //     row.bp_toggle_button = new GuiToggleButton(row.layout, id + "_" + string(n) + "_LOAD_BUTTON", tr("cic",name), [&sqt, this](bool value) {
    //         if (!target_spaceship)
    //             return;
    //         sqt.activated = value;
    //     });
    //     row.bp_toggle_button->setValue(sqt.activated);
    //     row.bp_toggle_button->setSize(130, 40);
    //     row.bp_toggle_button->setTextSize(30);
        
    //     row.loading_bar = new GuiProgressbar(row.layout, id + "_" + string(n) + "_PROGRESS", 0, 1.0, 0);
    //     row.loading_bar->setColor(glm::u8vec4(128, 128, 128, 255))->setSize(100, 40);
    
    //     pdi = new GuiPowerDamageIndicator(row.loading_bar, id + "_" + string(n) + "_PDI", SYS_MissileSystem, sp::Alignment::CenterRight, target_spaceship);
    //     pdi->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

    //     row.loading_label = new GuiLabel(row.loading_bar, id + "_" + string(n) + "_PROGRESS_LABEL", tr("cic",""), 25);
    //     row.loading_label->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

    //     row.compo_name = name;

    //     if(sqt.available == false)
    //     {
    //         row.layout->hide();
    //     }
    //     rows.push_back(row);
    //     n++;
    // }
    
}

void GuiSquadronControls::setTargetSpaceship(P<PlayerSpaceship> targetSpaceship){
    target_spaceship = targetSpaceship;
    pdi->setTargetSpaceship(target_spaceship);
}


void GuiSquadronControls::onUpdate()
{
    if (!target_spaceship || !isVisible())
        return;

    updateSquadronRows();

    // std::map<string, PlayerSpaceship::SquadronTemplate>& templates = target_spaceship->getSquadronCompositions();

    // for(auto &row : rows)
    // {
    //     if(templates[row.compo_name].available == true)
    //     {
    //         row.layout->show();
    //     }
    //     else
    //     {
    //         row.layout->hide();
    //     }

        
    //     unsigned int cur_sq = target_spaceship->getSquadronCount(row.compo_name);
    //     unsigned int max_sq = templates[row.compo_name].max_created;
    //     if(cur_sq >= max_sq)
    //     {
    //         row.loading_bar->show();
    //         row.loading_bar->setValue(0);
    //         row.loading_label->setText(tr("cic",tr("Max") + "(" + string(max_sq) + ")"));
    //     }
    //     else
    //     {
    //         row.loading_label->setText(tr("cic","(" + string(cur_sq) + "/" + string(max_sq) + ")"));
    //         row.loading_bar->show();
    //         row.loading_bar->setValue(target_spaceship->getSquadronCreationProgression(row.compo_name));
                                                       
    //     }
    // }
}

