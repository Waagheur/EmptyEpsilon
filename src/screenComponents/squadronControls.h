#ifndef SQUADRON_CONTROLS_H
#define SQUADRON_CONTROLS_H

#include "gui/gui2_element.h"
#include "spaceObjects/playerSpaceship.h"
#include "targetsContainer.h"

class GuiButton;
class GuiProgressbar;
class GuiLabel;
class GuiToggleButton;
class GuiPowerDamageIndicator;
class GuiKeyValueDisplay;
class GuiRadarView;

class GuiSquadronControls : public GuiElement
{
private:
    struct SquadronRow {
        GuiElement* layout;
        GuiToggleButton* squadron_button;
        GuiButton* order_show_and_change;
        GuiButton* target_show_and_change;
        GuiKeyValueDisplay* order_target_desc;
        GuiButton* validate_button;
        GuiButton* recall_button;
    };
    P<PlayerSpaceship> target_spaceship;
    std::map<string, SquadronRow> name_to_rows;
    GuiPowerDamageIndicator* pdi;
    GuiRadarView* radar;
    TargetsContainer& targets_squadron;

    void updateSquadronRows();
    void selectSquadron(const string& name);
public:
    GuiSquadronControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship, GuiRadarView* radar, TargetsContainer &targets_squadron);

    virtual void onUpdate() override;

    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship);


};

#endif//MISSILE_TUBE_CONTROLS_H
