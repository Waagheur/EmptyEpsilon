#ifndef LAUNCH_SQUADRON_CONTROLS_H
#define LAUNCH_SQUADRON_CONTROLS_H

#include "gui/gui2_element.h"
#include "spaceObjects/playerSpaceship.h"

class GuiButton;
class GuiProgressbar;
class GuiLabel;
class GuiPowerDamageIndicator;
class GuiSelector;

class GuiLaunchSquadronControls : public GuiElement
{
private:
    struct LaunchSquadronRow {
        GuiElement *layout;
        GuiSelector *launch_selector{nullptr};
        GuiButton *launch_button;
        GuiProgressbar *launch_progress;
        string waiting_squadron_selected_for_launch{};
    };
    P<PlayerSpaceship> target_spaceship;
    std::vector<LaunchSquadronRow> rows;
    GuiPowerDamageIndicator* pdi;

    
public:
    GuiLaunchSquadronControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship);

    virtual void onUpdate() override;
    virtual void onDraw(sp::RenderTarget& target) override;

    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship);


};

#endif//MISSILE_TUBE_CONTROLS_H
