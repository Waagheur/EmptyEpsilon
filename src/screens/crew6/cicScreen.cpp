#include "cicScreen.h"
#include "gameGlobalInfo.h"
#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "spaceObjects/wormHole.h"
#include "spaceObjects/scanProbe.h"
#include "spaceObjects/planet.h"
#include "scriptInterface.h"
#include "gameGlobalInfo.h"
#include "main.h" //bold_font

#include "screenComponents/radarView.h"
#include "screenComponents/openCommsButton.h"
#include "screenComponents/commsOverlay.h"
#include "screenComponents/shipsLogControl.h"
#include "screenComponents/customShipFunctions.h"
#include "screenComponents/alertLevelButton.h"
#include "screenComponents/blueprintControls.h"
#include "screenComponents/squadronControls.h"

#include "gui/gui2_keyvaluedisplay.h"
#include "gui/gui2_selector.h"
#include "gui/gui2_slider.h"
#include "gui/gui2_label.h"
#include "gui/gui2_togglebutton.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_textentry.h"


CicScreen::CicScreen(GuiContainer* owner, bool allow_comms)
: GuiOverlay(owner, "CIC_SCREEN", colorConfig.background), mode(TargetSelection)
{
    targets.setAllowWaypointSelection();
    radar = new GuiRadarView(this, "CIC_RADAR", 50000.0f, &targets, my_spaceship);
    //radar long range is only for two things : draw ship without beam arc etc. and set distance. This is hacky.
    radar->longRange()->enableWaypoints()->enableCallsigns()->setStyle(GuiRadarView::Rectangular)->setFogOfWarStyle(GuiRadarView::FriendlysShortRangeFogOfWar);
    radar->setAutoCentering(false);
    radar->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    radar->setCallbacks(
        [this](sp::io::Pointer::Button button, glm::vec2 position) { //down
            if (mode == TargetSelection && targets.getWaypointIndex() > -1 && my_spaceship)
            {
                if (glm::length(my_spaceship->waypoints[targets.getWaypointIndex()] - position) < 1000.0f)
                {
                    mode = MoveWaypoint;
                    drag_waypoint_index = targets.getWaypointIndex();
                }
            }
            mouse_down_position = position;
        },
        [this](glm::vec2 position) { //drag
            // if (mode == TargetSelection)
            //     {
            //         position_text_custom = false;
            //         glm::vec2 newPosition = radar->getViewPosition() - (position - mouse_down_position);
            //         radar->setViewPosition(newPosition);
            //         if(!position_text_custom && my_spaceship)
            //             position_text->setText(getStringFromPosition(newPosition, my_spaceship->correction_x, my_spaceship->correction_y));
            //     }
            if (mode == MoveWaypoint && my_spaceship)
                my_spaceship->commandMoveWaypoint(drag_waypoint_index, position);
        },
        [this](glm::vec2 position) { //up
            switch(mode)
            {
            case TargetSelection:
                targets.setToClosestTo(position, 1000, TargetsContainer::Selectable, my_spaceship);
                break;
            case WaypointPlacement:
                if (my_spaceship)
                    my_spaceship->commandAddWaypoint(position);
                mode = TargetSelection;
                option_buttons->show();
                bp_layout->show();
                break;
            case MoveWaypoint:
                mode = TargetSelection;
                targets.setWaypointIndex(drag_waypoint_index);
                break;
            }
        }
    );

    if (my_spaceship)
        radar->setViewPosition(my_spaceship->getPosition());

    auto sidebar = new GuiElement(this, "SIDE_BAR");
    sidebar->setPosition(-20, 150, sp::Alignment::TopRight)->setSize(250, GuiElement::GuiSizeMax)->setAttribute("layout", "vertical");

    info_distance = new GuiKeyValueDisplay(sidebar, "DISTANCE", 0.4, tr("Distance"), "");
    info_distance->setSize(GuiElement::GuiSizeMax, 30);

    info_radar_range = new GuiKeyValueDisplay(sidebar, "RADAR_RANGE", 0.4, tr("Radar range"), "");
    info_radar_range->setSize(GuiElement::GuiSizeMax, 30);

    info_callsign = new GuiKeyValueDisplay(sidebar, "SCIENCE_CALLSIGN", 0.4, tr("Callsign"), "");
    info_callsign->setSize(GuiElement::GuiSizeMax, 30);

    info_faction = new GuiKeyValueDisplay(sidebar, "SCIENCE_FACTION", 0.4, tr("Faction"), "");
    info_faction->setSize(GuiElement::GuiSizeMax, 30);

    // Controls for the radar view
    view_controls = new GuiElement(this, "VIEW_CONTROLS");
    view_controls->setPosition(20, -70, sp::Alignment::BottomLeft)->setSize(250, GuiElement::GuiSizeMax)->setAttribute("layout", "verticalbottom");;
    zoom_slider = new GuiSlider(this, "ZOOM_SLIDER", max_distance, min_distance, 50000.0f, [this](float value) {
        zoom_label->setText(tr("Zoom: {zoom}x").format({{"zoom", string(max_distance / value, 1.0f)}}));
        radar->setDistance(value);
    });
    zoom_slider->setPosition(20, -70, sp::Alignment::BottomLeft)->setSize(GuiElement::GuiSizeMax, 50);
    zoom_slider->setVisible(false);
    zoom_label = new GuiLabel(zoom_slider, "", "Zoom: " + string(max_distance / radar->getDistance(), 1.0f) + "x", 30);
    zoom_label->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

   
    // Option buttons for waypoints.
    option_buttons = new GuiElement(this, "BUTTONS");
    option_buttons->setPosition(20, 50, sp::Alignment::TopLeft)->setSize(250, GuiElement::GuiSizeMax)->setAttribute("layout", "vertical");

    (new GuiLabel(option_buttons, "", " ", 30))->setSize(GuiElement::GuiSizeMax, 50);

    // Manage waypoints.
    waypoints_layout = new GuiElement(option_buttons, "WAYPOINTS_LAYOUT");
    waypoints_layout -> setSize(GuiElement::GuiSizeMax, 50)->setAttribute("layout", "horizontal");;

    (new GuiLabel(waypoints_layout, "", tr("Place Waypoint"), 30))->setAlignment(sp::Alignment::Center)->setSize(150, 50);
    add_waypoint_button = new GuiButton(waypoints_layout, "WAYPOINT_PLACE_BUTTON", "+", [this]() {
        mode = WaypointPlacement;
        option_buttons->hide();

    });
    add_waypoint_button->setSize(50, 50);

    delete_waypoint_button = new GuiButton(waypoints_layout, "WAYPOINT_DELETE_BUTTON", "-", [this]() {
        if (my_spaceship && targets.getWaypointIndex() >= 0)
        {
            my_spaceship->commandRemoveWaypoint(targets.getWaypointIndex());
        }
    });
    delete_waypoint_button->setSize(50, 50);

    // Center screen
    center_screen_button = new GuiButton(option_buttons, "CENTER_SCREEN_BUTTON", tr("Recenter radar"), [this]() {
        if (my_spaceship)
        {
            radar->setViewPosition(my_spaceship->getPosition());
            //position_text->setText(getStringFromPosition(my_spaceship->getPosition(), my_spaceship->correction_x, my_spaceship->correction_y));
        }
    });
    center_screen_button->setSize(GuiElement::GuiSizeMax, 50);
    center_screen_button->setIcon("gui/icons/lock");;

    // Scenario clock display.
    info_clock = new GuiKeyValueDisplay(option_buttons, "INFO_CLOCK", 0.4f, tr("Clock") + ":", "");
    info_clock->setSize(GuiElement::GuiSizeMax, 40);

    nbr_squadrons = new GuiKeyValueDisplay(option_buttons, "NBR_SQUADRON", 0.4f, tr("cic","Number of squadons") + ":", "");
    nbr_squadrons->setSize(GuiElement::GuiSizeMax, 40);

    //bp_layout = new GuiElement(this, "BLUEPRINTS_LAYOUT");
    bp_layout = new GuiBlueprintsControls(this, "BLUEPRINTS_LAYOUT", my_spaceship);
    bp_layout->setPosition(20, 300, sp::Alignment::TopLeft)->setSize(250, GuiElement::GuiSizeMax)->setAttribute("layout", "vertical");

    sqc_layout = new GuiElement(this, "SQUADRON_CONTROL");
    sqc_layout->setPosition(20, 500, sp::Alignment::TopLeft)->setSize(250, GuiElement::GuiSizeMax)->setAttribute("layout", "horizontal");

    launch_selector = new GuiSelector(sqc_layout, "SQUADRON_LAUNCH_SELECTOR", [this](int index, string value)
    {
        waiting_squadron_selected_for_launch = launch_selector->getEntryName(index);
    });
    launch_selector->setSize(200, 50);
    launch_button = new GuiButton(sqc_layout, "SQUADRON_LAUNCH_BUTTON", tr("cic","Launch"), [this]() {
        if(my_spaceship)
        {
             my_spaceship->requestLaunchWaitingSquadron(waiting_squadron_selected_for_launch);
        }

    });
    launch_button->setSize(100, 50);

    launch_progress = new GuiProgressbar(sqc_layout, "SQUADRON_LAUNCH_PROGRESS", 0, 1.0, 0);
    launch_progress->setSize(100, 50);
    launch_progress->hide();

    launched_squadron_layout = new GuiSquadronControls(this, "LAUNCHED_SQUADRON_LAYOUT", my_spaceship);
    launched_squadron_layout->setPosition(20, 600, sp::Alignment::TopLeft)->setSize(250, GuiElement::GuiSizeMax)->setAttribute("layout", "vertical");

    //(new GuiAlertLevelSelect(this, ""))->setPosition(-20, -70, sp::Alignment::BottomRight)->setSize(300, GuiElement::GuiSizeMax)->setAttribute("layout", "verticalbottom");

    (new GuiCustomShipFunctions(this, cagOfficer, "", my_spaceship))->setPosition(-20, 350, sp::Alignment::TopRight)->setSize(250, GuiElement::GuiSizeMax);

    new ShipsLog(this,"generic");
    if (allow_comms)
    {
        (new GuiCommsOverlay(this))->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    }
}

