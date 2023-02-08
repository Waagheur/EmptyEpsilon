#ifndef AIM_LOCK_H
#define AIM_LOCK_H

#include "gui/gui2_togglebutton.h"
#include "P.h"
#include "spaceObjects/playerSpaceship.h"
#include "gui/gui2_rotationdial.h"
#include "screenComponents/radarView.h"

class GuiMissileTubeControls;
class GuiRotationDial;
class PlayerSpaceship;
class AimLockButton : public GuiToggleButton
{
public:
    AimLockButton(GuiContainer* owner, string id, GuiMissileTubeControls* tube_controls, GuiRotationDial* missile_aim, P<PlayerSpaceship> targetSpaceship);

    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship){target_spaceship = targetSpaceship;}
    virtual void onUpdate() override;
private:
    P<PlayerSpaceship> target_spaceship;
    GuiMissileTubeControls* tube_controls;
    GuiRotationDial* missile_aim;

    void setAimLock(bool value);
};

class AimLock : public GuiRotationDial {
public:
    AimLock(GuiContainer* owner, string id, GuiRadarView* radar, float min_value, float max_value, float start_value, func_t func);

    virtual void onDraw(sp::RenderTarget& target) override;
    virtual bool onMouseDown(sp::io::Pointer::Button button, glm::vec2 position, sp::io::Pointer::ID id) override;
    virtual void onMouseDrag(glm::vec2 position, sp::io::Pointer::ID id) override;
    virtual void onMouseUp(glm::vec2 position, sp::io::Pointer::ID id) override;
private:
    GuiRadarView* radar;
};

#endif//AIM_LOCK_H
