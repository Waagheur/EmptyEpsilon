#ifndef BEAM_TARGET_SELECTOR_H
#define BEAM_TARGET_SELECTOR_H

#include "gui/gui2_selector.h"
#include "screenComponents/targetsContainer.h"

class SpaceObject;
class GuiSelector;
class GuiPowerDamageIndicator;

class GuiBeamTargetSelector : public GuiElement
{
private:
    P<PlayerSpaceship> target_spaceship;
    P<SpaceObject> target;
    TargetsContainer targets;
    GuiPowerDamageIndicator* pdi;

    GuiSelector* selector;

public:
    GuiBeamTargetSelector(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship);

    virtual void onDraw(sp::RenderTarget& renderer) override;
    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship);
    virtual void onUpdate() override;
};

#endif//BEAM_TARGET_SELECTOR_H
