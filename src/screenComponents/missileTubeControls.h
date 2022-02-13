#ifndef MISSILE_TUBE_CONTROLS_H
#define MISSILE_TUBE_CONTROLS_H

#include "gui/gui2_element.h"
#include "missileWeaponData.h"
#include "spaceObjects/playerSpaceship.h"

class GuiButton;
class GuiProgressbar;
class GuiLabel;
class GuiToggleButton;
class GuiPowerDamageIndicator;

class GuiMissileTubeControls : public GuiElement
{
private:
    struct TubeRow {
        GuiElement* layout;
        GuiButton* load_button;
        GuiButton* fire_button;
        GuiProgressbar* loading_bar;
        GuiLabel* loading_label;
    };
    P<PlayerSpaceship> target_spaceship;
    std::vector<TubeRow> rows;
    class TypeRow {
    public:
        GuiElement* layout;
        GuiToggleButton* button;
    };
    std::vector<TypeRow> load_type_rows;
    string load_type;
    bool manual_aim;
    float missile_target_angle;
    GuiPowerDamageIndicator* pdi;
public:
    GuiMissileTubeControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship);

    virtual void onDraw(sp::RenderTarget& target) override;
    virtual void onUpdate() override;

    void setMissileTargetAngle(float angle);
    float getMissileTargetAngle();

    void setManualAim(bool manual);
    bool getManualAim();
    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship);

private:
    void selectMissileWeapon(EMissileWeapons type);
};

#endif//MISSILE_TUBE_CONTROLS_H
