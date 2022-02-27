#include "playerInfo.h"
#include "gameGlobalInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "tacticalScreen.h"
#include "preferenceManager.h"

#include "screenComponents/combatManeuver.h"
#include "screenComponents/radarView.h"
#include "screenComponents/impulseControls.h"
#include "screenComponents/warpControls.h"
#include "screenComponents/jumpControls.h"
#include "screenComponents/dockingButton.h"
#include "screenComponents/landingButton.h"
#include "screenComponents/alertOverlay.h"
#include "screenComponents/customShipFunctions.h"

#include "screenComponents/missileTubeControls.h"
#include "screenComponents/aimLock.h"
#include "screenComponents/shieldsEnableButton.h"
#include "screenComponents/beamFrequencySelector.h"
#include "screenComponents/beamTargetSelector.h"
#include "screenComponents/powerDamageIndicator.h"

#include "gui/gui2_keyvaluedisplay.h"
#include "gui/gui2_label.h"
#include "gui/gui2_image.h"
#include "gui/gui2_rotationdial.h"

TacticalScreen::TacticalScreen(GuiContainer* owner)
: GuiOverlay(owner, "TACTICAL_SCREEN", colorConfig.background)
{
    // Render the radar shadow and background decorations.
    (new GuiImage(this, "BACKGROUND_GRADIENT", "gui/background/gradientSingle.png"))->setPosition(glm::vec2(0, 0), sp::Alignment::Center)->setSize(1200, 900);

    background_crosses = new GuiOverlay(this, "BACKGROUND_CROSSES", glm::u8vec4{255,255,255,255});
    background_crosses->setTextureTiled("gui/background/crosses.png");

    // Render the alert level color overlay.
    (new AlertLevelOverlay(this));

    // Short-range tactical radar with a 5U range.
    radar = new GuiRadarView(this, "TACTICAL_RADAR", &targets, (P<SpaceShip>)my_spaceship);
    radar->setPosition(0, 0, sp::Alignment::Center)->setSize(GuiElement::GuiSizeMatchHeight, 750);
    radar->setRangeIndicatorStepSize(1000.0)->shortRange()->enableGhostDots()->enableWaypoints()->enableCallsigns()->enableHeadingIndicators()->setStyle(GuiRadarView::Circular);

    // Control targeting and piloting with radar interactions.
    radar->setCallbacks(
        [this](sp::io::Pointer::Button button, glm::vec2 position) {
            targets.setToClosestTo(position, 250, TargetsContainer::Targetable, my_spaceship);
            if (my_spaceship && targets.get())
                my_spaceship->commandSetTarget(targets.get());
            else if (my_spaceship)
                my_spaceship->commandTargetRotation(vec2ToAngle(position - my_spaceship->getPosition()));
        },
        [this](glm::vec2 position) {
            if (my_spaceship)
                my_spaceship->commandTargetRotation(vec2ToAngle(position - my_spaceship->getPosition()));
        },
        [this](glm::vec2 position) {
            if (my_spaceship)
                my_spaceship->commandTargetRotation(vec2ToAngle(position - my_spaceship->getPosition()));
        }
    );
    radar->setAutoRotating(PreferencesManager::get("tactical_radar_lock","0")=="1");

    auto stats = new GuiElement(this, "STATS");
    stats->setPosition(20, 100, sp::Alignment::TopLeft)->setSize(240, 160)->setAttribute("layout", "vertical");

    // Landing and docking buttons on the topleft
    (new GuiDockingButton(this, "DOCKING", my_spaceship))->setPosition(20, 20, sp::Alignment::TopLeft)->setSize(250, 50);
    (new GuiLandingButton(this, "LANDING", my_spaceship))->setPosition(20, 60, sp::Alignment::TopLeft)->setSize(250, 50);

    // Ship statistics in the top left corner.
    energy_display = new GuiKeyValueDisplay(stats, "ENERGY_DISPLAY", 0.45, tr("Energy"), "");
    energy_display->setIcon("gui/icons/energy")->setTextSize(20)->setSize(240, 40);
    heading_display = new GuiKeyValueDisplay(stats, "HEADING_DISPLAY", 0.45, tr("Heading"), "");
    heading_display->setIcon("gui/icons/heading")->setTextSize(20)->setSize(240, 40);
    velocity_display = new GuiKeyValueDisplay(stats, "VELOCITY_DISPLAY", 0.45, tr("Speed"), "");
    velocity_display->setIcon("gui/icons/speed")->setTextSize(20)->setSize(240, 40);
    target_display = new GuiKeyValueDisplay(stats, "TARGET_DISPLAY", 0.45, "Cible", ""); //TRAD
    target_display->setIcon("gui/icons/lock")->setTextSize(20)->setSize(240, 40);
    shields_display = new GuiKeyValueDisplay(stats, "SHIELDS_DISPLAY", 0.45, tr("Shields"), "");
    shields_display->setIcon("gui/icons/shields")->setTextSize(20)->setSize(240, 40);

    // Weapon tube loading controls in the bottom left corner.
    tube_controls = new GuiMissileTubeControls(this, "MISSILE_TUBES", my_spaceship);
    tube_controls->setPosition(20, -20, sp::Alignment::BottomLeft);
    radar->enableTargetProjections(tube_controls);

    // Beam controls beneath the radar.
    if (gameGlobalInfo->use_beam_shield_frequencies || gameGlobalInfo->use_system_damage)
    {
        GuiElement* beam_info_box = new GuiElement(this, "BEAM_INFO_BOX");
        beam_info_box->setPosition(0, -20, sp::Alignment::BottomCenter)->setSize(500, 50);
        (new GuiLabel(beam_info_box, "BEAM_INFO_LABEL", tr("Beams"), 30))->addBackground()->setPosition(0, 0, sp::Alignment::BottomLeft)->setSize(80, 50);
        (new GuiBeamFrequencySelector(beam_info_box, "BEAM_FREQUENCY_SELECTOR"))->setPosition(80, 0, sp::Alignment::BottomLeft)->setSize(132, 50);
        (new GuiPowerDamageIndicator(beam_info_box, "", SYS_BeamWeapons, sp::Alignment::CenterLeft, my_spaceship))->setPosition(0, 0, sp::Alignment::BottomLeft)->setSize(212, 50);
        (new GuiBeamTargetSelector(beam_info_box, "BEAM_TARGET_SELECTOR", my_spaceship))->setPosition(0, 0, sp::Alignment::BottomRight)->setSize(288, 50);
    }

    // Weapon tube locking, and manual aiming controls.
    missile_aim = new AimLock(this, "MISSILE_AIM", radar, -90, 360 - 90, 0, [this](float value){
        tube_controls->setMissileTargetAngle(value);
    });
    missile_aim->hide()->setPosition(0, 0, sp::Alignment::Center)->setSize(GuiElement::GuiSizeMatchHeight, 800);
    lock_aim = new AimLockButton(this, "LOCK_AIM", tube_controls, missile_aim, my_spaceship);
    lock_aim->setPosition(250, 20, sp::Alignment::TopCenter)->setSize(110, 50);

    // Combat maneuver and propulsion controls in the bottom right corner.
    (new GuiCombatManeuver(this, "COMBAT_MANEUVER", my_spaceship))->setPosition(-20, -390, sp::Alignment::BottomRight)->setSize(200, 150);
    GuiElement* engine_layout = new GuiElement(this, "ENGINE_LAYOUT");
    engine_layout->setPosition(-20, -80, sp::Alignment::BottomRight)->setSize(GuiElement::GuiSizeMax, 300)->setAttribute("layout", "horizontalright");;
    (new GuiImpulseControls(engine_layout, "IMPULSE", my_spaceship))->setSize(100, GuiElement::GuiSizeMax);
    warp_controls = (new GuiWarpControls(engine_layout, "WARP", my_spaceship))->setSize(100, GuiElement::GuiSizeMax);
    jump_controls = (new GuiJumpControls(engine_layout, "JUMP", my_spaceship))->setSize(100, GuiElement::GuiSizeMax);

    (new GuiCustomShipFunctions(this, tacticalOfficer, "", my_spaceship))->setPosition(-20, 120, sp::Alignment::TopRight)->setSize(250, GuiElement::GuiSizeMax);
}

