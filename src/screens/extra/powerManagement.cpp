#include "powerManagement.h"

#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "screenComponents/customShipFunctions.h"

#include "gui/gui2_autolayout.h"
#include "gui/gui2_panel.h"
#include "gui/gui2_label.h"
#include "gui/gui2_slider.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_keyvaluedisplay.h"

PowerManagementScreen::PowerManagementScreen(GuiContainer* owner)
: GuiOverlay(owner, "POWER_MANAGEMENT_SCREEN", colorConfig.background)
{
    energy_display = new GuiKeyValueDisplay(this, "ENERGY_DISPLAY", 0.45, "Energie", "");
    energy_display->setIcon("gui/icons/energy")->setTextSize(20)->setPosition(20, 20, ATopLeft)->setSize(285, 40);
    coolant_display = new GuiKeyValueDisplay(this, "COOLANT_DISPLAY", 0.45, "Refroidissement", "");
    coolant_display->setIcon("gui/icons/coolant")->setTextSize(20)->setPosition(315, 20, ATopLeft)->setSize(280, 40);
//    GuiAutoLayout* layout = new GuiAutoLayout(this, "", GuiAutoLayout::LayoutHorizontalLeftToRight);
    GuiAutoLayout* layout = new GuiAutoLayout(this, "", GuiAutoLayout::LayoutVerticalColumns);
    layout->setPosition(20, 60, ATopLeft)->setSize(GuiElement::GuiSizeMax, 400);
    for(int n=0; n<SYS_COUNT; n++)
    {
        if (n == 5)
        {
            //Start the 2nd row after 4 elements.
//            layout = new GuiAutoLayout(this, "", GuiAutoLayout::LayoutHorizontalLeftToRight);
            layout = new GuiAutoLayout(this, "", GuiAutoLayout::LayoutVerticalColumns);
            layout->setPosition(20, 450, ATopLeft)->setSize(GuiElement::GuiSizeMax, 400);
        }

        GuiPanel* box = new GuiPanel(layout, "");
        systems[n].box = box;
        box->setSize(290, 400);

//        (new GuiLabel(box, "", getSystemName(ESystem(n)), 30))->addBackground()->setAlignment(ACenter)->setPosition(0, 0, ATopLeft)->setSize(290, 50);
        (new GuiLabel(box, "", getSystemName(ESystem(n)), 30))->addBackground()->setAlignment(ACenter)->setPosition(0, 0, ATopLeft)->setSize(GuiElement::GuiSizeMax, 50);
        (new GuiLabel(box, "", "Puissance", 30))->setVertical()->setAlignment(ACenterLeft)->setPosition(20, 50, ATopLeft)->setSize(30, 340);
        (new GuiLabel(box, "", "Refroidissement", 30))->setVertical()->setAlignment(ACenterLeft)->setPosition(100, 50, ATopLeft)->setSize(30, 340);
        (new GuiLabel(box, "", "Chaleur", 30))->setVertical()->setAlignment(ACenterLeft)->setPosition(180, 50, ATopLeft)->setSize(30, 340);

        systems[n].power_bar = new GuiProgressbar(box, "", 0.0, 3.0, 1.0);
        systems[n].power_bar->setDrawBackground(false)->setPosition(52.5, 60, ATopLeft)->setSize(50, 320);

        systems[n].power_slider = new GuiSlider(box, "", 3.0, 0.0, 1.0, [n](float value) {
            if (my_spaceship)
                my_spaceship->commandSetSystemPowerRequest(ESystem(n), value);
        });
        systems[n].power_slider->addSnapValue(1.0, 0.1)->setPosition(50, 50, ATopLeft)->setSize(55, 340);

        systems[n].coolant_bar = new GuiProgressbar(box, "", 0.0, 10.0, 0.0);
        systems[n].coolant_bar->setDrawBackground(false)->setPosition(132.5, 60, ATopLeft)->setSize(50, 320);

        systems[n].coolant_slider = new GuiSlider(box, "", 10.0, 0.0, 0.0, [n](float value) {
            if (my_spaceship)
                my_spaceship->commandSetSystemCoolantRequest(ESystem(n), value);
        });
        systems[n].coolant_slider->setPosition(130, 50, ATopLeft)->setSize(55, 340);

        systems[n].heat_bar = new GuiProgressbar(box, "", 0.0, 1.0, 0.0);
        systems[n].heat_bar->setPosition(210, 60, ATopLeft)->setSize(50, 320);
    }

    (new GuiCustomShipFunctions(this, powerManagement, "", my_spaceship))->setPosition(-20, 120, ATopRight)->setSize(250, GuiElement::GuiSizeMax);

    previous_energy_level = 0.0;
    average_energy_delta = 0.0;
    previous_energy_measurement = 0.0;
}

