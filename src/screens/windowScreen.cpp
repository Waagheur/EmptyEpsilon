#include "playerInfo.h"
#include "gameGlobalInfo.h"
#include "windowScreen.h"
#include "epsilonServer.h"
#include "main.h"
#include "menus/shipSelectionScreen.h"

#include "screenComponents/viewport3d.h"
#include "screenComponents/indicatorOverlays.h"
#include "screenComponents/shipDestroyedPopup.h"

WindowScreen::WindowScreen(float angle)
: angle(angle)
{
    viewport = new GuiViewport3D(this, "VIEWPORT");
    viewport->showCallsigns()->showHeadings()->showSpacedust();
    viewport->setPosition(0, 0, ATopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

    new GuiShipDestroyedPopup(this);
    
    new GuiIndicatorOverlays(this);
}

void WindowScreen::update(float delta)
{
    if (game_client && game_client->getStatus() == GameClient::Disconnected)
    {
        destroy();
        disconnectFromServer();
        returnToMainMenu();
        return;
    }

    if (my_spaceship)
    {
        camera_yaw = my_spaceship->getRotation() + angle;
        camera_pitch = 0.0f;
        
        sf::Vector2f position = my_spaceship->getPosition() + sf::rotateVector(sf::Vector2f(my_spaceship->getRadius(), 0), camera_yaw);

        camera_position.x = position.x;
        camera_position.y = position.y;
        camera_position.z = 0.0;
    }
}

void WindowScreen::onKey(sf::Keyboard::Key key, int unicode)
{
    switch(key)
    {
    case sf::Keyboard::Left:
        angle -= 5.0f;
        break;
    case sf::Keyboard::Right:
        angle += 5.0f;
        break;

    //TODO: This is more generic code and is duplicated.
    case sf::Keyboard::Escape:
    case sf::Keyboard::Home:
        destroy();
        new ShipSelectionScreen();
        break;
    case sf::Keyboard::P:
        if (game_server)
            engine->setGameSpeed(0.0);
        break;
    default:
        break;
    }
}
