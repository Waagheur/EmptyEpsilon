#include "playerInfo.h"
#include "gameGlobalInfo.h"
#include "probeScreen.h"
#include "epsilonServer.h"
#include "main.h"

#include "screenComponents/viewport3d.h"
#include "screenComponents/indicatorOverlays.h"
#include "screenComponents/shipDestroyedPopup.h"

ProbeScreen::ProbeScreen()
{
    rotatetime = 0.0007;
    angle = 0.0f;
     // Render the background decorations.
    background_crosses = new GuiOverlay(this, "BACKGROUND_CROSSES", glm::u8vec4(255,255,255,255));
    background_crosses->setTextureTiled("gui/Background/crosses.png");

    viewport = new GuiViewport3D(this, "VIEWPROBE");
    viewport->showSpacedust();
    viewport->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax)->hide();
}

void ProbeScreen::update(float delta)
{

    if (game_client && game_client->getStatus() == GameClient::Disconnected)
    {
        destroy();
        disconnectFromServer();
        returnToMainMenu();
        return;
    }

    rotatetime -= delta;
    if (rotatetime <= 0.0)
    {
		rotatetime = 0.0007;
		angle += 0.5f;
    }

    if (my_spaceship)
    {
		if (game_server)
		    probe = game_server->getObjectById(my_spaceship->linked_probe_3D_id);
		else
		    probe = game_client->getObjectById(my_spaceship->linked_probe_3D_id);

		if (probe)
		{
            background_crosses->hide();
            viewport->show();
			camera_yaw = angle;
			camera_pitch = 0.0f;

			glm::vec2 position = probe->getPosition() + rotateVec2(glm::vec2(probe->getRadius(), 0), camera_yaw);
 			camera_position.x = position.x;
			camera_position.y = position.y;
			camera_position.z = 0.0;
		}else{
            background_crosses->show();
            viewport->hide();
		}
    }
}

void ProbeScreen::onKey(sf::Event::KeyEvent key, int unicode)
{
    switch(key.code)
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
        returnToShipSelection();
        break;
    case sf::Keyboard::P:
        if (game_server)
            engine->setGameSpeed(0.0);
        break;
    default:
        break;
    }
}
