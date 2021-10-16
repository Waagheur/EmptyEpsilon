#ifndef JUMP_CONTROLS_H
#define JUMP_CONTROLS_H

#include "gui/gui2_element.h"
#include "spaceObjects/playerSpaceship.h"

class GuiKeyValueDisplay;
class GuiSlider;
class GuiButton;
class GuiProgressbar;
class GuiPowerDamageIndicator;

class GuiJumpControls : public GuiElement
{
private:
    P<PlayerSpaceship> target_spaceship;
    GuiKeyValueDisplay* label;
    GuiSlider* slider;
    GuiButton* button;
    GuiProgressbar* charge_bar;
    GuiPowerDamageIndicator* pdi;
public:
    GuiJumpControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship);

    virtual void onDraw(sp::RenderTarget& target) override;
    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship);
    virtual void onUpdate() override;
};

#endif//JUMP_CONTROLS_H
