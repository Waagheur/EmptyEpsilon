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

void NavigationView::onDraw(sp::RenderTarget& renderer)
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
        auto ship_offset = (target_spaceship->getPosition() - getViewPosition()) / getDistance() * std::min(rect.size.x, rect.size.y) / 2.0f;
        if (ship_offset.x < -rect.size.x / 2.0f || ship_offset.x > rect.size.x / 2.0f || ship_offset.y < -rect.size.y / 2.0f || ship_offset.y > rect.size.y / 2.0f)
        {
            glm::vec2 position(rect.position.x + rect.size.x / 2.0f, rect.position.y + rect.size.y / 2.0);
            position += ship_offset / glm::length(ship_offset) * std::min(rect.size.x, rect.size.y) * 0.4f;

            renderer.drawRotatedSprite("waypoint.png", position, 32, vec2ToAngle(ship_offset) - 90);
        }
    }
     //Render the final radar
    drawRenderTexture(background_texture, renderer.getSFMLTarget());
    drawRenderTexture(forground_texture, renderer.getSFMLTarget());
}

void NavigationView::drawWaypoints(sp::RenderTarget& renderer)
{
    if (!my_spaceship)
        return;

    glm::vec2 radar_screen_center(rect.position.x + rect.size.x / 2.0f, rect.position.y + rect.size.y / 2.0f);

    for(unsigned int n=0; n<my_spaceship->waypoints.size(); n++)
    {
        auto screen_position = worldToScreen(my_spaceship->waypoints[n]);

        renderer.drawSprite("waypoint.png", screen_position - glm::vec2(0, 10), 20, colorConfig.ship_waypoint_background);
        renderer.drawText(sp::Rect(screen_position.x, screen_position.y - 10, 0, 0), string(n + 1), sp::Alignment::Center, 18, bold_font, colorConfig.ship_waypoint_text);

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

void NavigationView::drawObjects(sp::RenderTarget& renderer_normal, sp::RenderTarget& renderer_alpha)
{
    glm::vec2 radar_screen_center(rect.position.x + rect.size.x / 2.0f, rect.position.y + rect.size.y / 2.0f);
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
        sp::Rect object_rect(object_position_on_screen.x - r, object_position_on_screen.y - r, r * 2, r * 2);
        if (obj != *my_spaceship && rect.overlaps(object_rect))
        {
            sp::RenderTarget* renderer = &renderer_normal;
            if (!obj->canHideInNebula())
                renderer = &renderer_alpha;
            obj->drawOnRadar(*renderer, object_position_on_screen, getScale(), getViewRotation(), true);
        }
    }
    if (my_spaceship)
    {
        auto object_position_on_screen = worldToScreen(my_spaceship->getPosition());
        my_spaceship->drawOnRadar(renderer_normal, object_position_on_screen, getScale(), getViewRotation(), true);
    }
}