void TacticalScreen::onDraw(sp::RenderTarget& renderer)
{
    if (my_spaceship)
    {
        energy_display->setValue(string(int(my_spaceship->energy_level)));
        heading_display->setValue(string(fmodf(my_spaceship->getRotation() + 360.0f + 360.0f - 270.0f, 360.0f), 1));
        float velocity = glm::length(my_spaceship->getVelocity()) / 1000 * 60;
        velocity_display->setValue(tr("{value} {unit}/min").format({{"value", string(velocity, 1)}, {"unit", DISTANCE_UNIT_1K}}));

        warp_controls->setVisible(my_spaceship->has_warp_drive);
        jump_controls->setVisible(my_spaceship->has_jump_drive);

        string shields_value = string(my_spaceship->getShieldPercentage(0)) + "%";
        if (my_spaceship->hasSystem(SYS_RearShield))
        {
            shields_value += " " + string(my_spaceship->getShieldPercentage(1)) + "%";
        }
        shields_display->setValue(shields_value);
        if (my_spaceship->hasSystem(SYS_FrontShield) || my_spaceship->hasSystem(SYS_RearShield))
        {
            shields_display->show();
        } else {
            shields_display->hide();
        }

        targets.set(my_spaceship->getTarget());
    }
    GuiOverlay::onDraw(renderer);
}

