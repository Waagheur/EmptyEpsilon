#include "playerInfo.h"
#include "gameGlobalInfo.h"
#include "mainScreen.h"
#include "main.h"
#include "epsilonServer.h"
#include "preferenceManager.h"
#include "soundManager.h"
#include "multiplayer_client.h"

#include "screenComponents/indicatorOverlays.h"
#include "screenComponents/selfDestructIndicator.h"
#include "screenComponents/globalMessage.h"
#include "screenComponents/jumpIndicator.h"
#include "screenComponents/commsOverlay.h"
#include "screenComponents/viewportMainScreen.h"
#include "screenComponents/radarView.h"
#include "screenComponents/shipDestroyedPopup.h"
#include "screens/extra/damcon.h"
#include "screenComponents/impulseSound.h"

#include "screens/extra/targetAnalysisScreen.h"

#include "gui/gui2_panel.h"
#include "gui/gui2_overlay.h"
#include "gui/gui2_panel.h"
#include "gui/gui2_label.h"

ScreenMainScreen::ScreenMainScreen(RenderLayer* render_layer)
: GuiCanvas(render_layer)
{
    new GuiOverlay(this, "", glm::u8vec4(0,0,0,255));

    viewport = new GuiViewportMainScreen(this, "VIEWPORT");
    viewport->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

    //TODO : voir pourquoi c'est commente
    //(new GuiRadarView(viewport, "VIEWPORT_RADAR", my_spaceship->getShortRangeRadarRange(), nullptr, my_spaceship))->setStyle(GuiRadarView::CircularMasked)->setSize(200, 200)->setPosition(-20, 20, sp::Alignment::TopRight);
    main_screen_radar = new GuiRadarView(viewport, "VIEWPORT_RADAR", nullptr, my_spaceship); //TODO check this !!!
    main_screen_radar->setStyle(GuiRadarView::CircularMasked)->setSize(200, 200)->setPosition(-20, 20, sp::Alignment::TopRight); //TODO check this !!!

    tactical_radar = new GuiRadarView(this, "TACTICAL", nullptr, my_spaceship);
    tactical_radar->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    tactical_radar->setRangeIndicatorStepSize(1000.0f)->shortRange()->enableCallsigns()->hide();
    if (my_spaceship)
    {
        long_range_radar = new GuiRadarView(this, "TACTICAL", nullptr, my_spaceship);
        long_range_radar->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
        long_range_radar->setRangeIndicatorStepSize(5000.0f)->longRange()->enableCallsigns()->hide();
        long_range_radar->setFogOfWarStyle(GuiRadarView::NebulaFogOfWar);
    }
    global_range_radar = new GuiRadarView(this, "GLOBAL", 50000.0f, nullptr, my_spaceship);
    global_range_radar->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    global_range_radar->setAutoCentering(true);
    global_range_radar->longRange()->enableWaypoints()->enableCallsigns()->setStyle(GuiRadarView::Rectangular)->setFogOfWarStyle(GuiRadarView::FriendlysShortRangeFogOfWar);
    global_range_radar->hide();
    ship_state = new DamageControlScreen(this);
    ship_state->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    ship_state->hide();
    target_analysis = new TargetAnalysisScreen(this);
    target_analysis->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    target_analysis->hide();
    onscreen_comms = new GuiCommsOverlay(this);
    onscreen_comms->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax)->setVisible(false);

    dock_comms = new GuiPanel(this,"DOCK_BOX");
    dock_comms->setSize(800, 100)->setPosition(0, 250, sp::Alignment::TopCenter);
    label_dock = new GuiLabel(dock_comms, "DOCK_LABEL", "PROCEDURE DE DOCK", 40);
    label_dock->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax)->setPosition(0, 0, sp::Alignment::Center);
    dock_comms -> hide();

    new GuiShipDestroyedPopup(this);

    new GuiJumpIndicator(this);
    new GuiSelfDestructIndicator(this);
    new GuiGlobalMessage(this);
    new GuiIndicatorOverlays(this);

    keyboard_help = new GuiHelpOverlay(this, "Keyboard Shortcuts");

    for (auto binding : sp::io::Keybinding::listAllByCategory(tr("hotkey_menu", "Main Screen")))
        keyboard_general += binding->getLabel() + ":\t" + binding->getHumanReadableKeyName(0) + "\n";

    keyboard_help->setText(keyboard_general);

    if (PreferencesManager::get("music_enabled") != "0")
    {
        threat_estimate = new ThreatLevelEstimate();
        threat_estimate->setCallbacks([](){
            LOG(INFO) << "Switching to ambient music";
            soundManager->playMusicSet(findResources("music/ambient/*.ogg"));
        }, []() {
            LOG(INFO) << "Switching to combat music";
            soundManager->playMusicSet(findResources("music/combat/*.ogg"));
        });
    }

    // Initialize and play the impulse engine sound.
    impulse_sound = std::unique_ptr<ImpulseSound>( new ImpulseSound(PreferencesManager::get("impulse_sound_enabled", "2") != "0") );
}