void CicScreen::onDraw(sp::RenderTarget& renderer)
{
    ///Handle mouse wheel
    float mouse_wheel_delta = keys.zoom_in.getValue() - keys.zoom_out.getValue();
    if (mouse_wheel_delta != 0.0f)
    {
        float view_distance = radar->getDistance() * (1.0f - (mouse_wheel_delta * 0.1f));
        zoom_slider->setValue(view_distance);
        view_distance = zoom_slider->getValue();
        radar->setDistance(view_distance);
        zoom_label->setText("Zoom: " + string(max_distance / view_distance, 1.0f) + "x");
    }
    ///!

    GuiOverlay::onDraw(renderer);

    // TODO revoir ce que c'est que tous ces trucs avant targets.get
    // Info range radar
    float radar_range = 5000.0;
    if (my_spaceship)
    {
        radar_range = my_spaceship->getShortRangeRadarRange();
        info_radar_range -> setValue(string(radar_range / 1000.0f, 1.0f) + " U");
    }

    // Info Distance
    if (my_spaceship)
    {
        float ratio_screen = radar->getRect().size.x / radar->getRect().size.y;
        float distance_width = radar->getDistance() /** 2.f*/ * ratio_screen / 1000.0f;
        float distance_height = radar->getDistance() /** 2.f*/ / 1000.0f;
        if (distance_width < 100)
            info_distance -> setValue(string(distance_width, 1.0f) + " U / " + string(distance_height, 1.0f) + " U");
        else
            info_distance -> setValue(string(distance_width, 0.0f) + " U / " + string(distance_height, 0.0f) + " U");
    }

    info_faction->setValue("-");
    if (targets.get() && my_spaceship)
    {
        // Check each object to determine whether the target is still within
        // shared radar range of a friendly object.
        P<SpaceObject> target = targets.get();
        bool near_friendly = false;

        // For each SpaceObject on the map...
        foreach(SpaceObject, obj, space_object_list)
        {
            // POUR DAID VERSION
            // Consider the object only if it is:
            // - Any ShipTemplateBasedObject (ship or station)
            // - A SpaceObject belonging to a friendly faction
            // - The player's ship
            // - A scan probe owned by the player's ship
            // This check is duplicated from GuiRadarView::drawObjects.

            // C'est different ici 

            P<ShipTemplateBasedObject> stb_obj = obj;

            if ((!stb_obj && !P<WormHole>(obj) && !P<Planet>(obj)) 
                || (!obj->isFriendly(my_spaceship) && obj != my_spaceship))
            {
                P<ScanProbe> sp = obj;

                if (!sp || sp->owner_id != my_spaceship->getMultiplayerId())
                {
                    continue;
                }
            }

            // Set the targetable radius to getShortRangeRadarRange() if the
            // object's a ShipTemplateBasedObject. Otherwise, default to 5U.
            float r = stb_obj ? stb_obj->getShortRangeRadarRange() : 5000.0f;

            // If the target is within the short-range radar range/5U of the
            // object, consider it near a friendly object.
            if (glm::length2(obj->getPosition() - target->getPosition()) < r * r)
            {
                near_friendly = true;
                break;
            }
        }

        if (!near_friendly)
        {
            // If the target is no longer near a friendly object, unset it as
            // the target.
            targets.clear();
        }
    }

    if (targets.get() && my_spaceship)
    {
        P<SpaceObject> obj = targets.get();
        P<SpaceShip> ship = obj;
        P<SpaceStation> station = obj;
        P<ScanProbe> probe = obj;

        distance = glm::length(obj->getPosition() - my_spaceship->getPosition()) / 1000.0f;
        info_distance -> setValue(string(distance, 1.0f) + " U");

        info_callsign->setValue(obj->getCallSign());

        if (factionInfo[obj->getFactionId()]) {
            if (ship)
            {
                if (ship->getScannedStateFor(my_spaceship) >= SS_SimpleScan)
                {
                    info_faction->setValue(factionInfo[obj->getFactionId()]->getLocaleName());
                }
            }else{
                info_faction->setValue(factionInfo[obj->getFactionId()]->getLocaleName());
            }
        }

    }
    else
    {
        info_callsign->setValue("-");
    }
    if (my_spaceship)
    {
        //info_reputation->setValue(string(my_spaceship->getReputationPoints(), 0)); //tsht : TODO voir si on peut reajouter
        info_clock->setValue(gameGlobalInfo->getMissionTime());
    }
      if (my_spaceship)
    {
        const unsigned int total = my_spaceship->getLaunchedSquadronsCount();
        nbr_squadrons->setValue(string(total) + " / " + string(my_spaceship->getMaximumNumberOfSquadronsInFlight()));
    }

    if (targets.getWaypointIndex() >= 0)
    {
        delete_waypoint_button->enable();
        distance = glm::length(my_spaceship->waypoints[targets.getWaypointIndex()] - my_spaceship->getPosition()) / 1000.0f;
        info_distance -> setValue(string(distance, 1.0f) + " U");
    }
    else
        delete_waypoint_button->disable();

    int n = 0;
    for(auto &[id,template_name] : my_spaceship->getWaitingSquadrons())
    {
        int idx;
        if((idx = launch_selector->indexByValue(string(n))) != -1)
        {
            if(launch_selector->getEntryName(idx) != id)
            {
                launch_selector->removeEntry(idx);
            }
        }
        if(launch_selector->indexByValue(string(n)) == -1)
        {
            launch_selector->addEntry(id, string(n));
        }
        n++;
    }
    while(n <= launch_selector->entryCount())
    {
        launch_selector->removeEntry(n);
        n++;
    }
    //position_entry->setVisible(position_text->isFocus());

    if(my_spaceship->isLaunchingSquadron())
    {
        launch_progress->show();
        launch_progress->setValue(my_spaceship->getLaunchSquadronProgression());
        launch_button->hide();
    }
    else
    {
        launch_progress->hide();
        launch_button->show();
    }
}