void PowerManagementScreen::onDraw(sf::RenderTarget& window)
{
    GuiOverlay::onDraw(window);
    if (my_spaceship)
    {
        //Update the energy usage.
        if (previous_energy_measurement == 0.0)
        {
            previous_energy_level = my_spaceship->energy_level;
            previous_energy_measurement = engine->getElapsedTime();
        }else{
            if (previous_energy_measurement != engine->getElapsedTime())
            {
                float delta_t = engine->getElapsedTime() - previous_energy_measurement;
                float delta_e = my_spaceship->energy_level - previous_energy_level;
                float delta_e_per_second = delta_e / delta_t;
                average_energy_delta = average_energy_delta * 0.99 + delta_e_per_second * 0.01;

                previous_energy_level = my_spaceship->energy_level;
                previous_energy_measurement = engine->getElapsedTime();
            }
        }
        energy_display->setValue(string(int(my_spaceship->energy_level)) + " (" + string(int(average_energy_delta * 60.0f)) + "/m)");
        coolant_display->setValue(string(int(my_spaceship->max_coolant * 10)) + "%");

        for(int n=0; n<SYS_COUNT; n++)
        {
            systems[n].box->setVisible(my_spaceship->hasSystem(ESystem(n)));
            systems[n].power_slider->setValue(my_spaceship->systems[n].power_request);
            systems[n].coolant_slider->setValue(std::min(my_spaceship->systems[n].coolant_request, my_spaceship->max_coolant));
            systems[n].coolant_slider->setRange(0.0,my_spaceship->systems[n].coolant_max);
            systems[n].coolant_slider->setEnable(!my_spaceship->auto_coolant_enabled);

            float heat = my_spaceship->systems[n].heat_level;
            float power = my_spaceship->systems[n].power_level;
            float coolant = my_spaceship->systems[n].coolant_level;
            systems[n].heat_bar->setValue(heat)->setColor(sf::Color(128, 128 * (1.0 - heat), 0));
            systems[n].power_bar->setValue(power)->setColor(sf::Color(255, 255, 0));
            systems[n].coolant_bar->setValue(coolant)->setColor(sf::Color(0,128,255));
            systems[n].coolant_bar->setRange(0.0,my_spaceship->systems[n].coolant_max);
        }
    }
}

void PowerManagementScreen::onHotkey(const HotkeyResult& key)
{
	if (key.category == "POWER_MANAGEMENT" && my_spaceship)
    {
		if (my_spaceship)
		{
			for(int n=0; n<SYS_COUNT; n++)
			{
				if (key.hotkey == getSystemName(ESystem(n))+ string("_POWER_UP"))
				{
					if(my_spaceship->systems[n].power_request < 3.0f)

						my_spaceship->commandSetSystemPowerRequest(ESystem(n), my_spaceship->systems[n].power_request + 0.1f);
					else
						my_spaceship->commandSetSystemPowerRequest(ESystem(n), 3.0f);
				}
				if (key.hotkey == getSystemName(ESystem(n))+ string("_POWER_DOWN"))
				{
					if(my_spaceship->systems[n].power_request > 0.0f)
						my_spaceship->commandSetSystemPowerRequest(ESystem(n), my_spaceship->systems[n].power_request - 0.1f);
					else
						my_spaceship->commandSetSystemPowerRequest(ESystem(n), 0.0f);
				}
				if (key.hotkey == getSystemName(ESystem(n))+ string("_COOLANT_UP"))
				{
					if(my_spaceship->systems[n].coolant_request < my_spaceship->systems[n].coolant_max)
						my_spaceship->commandSetSystemCoolantRequest(ESystem(n), my_spaceship->systems[n].coolant_request + 0.05f);
					else
						my_spaceship->commandSetSystemCoolantRequest(ESystem(n), my_spaceship->systems[n].coolant_max);
				}
				if (key.hotkey == getSystemName(ESystem(n))+ string("_COOLANT_DOWN"))
				{
					if(my_spaceship->systems[n].coolant_request > 0.0f)
						my_spaceship->commandSetSystemCoolantRequest(ESystem(n), my_spaceship->systems[n].coolant_request - 0.05f);
					else
						my_spaceship->commandSetSystemCoolantRequest(ESystem(n), 0.0f);
				}
				if (key.hotkey == getSystemName(ESystem(n))+ string("_RESET"))
				{
					my_spaceship->commandSetSystemPowerRequest(ESystem(n), 1.0f);
					my_spaceship->commandSetSystemCoolantRequest(ESystem(n), 0.0f);
				}
			}
		}
	}
}
bool PowerManagementScreen::onJoystickAxis(const AxisAction& axisAction){
    if(my_spaceship){
        if (axisAction.category == "ENGINEERING"){
            for(int n=0; n<SYS_COUNT; n++)
            {
                ESystem system = ESystem(n);
                if (axisAction.action == std::string("POWER_") + getSystemName(system)){
                    systems[n].power_slider->setValue((axisAction.value + 1) * 3.0 / 2.0);
                    my_spaceship->commandSetSystemPowerRequest(system, systems[n].power_slider->getValue());
                    return true;
                } 
                if (axisAction.action == std::string("COOLANT_") + getSystemName(system)){
                    systems[n].coolant_slider->setValue((axisAction.value + 1) * 10.0 / 2.0);
                    my_spaceship->commandSetSystemCoolantRequest(system, systems[n].coolant_slider->getValue());
                    return true;
                }
            }
        }
    }
    return false;
}
