#include <SFML/OpenGL.hpp>

#include "navigationView.h"
#include "main.h"
#include "gameGlobalInfo.h"
#include "spaceObjects/nebula.h"
#include "spaceObjects/blackHole.h"
#include "spaceObjects/scanProbe.h"
#include "playerInfo.h"
#include "missileTubeControls.h"
#include "targetsContainer.h"
#include <set>
#include "radarView.h"

NavigationView::NavigationView(GuiContainer* owner, string id, float distance, TargetsContainer* targets)
: SectorsView(owner, id, distance, targets) {
}

void NavigationView::onDraw(sf::RenderTarget& window)
{
    //Setup our textures for rendering
    adjustRenderTexture(background_texture);
    adjustRenderTexture(forground_texture);

    background_texture.clear(sf::Color(30, 20, 30, 255));

    drawSectorGrid(background_texture);

    forground_texture.clear(sf::Color::Transparent);

    drawObjects(forground_texture, background_texture);
    drawWaypoints(forground_texture);
    drawTargets(forground_texture);
     if (my_spaceship)
    {
        glm::vec2 ship_offset = (my_spaceship->getPosition() - getViewPosition()) / getDistance() * std::min(rect.width, rect.height) / 2.0f;
        if (ship_offset.x < -rect.width / 2.0f || ship_offset.x > rect.width / 2.0f || ship_offset.y < -rect.height / 2.0f || ship_offset.y > rect.height / 2.0f)
        {
            glm::vec2 position(rect.left + rect.width / 2.0f, rect.top + rect.height / 2.0);
            position += ship_offset / glm::length(ship_offset) * std::min(rect.width, rect.height) * 0.4f;
             sf::Sprite arrow_sprite;
            textureManager.setTexture(arrow_sprite, "waypoint");
            arrow_sprite.setPosition(sf::Vector2f(position.x, position.y));
            arrow_sprite.setRotation(vec2ToAngle(ship_offset) - 90);
            forground_texture.draw(arrow_sprite);
        }
    }
     //Render the final radar
    drawRenderTexture(background_texture, window);
    drawRenderTexture(forground_texture, window);
}

void NavigationView::drawWaypoints(sf::RenderTarget& window)
{
    if (!my_spaceship)
        return;

    sf::Vector2f radar_screen_center(rect.left + rect.width / 2.0f, rect.top + rect.height / 2.0f);

    for(unsigned int n=0; n<my_spaceship->waypoints.size(); n++)
    {
        sf::Vector2f screen_position = worldToScreen(my_spaceship->waypoints[n]);

        sf::Sprite object_sprite;
        textureManager.setTexture(object_sprite, "waypoint");
        object_sprite.setColor(colorConfig.ship_waypoint_background);
        object_sprite.setPosition(screen_position - sf::Vector2f(0, 10));
        object_sprite.setScale(0.8, 0.8);
        window.draw(object_sprite);
        drawText(window, sf::FloatRect(screen_position.x, screen_position.y - 10, 0, 0), string(n + 1), sp::Alignment::Center, 18, bold_font, colorConfig.ship_waypoint_text);

        // if (style != GuiRadarView::Rectangular && sf::length(screen_position - radar_screen_center) > std::min(rect.width, rect.height) * 0.5f)
        // {
        //     screen_position = radar_screen_center + ((screen_position - radar_screen_center) / sf::length(screen_position - radar_screen_center) * std::min(rect.width, rect.height) * 0.4f);

        //     object_sprite.setPosition(screen_position);
        //     object_sprite.setRotation(sf::vector2ToAngle(screen_position - radar_screen_center) - 90);
        //     window.draw(object_sprite);

        //     drawText(window, sf::FloatRect(screen_position.x, screen_position.y, 0, 0), string(n + 1), sp::Alignment::Center, 18, bold_font, colorConfig.ship_waypoint_text);
        // }
    }
}

void NavigationView::drawObjects(sf::RenderTarget& window_normal, sf::RenderTarget& window_alpha)
{
    glm::vec2 radar_screen_center(rect.left + rect.width / 2.0f, rect.top + rect.height / 2.0f);
    std::set<SpaceObject*> visible_objects;
    foreach(SpaceObject, obj, space_object_list)
    {
        if (P<Nebula>(obj) || P<BlackHole>(obj))
            visible_objects.insert(*obj);
    }
    for(SpaceObject* obj : visible_objects)
    {
        auto object_position_on_screen = worldToScreen(obj->getPosition());
        float r = obj->getRadius() * getScale();
        sf::FloatRect object_rect(object_position_on_screen.x - r, object_position_on_screen.y - r, r * 2, r * 2);
        if (obj != *my_spaceship && rect.intersects(object_rect))
        {
            sf::RenderTarget* window = &window_normal;
            if (!obj->canHideInNebula())
                window = &window_alpha;
            obj->drawOnRadar(*window, object_position_on_screen, getScale(), getViewRotation(), true);
        }
    }
    if (my_spaceship)
    {
        auto object_position_on_screen = worldToScreen(my_spaceship->getPosition());
        my_spaceship->drawOnRadar(window_normal, object_position_on_screen, getScale(), getViewRotation(), true);
    }
}