void TacticalScreen::onUpdate()
{
    if (my_spaceship && isVisible())
    {
        auto angle = (keys.helms_turn_right.getValue() - keys.helms_turn_left.getValue()) * 5.0f;
        if (angle != 0.0f)
        {
            my_spaceship->commandTargetRotation(my_spaceship->getRotation() + angle);
        }

        if (keys.weapons_enemy_next_target.getDown())
        {
            bool current_found = false;
            foreach(SpaceObject, obj, space_object_list)
            {
                if (obj == my_spaceship)
                    continue;
                if (obj == targets.get())
                {
                    current_found = true;
                    continue;
                }
                if (current_found && glm::length(obj->getPosition() - my_spaceship->getPosition()) < my_spaceship->getShortRangeRadarRange() && my_spaceship->isEnemy(obj) && my_spaceship->getScannedStateFor(obj) >= SS_FriendOrFoeIdentified && obj->canBeTargetedBy(my_spaceship))
                {
                    targets.set(obj);
                    my_spaceship->commandSetTarget(targets.get());
                    return;
                }
            }
            foreach(SpaceObject, obj, space_object_list)
            {
                if (obj == targets.get())
                {
                    continue;
                }
                if (my_spaceship->isEnemy(obj) && glm::length(obj->getPosition() - my_spaceship->getPosition()) < my_spaceship->getShortRangeRadarRange() && my_spaceship->getScannedStateFor(obj) >= SS_FriendOrFoeIdentified && obj->canBeTargetedBy(my_spaceship))
                {
                    targets.set(obj);
                    my_spaceship->commandSetTarget(targets.get());
                    return;
                }
            }
        }
        if (keys.weapons_next_target.getDown())
        {
            bool current_found = false;
            foreach(SpaceObject, obj, space_object_list)
            {
                if (obj == targets.get())
                {
                    current_found = true;
                    continue;
                }
                if (obj == my_spaceship)
                    continue;
                if (current_found && glm::length(obj->getPosition() - my_spaceship->getPosition()) < my_spaceship->getShortRangeRadarRange() && obj->canBeTargetedBy(my_spaceship))
                {
                    targets.set(obj);
                    my_spaceship->commandSetTarget(targets.get());
                    return;
                }
            }
            foreach(SpaceObject, obj, space_object_list)
            {
                if (obj == targets.get() || obj == my_spaceship)
                    continue;
                if (glm::length(obj->getPosition() - my_spaceship->getPosition()) < my_spaceship->getShortRangeRadarRange() && obj->canBeTargetedBy(my_spaceship))
                {
                    targets.set(obj);
                    my_spaceship->commandSetTarget(targets.get());
                    return;
                }
            }
        }

        auto aim_adjust = keys.weapons_aim_left.getValue() - keys.weapons_aim_right.getValue();
        if (aim_adjust != 0.0f)
        {
            missile_aim->setValue(missile_aim->getValue() - 5.0f * aim_adjust);
            tube_controls->setMissileTargetAngle(missile_aim->getValue());
        }
    }
}
