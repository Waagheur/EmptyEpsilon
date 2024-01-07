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
    if(!target_spaceship)
        return;
    std::set<string> names;
    for (auto & sqi : target_spaceship->getLaunchedSquadronsInfos())
    {
        string &squadron_name = sqi.squadron_name;
        if(squadron_name == "")
            continue;
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
            
            row.order_target_desc = new GuiKeyValueDisplay(row.layout, squadron_name + "ORDER_AND_TARGET", 0.63, sqi.order, sqi.target);
            row.order_target_desc->setTextSize(20)->setSize(170, 40);
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

    
}

