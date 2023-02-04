#include "relayScreen.h"
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
#include "screenComponents/hackingDialog.h"
#include "screenComponents/hackDialog.h"
#include "screenComponents/customShipFunctions.h"
#include "screenComponents/alertLevelButton.h"

#include "gui/gui2_keyvaluedisplay.h"
#include "gui/gui2_selector.h"
#include "gui/gui2_slider.h"
#include "gui/gui2_label.h"
#include "gui/gui2_togglebutton.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_textentry.h"


RelayScreen::RelayScreen(GuiContainer* owner, bool allow_comms)
: GuiOverlay(owner, "RELAY_SCREEN", colorConfig.background), mode(TargetSelection)
{
    targets.setAllowWaypointSelection();
    radar = new GuiRadarView(this, "RELAY_RADAR", 50000.0f, &targets, my_spaceship);
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
            if (mode == TargetSelection)
                {
                    position_text_custom = false;
                    glm::vec2 newPosition = radar->getViewPosition() - (position - mouse_down_position);
                    radar->setViewPosition(newPosition);
                    if(!position_text_custom && my_spaceship)
                        position_text->setText(getStringFromPosition(newPosition, my_spaceship->correction_x, my_spaceship->correction_y));
                }
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
                break;
            case MoveWaypoint:
                mode = TargetSelection;
                targets.setWaypointIndex(drag_waypoint_index);
                break;
            case LaunchProbe:
                if (my_spaceship)
                    my_spaceship->commandLaunchProbe(position);
                mode = TargetSelection;
                option_buttons->show();
                break;
            }
        }
    );

    if (my_spaceship)
        radar->setViewPosition(my_spaceship->getPosition());

    auto sidebar = new GuiElement(this, "SIDE_BAR");
    sidebar->setPosition(-20, 150, sp::Alignment::TopRight)->setSize(250, GuiElement::GuiSizeMax)->setAttribute("layout", "vertical");

    info_distance = new GuiKeyValueDisplay(sidebar, "DISTANCE", 0.4, "Distance", "");
    info_distance->setSize(GuiElement::GuiSizeMax, 30);

    info_radar_range = new GuiKeyValueDisplay(sidebar, "DISTANCE", 0.4, "Portee radar", "");
    info_radar_range->setSize(GuiElement::GuiSizeMax, 30);

    info_callsign = new GuiKeyValueDisplay(sidebar, "SCIENCE_CALLSIGN", 0.4, tr("Callsign"), "");
    info_callsign->setSize(GuiElement::GuiSizeMax, 30);

    info_faction = new GuiKeyValueDisplay(sidebar, "SCIENCE_FACTION", 0.4, tr("Faction"), "");
    info_faction->setSize(GuiElement::GuiSizeMax, 30);

    info_probe = new GuiKeyValueDisplay(sidebar, "RADAR_RANGE", 0.4, "Temps", "");
    info_probe->setSize(GuiElement::GuiSizeMax, 30);

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

    position_text_custom = false;
    position_text = new GuiTextEntry(view_controls, "SECTOR_NAME_TEXT", "");
    position_text->setSize(GuiElement::GuiSizeMax, 50);
    position_text->setTextFont(bold_font);
    position_text->callback([this](string text){
        position_text_custom = true;
    });
    position_text->validator(isValidPositionString);
    position_text->enterCallback([this](string text){
        position_text_custom = false;
        if (position_text->isValid())
        {
            if (my_spaceship)
            {
                glm::vec2 pos = getPositionFromSring(text, my_spaceship->correction_x, my_spaceship->correction_y);
                radar->setViewPosition(pos);
            }
        }
    });
    if (my_spaceship)
        position_text->setText(getStringFromPosition(radar->getViewPosition(), my_spaceship->correction_x, my_spaceship->correction_y));

    position_entry = new GuiElement(this, id + "_ENTRY_ELEMENT");
    position_entry->setSize(250, 320)->setPosition(250, -50, sp::Alignment::BottomLeft);

    (new GuiButton(position_entry, id + "_BUTTON_7", "7", [this]() {position_text->setText(position_text->getText() + "7");}))->setSize(50, 50)->setPosition(50, 100, sp::Alignment::TopLeft);
    (new GuiButton(position_entry, id + "_BUTTON_8", "8", [this]() {position_text->setText(position_text->getText() + "8");}))->setSize(50, 50)->setPosition(100, 100, sp::Alignment::TopLeft);
    (new GuiButton(position_entry, id + "_BUTTON_9", "9", [this]() {position_text->setText(position_text->getText() + "9");}))->setSize(50, 50)->setPosition(150, 100, sp::Alignment::TopLeft);
    (new GuiButton(position_entry, id + "_BUTTON_4", "4", [this]() {position_text->setText(position_text->getText() + "4");}))->setSize(50, 50)->setPosition(50, 150, sp::Alignment::TopLeft);
    (new GuiButton(position_entry, id + "_BUTTON_5", "5", [this]() {position_text->setText(position_text->getText() + "5");}))->setSize(50, 50)->setPosition(100, 150, sp::Alignment::TopLeft);
    (new GuiButton(position_entry, id + "_BUTTON_6", "6", [this]() {position_text->setText(position_text->getText() + "6");}))->setSize(50, 50)->setPosition(150, 150, sp::Alignment::TopLeft);
    (new GuiButton(position_entry, id + "_BUTTON_1", "1", [this]() {position_text->setText(position_text->getText() + "1");}))->setSize(50, 50)->setPosition(50, 200, sp::Alignment::TopLeft);
    (new GuiButton(position_entry, id + "_BUTTON_2", "2", [this]() {position_text->setText(position_text->getText() + "2");}))->setSize(50, 50)->setPosition(100, 200, sp::Alignment::TopLeft);
    (new GuiButton(position_entry, id + "_BUTTON_3", "3", [this]() {position_text->setText(position_text->getText() + "3");}))->setSize(50, 50)->setPosition(150, 200, sp::Alignment::TopLeft);
    (new GuiButton(position_entry, id + "_BUTTON_Clr", "Clr", [this]() {position_text->setText("");}))->setSize(50, 50)->setPosition(50, 250, sp::Alignment::TopLeft);
    (new GuiButton(position_entry, id + "_BUTTON_0", "0", [this]() {position_text->setText(position_text->getText() + "0");}))->setSize(50, 50)->setPosition(100, 250, sp::Alignment::TopLeft);

    // Center screen
    center_screen_button = new GuiButton(view_controls, "CENTER_SCREEN_BUTTON", "Recentrer radar", [this]() {
        if (my_spaceship)
        {
            radar->setViewPosition(my_spaceship->getPosition());
            position_text->setText(getStringFromPosition(my_spaceship->getPosition(), my_spaceship->correction_x, my_spaceship->correction_y));
        }
    });
    center_screen_button->setSize(GuiElement::GuiSizeMax, 50);
    center_screen_button->setIcon("gui/icons/lock");;

    // Manage waypoints.
    waypoints_layout = new GuiElement(view_controls, "WAYPOINTS_LAYOUT");
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

    // Option buttons for comms, waypoints, and probes.
    option_buttons = new GuiElement(this, "BUTTONS");
    option_buttons->setPosition(20, 50, sp::Alignment::TopLeft)->setSize(250, GuiElement::GuiSizeMax)->setAttribute("layout", "vertical");

    // Open comms button.
    if (allow_comms == true)
        (new GuiOpenCommsButton(option_buttons, "OPEN_COMMS_BUTTON", tr("Open Comms"), &targets))->setSize(GuiElement::GuiSizeMax, 50);
    else
        (new GuiOpenCommsButton(option_buttons, "OPEN_COMMS_BUTTON", tr("Link to Comms"), &targets))->setSize(GuiElement::GuiSizeMax, 50);


    // Hack target
    hack_target_button = new GuiButton(option_buttons, "HACK_TARGET", tr("Start hacking"), [this](){
        P<SpaceObject> target = targets.get();
//        if (my_spaceship && target && target->canBeHackedBy(my_spaceship))
        if (my_spaceship)
        {
//            hacking_dialog->open(target);
            hacking_dialog->open();
        }
    });
    hack_target_button->setSize(GuiElement::GuiSizeMax, 50);
    hack_target_button->enable();
    hack_target_button->setIcon("gui/icons/hack");

