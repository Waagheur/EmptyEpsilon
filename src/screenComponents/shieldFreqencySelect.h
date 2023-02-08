#ifndef SHIELD_FREQUENCY_SELECT_H
#define SHIELD_FREQUENCY_SELECT_H

#include "gui/gui2_element.h"
#include "spaceObjects/playerSpaceship.h"

class GuiKeyValueDisplay;
class GuiSelector;
class GuiButton;
class GuiProgressbar;

class GuiShieldFrequencySelect : public GuiElement
{
private:
    P<PlayerSpaceship> target_spaceship;
    GuiSelector* new_frequency;
    GuiButton* calibrate_button;
public:
    GuiShieldFrequencySelect(GuiContainer* owner, string id, P<PlayerSpaceship> target_spaceship);
    
    virtual void onDraw(sp::RenderTarget& target) override;
    virtual void onUpdate() override;
};

#endif//SHIELD_FREQUENCY_SELECT_H
