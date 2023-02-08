#ifndef WARP_CONTROLS_H
#define WARP_CONTROLS_H

#include "gui/gui2_element.h"
#include "spaceObjects/playerSpaceship.h"

class PlayerSpaceship;
class GuiKeyValueDisplay;
class GuiSlider;
class GuiPowerDamageIndicator;

class GuiWarpControls : public GuiElement
{
private:
    P<PlayerSpaceship> target_spaceship;
    GuiKeyValueDisplay* label;
    GuiSlider* slider;
    GuiPowerDamageIndicator* pdi;
    bool launch_sound_played;
public:
    GuiWarpControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship);

    virtual void onDraw(sp::RenderTarget& target) override;
    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship);
    virtual void onUpdate() override;
};

#endif//WARP_CONTROLS_H
