#include "playerInfo.h"
#include "navigationScreen.h"
#include "spaceObjects/playerSpaceship.h"
#include "spaceObjects/scanProbe.h"
#include "scriptInterface.h"
#include "gameGlobalInfo.h"

#include "screenComponents/navigationView.h"
#include "screenComponents/openCommsButton.h"
#include "screenComponents/commsOverlay.h"
#include "screenComponents/shipsLogControl.h"
#include "screenComponents/hackingDialog.h"
#include "screenComponents/customShipFunctions.h"

#include "gui/gui2_autolayout.h"
#include "gui/gui2_keyvaluedisplay.h"
#include "gui/gui2_selector.h"
#include "gui/gui2_slider.h"
#include "gui/gui2_label.h"
#include "gui/gui2_togglebutton.h"
#include "gui/gui2_textentry.h"

NavigationScreen::NavigationScreen(GuiContainer *owner)
    : GuiOverlay(owner, "NAVIGATION_SCREEN", colorConfig.background), mode(TargetSelection)
{
    targets.setAllowWaypointSelection();
    radar = new NavigationView(this, "NAVIGATION_RADAR", min_distance, &targets);
    radar->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    radar->setCallbacks(
        [this](glm::vec2 position) { //down
            if (mode == TargetSelection && targets.getWaypointIndex() > -1 && my_spaceship)
            {
                if (glm::length(my_spaceship->waypoints[targets.getWaypointIndex()] - position) < 25.0 / radar->getScale())
                {
                    mode = MoveWaypoint;
                    drag_waypoint_index = targets.getWaypointIndex();
                }
            }
            mouse_down_position = position;
        },
        [this](glm::vec2 position) { //drag
            if (mode == TargetSelection)
            {
                position_text_custom = false;
                glm::vec2 newPosition = radar->getViewPosition() - (position - mouse_down_position);
                radar->setViewPosition(newPosition);
                if (!position_text_custom)
                    position_text->setText(getStringFromPosition(newPosition));
            }
            if (mode == MoveWaypoint && my_spaceship)
                my_spaceship->commandMoveWaypoint(drag_waypoint_index, position);
        },
        [this](glm::vec2 position) { //up
            switch (mode)
            {
            case TargetSelection:
                targets.setToClosestTo(position, 25.0 / radar->getScale(), TargetsContainer::Targetable, my_spaceship);
                break;
            case WaypointPlacement:
                if (my_spaceship)
                    my_spaceship->commandAddWaypoint(position);
                mode = TargetSelection;
                option_buttons->show();
                break;
            case MoveWaypoint:
                mode = TargetSelection;
                targets.setWaypointIndex(drag_waypoint_index);
                break;
            }
        });

    if (my_spaceship)
        radar->setViewPosition(my_spaceship->getPosition());

    // Controls for the radar view
    view_controls = new GuiAutoLayout(this, "VIEW_CONTROLS", GuiAutoLayout::LayoutVerticalBottomToTop);
    view_controls->setPosition(20, -70, sp::Alignment::BottomLeft)->setSize(250, GuiElement::GuiSizeMax);
    zoom_slider = new GuiSlider(view_controls, "ZOOM_SLIDER", max_distance, min_distance, radar->getDistance(), [this](float value) {
        zoom_label->setText("Zoom: " + string(max_distance / value, 1.0f) + "x");
        radar->setDistance(value);
    });
    zoom_slider->setPosition(20, -70, sp::Alignment::BottomLeft)->setSize(GuiElement::GuiSizeMax, 50);
    zoom_slider->setVisible(false);
    zoom_label = new GuiLabel(zoom_slider, "", "Zoom: " + string(max_distance / radar->getDistance(), 1.0f) + "x", 30);
    zoom_label->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    position_text_custom = false;
    position_text = new GuiTextEntry(view_controls, "SECTOR_NAME_TEXT", "");
    position_text->setSize(GuiElement::GuiSizeMax, 50);
    position_text->callback([this](string text) {
        position_text_custom = true;
    });
    position_text->validator(isValidPositionString);
    position_text->enterCallback([this](string text) {
        position_text_custom = false;
        if (position_text->isValid())
        {
            glm::vec2 pos = getPositionFromSring(text);
            radar->setViewPosition(pos);
        }
    });
    position_text->setText(getStringFromPosition(radar->getViewPosition()));
    // Option buttons for comms, waypoints, and probes.
    option_buttons = new GuiAutoLayout(this, "BUTTONS", GuiAutoLayout::LayoutVerticalTopToBottom);
    option_buttons->setPosition(20, 50, sp::Alignment::TopLeft)->setSize(250, GuiElement::GuiSizeMax);

    // Manage waypoints.
    (new GuiButton(option_buttons, "WAYPOINT_PLACE_BUTTON", "Place Waypoint", [this]() {
        mode = WaypointPlacement;
        option_buttons->hide();
    }))
        ->setSize(GuiElement::GuiSizeMax, 50);

    delete_waypoint_button = new GuiButton(option_buttons, "WAYPOINT_DELETE_BUTTON", "Delete Waypoint", [this]() {
        if (my_spaceship && targets.getWaypointIndex() >= 0)
        {
            my_spaceship->commandRemoveWaypoint(targets.getWaypointIndex());
        }
    });
    delete_waypoint_button->setSize(GuiElement::GuiSizeMax, 50);

    (new GuiCustomShipFunctions(this, navigation, "", my_spaceship))->setPosition(-20, 240, sp::Alignment::TopRight)->setSize(250, GuiElement::GuiSizeMax);
}
 void NavigationScreen::onDraw(sp::RenderTarget& renderer)
{
    ///Handle mouse wheel
    float mouse_wheel_delta = InputHandler::getMouseWheelDelta();
    if (mouse_wheel_delta != 0.0)
    {
        float view_distance = radar->getDistance() * (1.0 - (mouse_wheel_delta * 0.1f));
        zoom_slider->setValue(view_distance);
        view_distance = zoom_slider->getValue();
        radar->setDistance(view_distance);
        zoom_label->setText("Zoom: " + string(max_distance / view_distance, 1.0f) + "x");
    }
    ///!

    GuiOverlay::onDraw(window);

    if (targets.getWaypointIndex() >= 0)
        delete_waypoint_button->enable();
    else
        delete_waypoint_button->disable();
}
