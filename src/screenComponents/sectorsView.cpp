#include <SFML/OpenGL.hpp>

#include "main.h"
#include "gameGlobalInfo.h"
#include "spaceObjects/nebula.h"
#include "spaceObjects/blackHole.h"
#include "spaceObjects/scanProbe.h"
#include "playerInfo.h"
#include "sectorsView.h"
#include "missileTubeControls.h"
#include "targetsContainer.h"

SectorsView::SectorsView(GuiContainer *owner, string id, float distance, TargetsContainer* targets) :

GuiElement(owner, id), distance(distance), targets(targets),  mouse_down_func(nullptr), mouse_drag_func(nullptr), mouse_up_func(nullptr),
view_position(glm::vec2(0.0f,0.0f)), view_rotation(0)
{
    // initialize grid colors for different zoom magnitudes
    for (int scale_magnitude = 0; scale_magnitude < SectorsView::grid_scale_size - 1; scale_magnitude++)
    {
        // warning : the computation is balanced using implicit castings, bit overflows and black magic.
        // seriously it's worse than those job interview questions
        // if you change this code even the slightest, verify that it still produces a veriaty of different colors
        sf::Uint8 colorStep = (-128 / SectorsView::grid_scale_size);
        grid_colors[scale_magnitude] = sf::Color(65 + colorStep * scale_magnitude * 0.5, 65 + colorStep * scale_magnitude * 0.3, 129 + colorStep * scale_magnitude, 128);
    }
    // last color is white
    grid_colors[SectorsView::grid_scale_size - 1] = sf::Color(255, 255, 255, 128);
}

glm::vec2 SectorsView::worldToScreen(glm::vec2 world_position)
{
    glm::vec2 radar_screen_center = rect.center();
    auto radar_position = rotateVec2((world_position - view_position) * getScale(), -view_rotation);
    return glm::vec2(radar_position.x, radar_position.y) + radar_screen_center;
}

glm::vec2 SectorsView::screenToWorld(glm::vec2 screen_position)
{
    glm::vec2 radar_screen_center = rect.center();
    glm::vec2 radar_position = rotateVec2((screen_position - radar_screen_center) / getScale(), view_rotation);
    return view_position + glm::vec2(radar_position.x, radar_position.y);
}

int SectorsView::calcGridScaleMagnitude(int scale_magnitude, int position)
{
    for (int i = SectorsView::grid_scale_size - 1; i >= 0; i--)
    {
        if (position % (int)std::pow(sub_sectors_count, i) == 0)
        {
            return std::min(scale_magnitude + i, SectorsView::grid_scale_size - 1);
        }
    }
    return scale_magnitude;
}

