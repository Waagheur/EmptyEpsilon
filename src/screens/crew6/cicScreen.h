#ifndef CIC_SCREEN_H
#define CIC_SCREEN_H

#include "screenComponents/targetsContainer.h"
#include "gui/gui2_overlay.h"

class GuiRadarView;
class GuiKeyValueDisplay;
class GuiButton;
class GuiToggleButton;
class GuiSlider;
class GuiLabel;
class GuiHackingDialog;
class GuiHackDialog;
class GuiTextEntry;
class GuiSelector;
class GuiProgressbar;

class CicScreen : public GuiOverlay
{
private:
    enum EMode
    {
        TargetSelection,
        WaypointPlacement,
        MoveWaypoint
    };

    EMode mode;
    TargetsContainer targets;
    P<SpaceObject> target;
    int drag_waypoint_index;
    GuiRadarView* radar;

    GuiKeyValueDisplay* info_distance;
    GuiKeyValueDisplay* info_radar_range;
    GuiKeyValueDisplay* info_callsign;
    GuiKeyValueDisplay* info_faction;
    GuiKeyValueDisplay* info_probe;

    //GuiKeyValueDisplay* info_reputation;
    GuiButton* center_screen_button;
    GuiSelector* station_selector;
    
    GuiSelector* squadron_type_selector;
    
    //GuiKeyValueDisplay* info_reputation;
    GuiKeyValueDisplay* info_clock;
    GuiElement* option_buttons;
    GuiElement* bp_layout;
    GuiElement* sqc_layout;
    GuiElement* launched_squadron_layout;
    GuiToggleButton* link_to_3D_port_button;
    GuiElement* waypoints_layout;
    GuiButton* add_waypoint_button;
    GuiButton* delete_waypoint_button;
    GuiElement* view_controls;
    GuiKeyValueDisplay* nbr_squadrons;

    GuiSlider* zoom_slider;
    GuiLabel* zoom_label;

    GuiSelector *launch_selector{nullptr};
    GuiButton *launch_button;
    GuiProgressbar *launch_progress;

    string waiting_squadron_selected_for_launch{""};

    glm::vec2 mouse_down_position;
    const float max_distance = 10000000.0f;
    const float min_distance = 6250.0f;
    float distance;
public:
    CicScreen(GuiContainer* owner, bool allow_comms);

    virtual void onDraw(sp::RenderTarget& target) override;
    virtual void onUpdate() override;
};

#endif //CIC_SCREEN_H
