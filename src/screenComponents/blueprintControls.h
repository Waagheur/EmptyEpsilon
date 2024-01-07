#ifndef BLUEPRINT_CONTROLS_H
#define BLUEPRINT_CONTROLS_H

#include "gui/gui2_element.h"
#include "spaceObjects/playerSpaceship.h"

class GuiButton;
class GuiProgressbar;
class GuiLabel;
class GuiToggleButton;
class GuiPowerDamageIndicator;

class GuiBlueprintsControls : public GuiElement
{
private:
    struct BlueprintRow {
        GuiElement* layout;
        GuiToggleButton* bp_toggle_button;
        GuiProgressbar* loading_bar;
        GuiLabel* loading_label;
        string compo_name;
    };
    P<PlayerSpaceship> target_spaceship;
    std::vector<BlueprintRow> rows;
    GuiPowerDamageIndicator* pdi;
public:
    GuiBlueprintsControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship);

    virtual void onUpdate() override;
    virtual void onDraw(sp::RenderTarget& target) override;

    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship);


};

#endif//MISSILE_TUBE_CONTROLS_H
