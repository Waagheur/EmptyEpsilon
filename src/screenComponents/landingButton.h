#ifndef LANDING_BUTTON_H
#define LANDING_BUTTON_H

#include "gui/gui2_button.h"
#include "spaceObjects/playerSpaceship.h"

class SpaceObject;
class GuiLandingButton : public GuiButton
{
private:
    P<PlayerSpaceship> landing_spaceship;

public:
    GuiLandingButton(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship);

    virtual void onDraw(sp::RenderTarget& renderer) override;
    virtual void onUpdate() override;
    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship){landing_spaceship = targetSpaceship;}

private:
    void click();

    P<SpaceObject> findLandingTarget();
};

#endif//LANDING_BUTTON_H