void ScreenMainScreen::destroy()
{
    if (threat_estimate)
        threat_estimate->destroy();
    PObject::destroy();
}

void ScreenMainScreen::update(float delta)
{
    if (keys.escape.getDown())
    {
        soundManager->stopMusic();
        impulse_sound->stop();
        destroy();
        returnToShipSelection(getRenderLayer());
    }
    if (keys.help.getDown())
    {
        // Toggle keyboard help.
        keyboard_help->frame->setVisible(!keyboard_help->frame->isVisible());
    }
    if (keys.pause.getDown())
    {
        if (game_server)
            engine->setGameSpeed(0.0);
    }

        if ((game_client && game_client->getStatus() == GameClient::Disconnected)
    || (my_spaceship && my_spaceship->id_dock != PreferencesManager::get("id_dock")))
    {
        soundManager->stopMusic();
        impulse_sound->stop();
        destroy();
        disconnectFromServer();
        returnToMainMenu(getRenderLayer());
        return;
    }

    if (my_spaceship)
    {
        switch(my_spaceship->main_screen_setting)
        {
        case MSS_Front:
        case MSS_Back:
        case MSS_Left:
        case MSS_Right:
        case MSS_Target:
            viewport->show();
            tactical_radar->hide();
            long_range_radar->hide();
            global_range_radar->hide();
            ship_state->hide();
            target_analysis->hide();
            break;
        case MSS_Tactical:
            viewport->hide();
            tactical_radar->show();
            long_range_radar->hide();
            global_range_radar->hide();
            ship_state->hide();
            target_analysis->hide();
            break;
        case MSS_LongRange:
            viewport->hide();
            tactical_radar->hide();
            long_range_radar->show();
            global_range_radar->hide();
            ship_state->hide();
            target_analysis->hide();
            break;
        case MSS_GlobalRange:
            viewport->hide();
            tactical_radar->hide();
            long_range_radar->hide();
            global_range_radar->show();
            ship_state->hide();
            break;
        case MSS_ShipState:
            viewport->hide();
            tactical_radar->hide();
            long_range_radar->hide();
            global_range_radar->hide();
            ship_state->show();
            target_analysis->hide();
            break;
        case MSS_TargetAnalysis:
            viewport->hide();
            tactical_radar->hide();
            long_range_radar->hide();
            global_range_radar->hide();
            ship_state->hide();
            target_analysis->show();
            break;
        }

        // if (my_spaceship->docking_state != DS_NotDocking)
        // {
            // viewport->hide();
            // tactical_radar->hide();
            // long_range_radar->hide();
            // global_range_radar->hide();
            // ship_state->show();
            // dock_comms->show();
        // }else{
            // dock_comms->hide();
        // }

        switch(my_spaceship->main_screen_overlay)
        {
        case MSO_ShowComms:
            onscreen_comms->clearElements();
            onscreen_comms->show();
            viewport->hide();
            break;
        case MSO_HideComms:
            onscreen_comms->clearElements();
            onscreen_comms->hide();
            viewport->show();
            break;
        }

        // Update impulse sound volume and pitch.
        impulse_sound->update(delta);
    } else {
        // If we're not the player ship (ie. we exploded), don't play impulse
        // engine sounds.
        impulse_sound->stop();
    }

    if (my_spaceship)
    {
        if (keys.mainscreen_forward.getDown())
            my_spaceship->commandMainScreenSetting(MSS_Front);
        if (keys.mainscreen_left.getDown())
            my_spaceship->commandMainScreenSetting(MSS_Left);
        if (keys.mainscreen_right.getDown())
            my_spaceship->commandMainScreenSetting(MSS_Right);
        if (keys.mainscreen_back.getDown())
            my_spaceship->commandMainScreenSetting(MSS_Back);
        if (keys.mainscreen_target.getDown())
            my_spaceship->commandMainScreenSetting(MSS_Target);
        if (keys.mainscreen_tactical_radar.getDown())
            my_spaceship->commandMainScreenSetting(MSS_Tactical);
        if (keys.mainscreen_long_range_radar.getDown())
            my_spaceship->commandMainScreenSetting(MSS_LongRange);
        //my_spaceship->commandMainScreenSetting(MSS_TargetAnalysis); //TODO
        if (keys.mainscreen_first_person.getDown())
            viewport->first_person = !viewport->first_person;
    }
}

