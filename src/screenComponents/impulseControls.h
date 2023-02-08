#ifndef IMPULSE_CONTROLS_H
#define IMPULSE_CONTROLS_H

#include "gui/gui2_element.h"
#include "spaceObjects/playerSpaceship.h"

class GuiKeyValueDisplay;
class GuiSlider;
class GuiPowerDamageIndicator;

class GuiImpulseControls : public GuiElement
{
private:
    P<PlayerSpaceship> target_spaceship;
    GuiKeyValueDisplay* label;
    GuiSlider* slider;
    GuiPowerDamageIndicator* pdi;
    bool set_active = false;
public:
    GuiImpulseControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship);

    virtual void onDraw(sp::RenderTarget& target) override;
    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship);
    virtual void onUpdate() override;
};

#endif//IMPULSE_CONTROLS_H