void SectorsView::drawSectorGrid(sp::RenderTarget &renderer)
{
    glm::vec2 radar_screen_center(rect.position.x + rect.size.x / 2.0f, rect.position.y + rect.size.y / 2.0f);
    const float scale = getScale();
    const float factor = std::floor(std::log10(GameGlobalInfo::sector_size * scale));
    const int scale_magnitude = 2 - std::min(2.f, factor);
    const float sector_size_scaled = GameGlobalInfo::sector_size * std::pow(sub_sectors_count, scale_magnitude);
    const float sub_sector_size = sector_size_scaled / sub_sectors_count;

    int sector_x_min = floor((view_position.x - (radar_screen_center.x - rect.position.x) / scale) / sector_size_scaled) + 1;
    int sector_x_max = floor((view_position.x + (rect.position.x + rect.size.x - radar_screen_center.x) / scale) / sector_size_scaled);
    int sector_y_min = floor((view_position.y - (radar_screen_center.y - rect.position.y) / scale) / sector_size_scaled) + 1;
    int sector_y_max = floor((view_position.y + (rect.position.y + rect.size.y - radar_screen_center.y) / scale) / sector_size_scaled);
    for (int sector_x = sector_x_min - 1; sector_x <= sector_x_max; sector_x++)
    {
        float x = sector_x * sector_size_scaled;
        for (int sector_y = sector_y_min - 1; sector_y <= sector_y_max; sector_y++)
        {
            float y = sector_y * sector_size_scaled;
            string name;
            if (my_spaceship)
                name = getSectorName(glm::vec2(sector_x * sector_size_scaled + 1, sector_y * sector_size_scaled + 1),my_spaceship->correction_x,my_spaceship->correction_y);
            else
                name = getSectorName(glm::vec2(sector_x * sector_size_scaled + 1, sector_y * sector_size_scaled + 1));

            sf::Color color = grid_colors[std::min(calcGridScaleMagnitude(scale_magnitude, sector_x), calcGridScaleMagnitude(scale_magnitude, sector_y))];
            auto pos = worldToScreen(glm::vec2(x+(30/scale),y+(30/scale)));
            renderer.drawText(sp::Rect(pos.x-10, pos.y-10, 20, 20), name, sp::Alignment::Center, 30, bold_font, color);
        }
    }
    for (int sector_x = sector_x_min; sector_x <= sector_x_max; sector_x++)
    {
        sf::Color color = grid_colors[calcGridScaleMagnitude(scale_magnitude, sector_x)];
        float x = sector_x * sector_size_scaled;
        renderer.drawLine(worldToScreen(glm::vec2(x, (sector_y_min-1)*sector_size_scaled)), worldToScreen(glm::vec2(x, (sector_y_max+1)*sector_size_scaled)), color);
    }
    for (int sector_y = sector_y_min; sector_y <= sector_y_max; sector_y++)
    {
        float y = sector_y * sector_size_scaled;
        sf::Color color = grid_colors[calcGridScaleMagnitude(scale_magnitude, sector_y)];
        renderer.drawLine(worldToScreen(glm::vec2((sector_x_min-1)*sector_size_scaled, y)), worldToScreen(glm::vec2((sector_x_max+1)*sector_size_scaled, y)), color);
    }
    window.draw(lines_x);
    window.draw(lines_y);

    sf::Color color = sf::Color(64, 64, 128, 255);
    int sub_sector_x_min = floor((view_position.x - (radar_screen_center.x - rect.position.x) / scale) / sub_sector_size) + 1;
    int sub_sector_x_max = floor((view_position.x + (rect.position.x + rect.size.x - radar_screen_center.x) / scale) / sub_sector_size);
    int sub_sector_y_min = floor((view_position.y - (radar_screen_center.y - rect.position.y) / scale) / sub_sector_size) + 1;
    int sub_sector_y_max = floor((view_position.y + (rect.position.y + rect.size.y - radar_screen_center.y) / scale) / sub_sector_size);
    sf::VertexArray points(sf::Points, (sub_sector_x_max - sub_sector_x_min + 1) * (sub_sector_y_max - sub_sector_y_min + 1));
    for (int sector_x = sub_sector_x_min; sector_x <= sub_sector_x_max; sector_x++)
    {
        float x = sector_x * sub_sector_size;
        for (int sector_y = sub_sector_y_min; sector_y <= sub_sector_y_max; sector_y++)
        {
            float y = sector_y * sub_sector_size;
            points[(sector_x - sub_sector_x_min) + (sector_y - sub_sector_y_min) * (sub_sector_x_max - sub_sector_x_min + 1)].position = worldToScreen(glm::vec2(x,y));
            points[(sector_x - sub_sector_x_min) + (sector_y - sub_sector_y_min) * (sub_sector_x_max - sub_sector_x_min + 1)].color = color;
        }
    }
    window.draw(points);
}

void SectorsView::drawTargets(sp::RenderTarget& renderer)
{
    auto& window = renderer.getSFMLTarget();
   	if (!targets)
        return;

    sf::Sprite target_sprite;
    textureManager.setTexture(target_sprite, "redicule.png");

    for(P<SpaceObject> obj : targets->getTargets())
    {
        auto object_position_on_screen = worldToScreen(obj->getPosition());
        float r = obj->getRadius() * getScale();
        sp::Rect object_rect(object_position_on_screen.x - r, object_position_on_screen.y - r, r * 2, r * 2);
        if (obj != my_spaceship && rect.overlaps(object_rect))
        {
            target_sprite.setPosition(object_position_on_screen.x, object_position_on_screen.y);
            window.draw(target_sprite);
        }
    }

    if (my_spaceship && targets->getWaypointIndex() > -1 && targets->getWaypointIndex() < my_spaceship->getWaypointCount())
    {
        auto object_position_on_screen = worldToScreen(my_spaceship->waypoints[targets->getWaypointIndex()]);

        target_sprite.setPosition(object_position_on_screen.x, object_position_on_screen.y-10);
        window.draw(target_sprite);
    }
}

bool SectorsView::onMouseDown(glm::vec2 position)
{
    if (!mouse_down_func && !mouse_drag_func && !mouse_up_func)
        return false;
    if (mouse_down_func)
        mouse_down_func(screenToWorld(position));
    return true;
}

void SectorsView::onMouseDrag(glm::vec2 position)
{
    if (mouse_drag_func)
        mouse_drag_func(screenToWorld(position));
}

void SectorsView::onMouseUp(glm::vec2 position)
{
    if (mouse_up_func)
        mouse_up_func(screenToWorld(position));
}
