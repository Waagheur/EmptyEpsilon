#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "launchSquadronControls.h"
#include "powerDamageIndicator.h"

#include "gui/gui2_button.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_label.h"
#include "gui/gui2_selector.h"

GuiLaunchSquadronControls::GuiLaunchSquadronControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship)
: GuiElement(owner, id), target_spaceship(targetSpaceship)
{
    if(!target_spaceship)
    {
        return;
    }
    setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    setAttribute("layout", "verticalbottom");


    for(unsigned int n =0; n < target_spaceship->max_squadron_launch; n++)
    {
        LaunchSquadronRow row;
        row.layout = new GuiElement(this, id + "_ROW_" + string(n));
        row.layout->setSize(GuiElement::GuiSizeMax, 40)->setAttribute("layout", "horizontal");
        row.launch_selector = new GuiSelector(row.layout, id + "_" + string(n) + "_SELECTOR", [n, this](int index, string value)
        {
            rows[n].waiting_squadron_selected_for_launch = rows[n].launch_selector->getEntryName(index);
        });
        row.launch_selector->setSize(130, 40);

        row.launch_button = new GuiButton(row.layout, id + "_ROW_" + string(n) +"_SQUADRON_LAUNCH_BUTTON", tr("cic","Launch"), [n, this]() {
            if(target_spaceship)
            {
                target_spaceship->commandLaunchSquadron(n, rows[n].waiting_squadron_selected_for_launch);
            }
        });
        row.launch_button->setSize(100, 40);
        row.launch_button->setTextSize(30);

        row.launch_progress = new GuiProgressbar(row.layout, id + "_ROW_" + string(n) + "_SQUADRON_LAUNCH_PROGRESS", 0, 1.0, 0);
        row.launch_progress->setSize(100, 50);
        row.launch_progress->hide();
    
        pdi = new GuiPowerDamageIndicator(row.launch_progress, id + "_" + string(n) + "_PDI", SYS_Hangar, sp::Alignment::CenterRight, target_spaceship);
        pdi->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

        rows.push_back(row);
    }
    
}

void GuiLaunchSquadronControls::setTargetSpaceship(P<PlayerSpaceship> targetSpaceship){
    target_spaceship = targetSpaceship;
    pdi->setTargetSpaceship(target_spaceship);
}

void GuiLaunchSquadronControls::onUpdate()
{
    if (!target_spaceship || !isVisible())
        return;

    unsigned int deck=0;    
    for(auto &row : rows)
    {
        if(target_spaceship->isLaunchingSquadron(deck))
        {
            row.launch_progress->show();
            row.launch_progress->setText(row.waiting_squadron_selected_for_launch);
            row.launch_progress->setValue(my_spaceship->getLaunchSquadronProgression(deck));
            row.launch_button->hide();
        }
        else
        {
            row.launch_progress->hide();
            row.launch_progress->setText("");
            row.launch_progress->setValue(0);
            row.launch_button->show();
        }
        deck++;

        int n = 0;
        for(unsigned int nbr : target_spaceship->getNbrWaitingSquadrons())
        {
            if(nbr <= 0)
            {
                continue;
            }
            int idx;
            string &name = target_spaceship->ship_template->squadrons_compositions[n].template_name;
            if((idx = row.launch_selector->indexByValue(string(n))) != -1)
            {
                if(row.launch_selector->getEntryName(idx) != name)
                {
                    row.launch_selector->removeEntry(idx);
                }
            }
            if(row.launch_selector->indexByValue(string(n)) == -1)
            {
                row.launch_selector->addEntry(name, string(n));
            }
            n++;
        }
        while(n <= row.launch_selector->entryCount())
        {
            row.launch_selector->removeEntry(n);
            n++;
        }
        //position_entry->setVisible(position_text->isFocus());
    }

    
    
}

void GuiLaunchSquadronControls::onDraw(sp::RenderTarget& target)
{
    
}

