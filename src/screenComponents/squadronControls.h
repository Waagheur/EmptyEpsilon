#ifndef SQUADRON_CONTROLS_H
#define SQUADRON_CONTROLS_H

#include "gui/gui2_element.h"
#include "spaceObjects/playerSpaceship.h"

class GuiButton;
class GuiProgressbar;
class GuiLabel;
class GuiToggleButton;
class GuiPowerDamageIndicator;

class GuiSquadronControls : public GuiElement
{
private:
    struct SquadronRow {
        GuiElement* layout;
        GuiButton* squadron_selector;
        GuiButton* order_show_and_change;
        GuiLabel* order_desc;
        string squadron_name;
    };
    P<PlayerSpaceship> target_spaceship;
    std::vector<SquadronRow> rows;
    GuiPowerDamageIndicator* pdi;
public:
    GuiSquadronControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship);

    virtual void onUpdate() override;

    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship);


};

#endif//MISSILE_TUBE_CONTROLS_H