bool ScreenMainScreen::onPointerDown(sp::io::Pointer::Button button, glm::vec2 position, sp::io::Pointer::ID id)
{
    if (GuiCanvas::onPointerDown(button, position, id))
        return true;
    if (!my_spaceship)
        return false;

    if (button == sp::io::Pointer::Button::Touch && id != sp::io::Pointer::mouse)
    {
        // When the radar is up, clicking 'inside' toggles (middle mouse),
        // 'outside' closes (Left mouse).
        auto check_radar = [position](const auto& radar)
        {
            auto size = radar.getRect().size;
            auto radius = std::min(size.x, size.y) / 2.f;
            if (glm::length(position - radar.getCenterPoint()) < radius)
                return sp::io::Pointer::Button::Middle;

            return sp::io::Pointer::Button::Left;
        };

        switch (my_spaceship->main_screen_setting)
        {
        case MSS_Tactical:
            button = check_radar(*tactical_radar);
            break;
        case MSS_LongRange:
            button = check_radar(*long_range_radar);
            break;
        default:
            // Tapping the radar brings it up (middle mouse)
            if (main_screen_radar->getRect().contains(position))
                button = sp::io::Pointer::Button::Middle;
            else
            {
                // Split screen in two - tapping left rotates left (as if left mouse), and right... right.
                if (position.x < viewport->getCenterPoint().x)
                    button = sp::io::Pointer::Button::Left;
                else
                    button = sp::io::Pointer::Button::Right;
            }
        }
    }

    switch(button)
    {
    case sp::io::Pointer::Button::Left:
        [[fallthrough]];
    case sp::io::Pointer::Button::Touch:
        switch(my_spaceship->main_screen_setting)
        {
        case MSS_Front: my_spaceship->commandMainScreenSetting(MSS_Left); break;
        case MSS_Left: my_spaceship->commandMainScreenSetting(MSS_Back); break;
        case MSS_Back: my_spaceship->commandMainScreenSetting(MSS_Right); break;
        case MSS_Right: my_spaceship->commandMainScreenSetting(MSS_Front); break;
        default: my_spaceship->commandMainScreenSetting(MSS_Front); break;
        }
        break;
    case sp::io::Pointer::Button::Right:
        switch(my_spaceship->main_screen_setting)
        {
        case MSS_Front: my_spaceship->commandMainScreenSetting(MSS_Right); break;
        case MSS_Right: my_spaceship->commandMainScreenSetting(MSS_Back); break;
        case MSS_Back: my_spaceship->commandMainScreenSetting(MSS_Left); break;
        case MSS_Left: my_spaceship->commandMainScreenSetting(MSS_Front); break;
        default: my_spaceship->commandMainScreenSetting(MSS_Front); break;
        }
        break;
    case sp::io::Pointer::Button::Middle:
        switch(my_spaceship->main_screen_setting)
        {
        case MSS_Tactical:
            if (gameGlobalInfo->allow_main_screen_long_range_radar)
                my_spaceship->commandMainScreenSetting(MSS_LongRange);
            else if (gameGlobalInfo->allow_main_screen_global_range_radar)
                my_spaceship->commandMainScreenSetting(MSS_GlobalRange);
            else if (gameGlobalInfo->allow_main_screen_ship_state)
                my_spaceship->commandMainScreenSetting(MSS_ShipState);
            else if (gameGlobalInfo->allow_main_screen_target_analysis)
                my_spaceship->commandMainScreenSetting(MSS_TargetAnalysis);
            break;
        case MSS_LongRange:
            if (gameGlobalInfo->allow_main_screen_global_range_radar)
                my_spaceship->commandMainScreenSetting(MSS_GlobalRange);
            else if (gameGlobalInfo->allow_main_screen_ship_state)
                my_spaceship->commandMainScreenSetting(MSS_ShipState);
            else if (gameGlobalInfo->allow_main_screen_target_analysis)
                my_spaceship->commandMainScreenSetting(MSS_TargetAnalysis);
            else if (gameGlobalInfo->allow_main_screen_tactical_radar)
                my_spaceship->commandMainScreenSetting(MSS_Tactical);
            break;
        case MSS_GlobalRange:
            if (gameGlobalInfo->allow_main_screen_ship_state)
                my_spaceship->commandMainScreenSetting(MSS_ShipState);
            else if (gameGlobalInfo->allow_main_screen_target_analysis)
                my_spaceship->commandMainScreenSetting(MSS_TargetAnalysis);
            else if (gameGlobalInfo->allow_main_screen_tactical_radar)
                my_spaceship->commandMainScreenSetting(MSS_Tactical);
            else if (gameGlobalInfo->allow_main_screen_long_range_radar)
                my_spaceship->commandMainScreenSetting(MSS_LongRange);
            break;
        case MSS_ShipState:
            if (gameGlobalInfo->allow_main_screen_target_analysis)
                my_spaceship->commandMainScreenSetting(MSS_TargetAnalysis);
            else if (gameGlobalInfo->allow_main_screen_tactical_radar)
                my_spaceship->commandMainScreenSetting(MSS_Tactical);
            else if (gameGlobalInfo->allow_main_screen_long_range_radar)
                my_spaceship->commandMainScreenSetting(MSS_LongRange);
            else if (gameGlobalInfo->allow_main_screen_global_range_radar)
                my_spaceship->commandMainScreenSetting(MSS_GlobalRange);
            break;

        case MSS_TargetAnalysis:
            if (gameGlobalInfo->allow_main_screen_tactical_radar)
                my_spaceship->commandMainScreenSetting(MSS_Tactical);
            else if (gameGlobalInfo->allow_main_screen_long_range_radar)
                my_spaceship->commandMainScreenSetting(MSS_LongRange);
            else if (gameGlobalInfo->allow_main_screen_global_range_radar)
                my_spaceship->commandMainScreenSetting(MSS_GlobalRange);
            else if (gameGlobalInfo->allow_main_screen_ship_state)
                my_spaceship->commandMainScreenSetting(MSS_ShipState);
            else if (gameGlobalInfo->allow_main_screen_target_analysis)
                my_spaceship->commandMainScreenSetting(MSS_TargetAnalysis);
            break;
        default:
            if (gameGlobalInfo->allow_main_screen_tactical_radar)
                my_spaceship->commandMainScreenSetting(MSS_Tactical);
            else if (gameGlobalInfo->allow_main_screen_long_range_radar)
                my_spaceship->commandMainScreenSetting(MSS_LongRange);
            else if (gameGlobalInfo->allow_main_screen_global_range_radar)
                my_spaceship->commandMainScreenSetting(MSS_GlobalRange);
            else if (gameGlobalInfo->allow_main_screen_ship_state)
                my_spaceship->commandMainScreenSetting(MSS_ShipState);
            break;
        }
        break;
    default:
        break;
    }
    return true;
}
