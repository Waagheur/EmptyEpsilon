#ifndef ENGINEERING_SCREEN_H
#define ENGINEERING_SCREEN_H

#include "gui/gui2_overlay.h"
#include "shipTemplate.h"
#include "playerInfo.h"

class GuiKeyValueDisplay;
class GuiLabel;
class GuiSlider;
class GuiAutoLayout;
class GuiImage;
class GuiArrow;
class GuiToggleButton;
class GuiProgressbar;
class GuiProgressSlider;
class GuiPowerDamageIndicator;

class EngineeringScreen : public GuiOverlay
{
private:
    GuiOverlay* background_gradient;
    GuiOverlay* background_crosses;

    GuiKeyValueDisplay* energy_display;
    GuiKeyValueDisplay* hull_display;
    GuiKeyValueDisplay* shields_display;
    GuiKeyValueDisplay* oxygen_display;
    GuiLabel* power_label;
    GuiSlider* power_slider;
    GuiLabel* coolant_label;
    GuiSlider* coolant_slider;
    GuiLabel* total_coolant_label;
    
    class SystemRow
    {
    public:
        GuiAutoLayout* layout;
        GuiToggleButton* button;
        GuiPowerDamageIndicator* state;
        GuiProgressbar* max_health_bar;
        GuiProgressbar* damage_bar;
        GuiLabel* damage_label;
        GuiProgressbar* heat_bar;
        GuiArrow* heat_arrow;
        GuiImage* heat_icon;
        GuiProgressSlider* power_bar;
        GuiProgressSlider* coolant_bar;
    };
    std::vector<SystemRow> system_rows;
    GuiAutoLayout* system_effects_container;
    std::vector<GuiKeyValueDisplay*> system_effects;
    unsigned int system_effects_index;
    ESystem selected_system;

    float previous_energy_measurement;
    float previous_energy_level;
    float average_energy_delta;

    void addSystemEffect(string key, string value, sf::Color color = sf::Color::White);
    void selectSystem(ESystem system);
public:
    EngineeringScreen(GuiContainer* owner, ECrewPosition crew_position=engineering);

    virtual void onDraw(sf::RenderTarget& window) override;
    virtual void onHotkey(const HotkeyResult& key) override;
    virtual bool onJoystickAxis(const AxisAction& axisAction) override;
};

#endif//ENGINEERING_SCREEN_H