//    (new GuiLabel(option_buttons, "LABEL_PROBES", "Sondes", 30))->setSize(GuiElement::GuiSizeMax, 50);
    (new GuiLabel(option_buttons, "", " ", 30))->setSize(GuiElement::GuiSizeMax, 50);

    // Launch probe button.
    launch_probe_button = new GuiButton(option_buttons, "LAUNCH_PROBE_BUTTON", tr("Launch Probe"), [this]() {
        mode = LaunchProbe;
        option_buttons->hide();
    });
    launch_probe_button->setSize(GuiElement::GuiSizeMax, 50)->setVisible(my_spaceship && my_spaceship->getCanLaunchProbe());;
    launch_probe_button->setIcon("gui/icons/probe");

    // Rechargement probe
    progress_probe = new GuiProgressbar(launch_probe_button,"PROBE_PROGRESS", 0, PlayerSpaceship::scan_probe_charge_time * 20.0f, 0.0);
    progress_probe->setDrawBackground(false);
    progress_probe->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

    // Link probe to science button.
    link_to_science_button = new GuiToggleButton(option_buttons, "LINK_TO_SCIENCE", tr("Link to Science"), [this](bool value){
        if (value)
        {
            my_spaceship->commandSetScienceLink(targets.get());
        }
        else
        {
            my_spaceship->commandClearScienceLink();
        }
    });
    link_to_science_button->setSize(GuiElement::GuiSizeMax, 50)->setVisible(my_spaceship && my_spaceship->getCanLaunchProbe());
    link_to_science_button->setIcon("gui/icons/station-science");

    // Reputation display.
    //info_reputation = new GuiKeyValueDisplay(option_buttons, "INFO_REPUTATION", 0.4f, tr("Reputation") + ":", "");
    //info_reputation->setSize(GuiElement::GuiSizeMax, 40);

    // Scenario clock display.
    info_clock = new GuiKeyValueDisplay(option_buttons, "INFO_CLOCK", 0.4f, tr("Clock") + ":", "");
    info_clock->setSize(GuiElement::GuiSizeMax, 40);

    (new GuiAlertLevelSelect(this, ""))->setPosition(-20, -70, sp::Alignment::BottomRight)->setSize(300, GuiElement::GuiSizeMax)->setAttribute("layout", "verticalbottom");

    (new GuiCustomShipFunctions(this, relayOfficer, "", my_spaceship))->setPosition(-20, 350, sp::Alignment::TopRight)->setSize(250, GuiElement::GuiSizeMax);

    //hacking_dialog = new GuiHackingDialog(this, ""); //ici hack Daid
    hacking_dialog = new GuiHackDialog(this, ""); //ici hack Tdelc

    new ShipsLog(this,"generic");
    if (allow_comms)
    {
        (new GuiCommsOverlay(this))->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    }
}