void CicScreen::onUpdate()
{
    if (my_spaceship)
    {
        float radar_range = my_spaceship->getShortRangeRadarRange();

        if (keys.relay_next_enemy.getDown())
        {
            bool current_found = false;
            foreach(SpaceObject, obj, space_object_list)
            {
                if (obj == targets.get())
                {
                    current_found = true;
                    continue;
                }
                if (current_found && glm::length(obj->getPosition() - my_spaceship->getPosition()) < radar->getDistance() && my_spaceship->isEnemy(obj) && my_spaceship->getScannedStateFor(obj) >= SS_FriendOrFoeIdentified && obj->canBeTargetedBy(my_spaceship))
                {
                    targets.set(obj);
                    // my_spaceship->commandSetTarget(targets.get());
                    return;
                }
            }
            foreach(SpaceObject, obj, space_object_list)
            {
                if (obj == targets.get())
                {
                    continue;
                }
                if (my_spaceship->isEnemy(obj) && glm::length(obj->getPosition() - my_spaceship->getPosition()) < radar->getDistance() && my_spaceship->getScannedStateFor(obj) >= SS_FriendOrFoeIdentified && obj->canBeTargetedBy(my_spaceship))
                {
                    targets.set(obj);
                    // my_spaceship->commandSetTarget(targets.get());
                    return;
                }
            }
        }
        if (keys.relay_next.getDown())
        {
            bool current_found = false;
            PVector<SpaceObject> list_range;
            PVector<SpaceObject> list_range_obj_relai;

            list_range = my_spaceship->getObjectsInRange(radar_range);
            foreach(SpaceObject, obj, list_range)
            {
                if (obj == targets.get())
                {
                    current_found = true;
                    continue;
                }
                if (obj == my_spaceship)
                    continue;
                if (current_found && glm::length(obj->getPosition() - my_spaceship->getPosition()) < radar->getDistance() && obj->canBeTargetedBy(my_spaceship))
                {
                    targets.set(obj);
                    return;
                }
            }
            foreach(SpaceObject, obj_relai, space_object_list)
            {
                // P<ScanProbe> test = obj_relai;
                if(obj_relai->isFriendly(my_spaceship))
                {
                    list_range_obj_relai = obj_relai->getObjectsInRange(radar_range);
                    foreach(SpaceObject, obj, list_range_obj_relai)
                    {
                        if (obj == targets.get())
                        {
                            current_found = true;
                            continue;
                        }
                        if (obj == my_spaceship)
                            continue;
                        if (current_found && glm::length(obj->getPosition() - obj_relai->getPosition()) < radar->getDistance() && obj->canBeTargetedBy(my_spaceship))
                        {
                            targets.set(obj);
                            return;
                        }
                    }
                }
            }

            list_range = my_spaceship->getObjectsInRange(radar_range);
            foreach(SpaceObject, obj, list_range)
            {
                if (obj == targets.get()  || obj == my_spaceship)
                    continue;
                if (glm::length(obj->getPosition() - my_spaceship->getPosition()) < radar->getDistance() && obj->canBeTargetedBy(my_spaceship))
                {
                    targets.set(obj);
                    return;
                }
            }
            foreach(SpaceObject, obj_relai, space_object_list)
            {
                // P<ScanProbe> test = probe;
                if(obj_relai->isFriendly(my_spaceship))
                {
                    list_range_obj_relai = obj_relai->getObjectsInRange(radar_range);
                    foreach(SpaceObject, obj, list_range_obj_relai)
                    {
                        if (obj == targets.get() || obj == my_spaceship)
                            continue;
                        if (glm::length(obj->getPosition() - obj_relai->getPosition()) < radar->getDistance() && obj->canBeTargetedBy(my_spaceship))
                        {
                            targets.set(obj);
                            return;
                        }
                    }
                }
            }
        }
        if (keys.relay_add_waypoint.getDown())
        {
            mode = WaypointPlacement;
            option_buttons->hide();
            bp_layout->hide();
        }
        if (keys.relay_delete_waypoint.getDown())
        {
            if (targets.getWaypointIndex() >= 0)
                my_spaceship->commandRemoveWaypoint(targets.getWaypointIndex());
        }
        //TODO check
        // if (key.hotkey == "INCREASE_ZOOM")
        // {
        //     float view_distance = radar->getDistance() * 1.1f;
        //     if (view_distance > max_distance)
        //         view_distance = max_distance;
        //     if (view_distance < min_distance)
        //         view_distance = min_distance;
        //     radar->setDistance(view_distance);
        //     // Keep the zoom slider in sync.
        //     zoom_slider->setValue(view_distance);
        //     zoom_label->setText("Zoom: " + string(max_distance / view_distance, 1.0f) + "x");
        // }
        // if (key.hotkey == "DECREASE_ZOOM")
        // {
        //     float view_distance = radar->getDistance() * 0.9f;
        //     if (view_distance > max_distance)
        //         view_distance = max_distance;
        //     if (view_distance < min_distance)
        //         view_distance = min_distance;
        //     radar->setDistance(view_distance);
        //     // Keep the zoom slider in sync.
        //     zoom_slider->setValue(view_distance);
        //     zoom_label->setText("Zoom: " + string(max_distance / view_distance, 1.0f) + "x");
        // }
        // if (keys.relay_alert_normal.getDown())
        // {
        //     my_spaceship->commandSetAlertLevel(AL_Normal);
        //     for(GuiButton* button : alert_level_buttons)
        //         button->setVisible(false);
        //     alert_level_button->setValue(false);
        // }
        // if (keys.relay_alert_yellow.getDown())
        // {
        //     my_spaceship->commandSetAlertLevel(AL_YellowAlert);
        //     for(GuiButton* button : alert_level_buttons)
        //         button->setVisible(false);
        //     alert_level_button->setValue(false);
        // }
        // if (keys.relay_alert_red.getDown())
        // {
        //     my_spaceship->commandSetAlertLevel(AL_RedAlert);
        //     for(GuiButton* button : alert_level_buttons)
        //         button->setVisible(false);
        //     alert_level_button->setValue(false);
        // }
    }
}