void RelayScreen::onDraw(sp::RenderTarget& renderer)
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
        float distance_width = radar->getDistance() * 2.f * ratio_screen / 1000.0f;
        float distance_height = radar->getDistance() * 2.f / 1000.0f;
        if (distance_width < 100)
            info_distance -> setValue(string(distance_width, 1.0f) + " U / " + string(distance_height, 1.0f) + " U");
        else
            info_distance -> setValue(string(distance_width, 0.0f) + " U / " + string(distance_height, 0.0f) + " U");
    }



    // Info progress probe
    if (my_spaceship)
    {
        if (my_spaceship -> current_impulse == 0  && my_spaceship -> scan_probe_stock < my_spaceship -> max_scan_probes)
        {
            progress_probe->show();
            progress_probe->setValue(std::max(my_spaceship->scan_probe_recharge,my_spaceship->scan_probe_recharge_dock));
        }else{
            progress_probe->hide();
        }
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
            // the target, and close any open hacking dialogs.
            targets.clear();
            hacking_dialog->hide();
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

        if (probe && my_spaceship && probe->owner_id == my_spaceship->getMultiplayerId() && probe->canBeTargetedBy(my_spaceship))
        {
            link_to_science_button->setValue(my_spaceship->linked_science_probe_id == probe->getMultiplayerId());
            link_to_science_button->enable();

            info_probe->show();
            float distance = glm::length(probe->getPosition() - probe->getTarget());
            if (distance > 1000.f)
                info_probe->setValue(string(int(ceilf(distance / probe->getSpeed()))) + " S");
            else
                info_probe->hide();
//            link_to_3D_port_button->setValue(my_spaceship->linked_probe_3D_id == probe->getMultiplayerId());
//            link_to_3D_port_button->enable();
        }
        else
        {
            link_to_science_button->setValue(false);
            link_to_science_button->disable();

//            link_to_3D_port_button->setValue(false);
//            link_to_3D_port_button->disable();
        }
//        if (my_spaceship && obj->canBeHackedBy(my_spaceship))
//        {
//            hack_target_button->enable();
//        }else{
//            hack_target_button->disable();
//        }
    }else{
//        hack_target_button->disable();
        link_to_science_button->disable();
        link_to_science_button->setValue(false);

        info_probe->hide();
//        link_to_3D_port_button->disable();
//        link_to_3D_port_button->setValue(false);
        info_callsign->setValue("-");
    }
    if (my_spaceship)
    {
        // Toggle ship capabilities.
        launch_probe_button->setVisible(my_spaceship->getCanLaunchProbe());
        link_to_science_button->setVisible(my_spaceship->getCanLaunchProbe());
        hack_target_button->setVisible(my_spaceship->getCanHack());

        //info_reputation->setValue(string(my_spaceship->getReputationPoints(), 0)); //tsht : TODO voir si on peut reajouter
        info_clock->setValue(gameGlobalInfo->getMissionTime());
        launch_probe_button->setText(tr("Launch Probe") + " (" + string(my_spaceship->scan_probe_stock) + "/" + string(my_spaceship->max_scan_probes) + ")");
    }

    if (targets.getWaypointIndex() >= 0)
    {
        delete_waypoint_button->enable();
        distance = glm::length(my_spaceship->waypoints[targets.getWaypointIndex()] - my_spaceship->getPosition()) / 1000.0f;
        info_distance -> setValue(string(distance, 1.0f) + " U");
    }
    else
        delete_waypoint_button->disable();

    position_entry->setVisible(position_text->isFocus());
}

void RelayScreen::onUpdate()
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
        if (keys.relay_link_science.getDown())
        {
            P<ScanProbe> obj = targets.get();
            if (obj && obj->isFriendly(my_spaceship))
            {
                if (!link_to_science_button->getValue())
                    my_spaceship->commandSetScienceLink(targets.get());
                else
                    my_spaceship->commandClearScienceLink();
            }
        }
        if (keys.relay_begin_hack.getDown())
        {
//            P<SpaceObject> target = targets.get();
//            if (target && target->canBeHackedBy(my_spaceship))
//            {
                hacking_dialog->open();
//            }
        }
        if (keys.relay_add_waypoint.getDown())
        {
            mode = WaypointPlacement;
            option_buttons->hide();
        }
        if (keys.relay_delete_waypoint.getDown())
        {
            if (targets.getWaypointIndex() >= 0)
                my_spaceship->commandRemoveWaypoint(targets.getWaypointIndex());
        }
        if (keys.relay_launch_probe.getDown())
        {
            mode = LaunchProbe;
            option_buttons->hide();
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
