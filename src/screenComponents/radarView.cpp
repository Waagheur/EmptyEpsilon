#include <SFML/OpenGL.hpp>

#include "main.h"
#include "gameGlobalInfo.h"
#include "spaceObjects/nebula.h"
#include "spaceObjects/blackHole.h"
#include "spaceObjects/wormHole.h"
#include "spaceObjects/scanProbe.h"
#include "spaceObjects/planet.h"
#include "playerInfo.h"
#include "radarView.h"
#include "missileTubeControls.h"
#include "targetsContainer.h"

namespace
{
    enum class RadarStencil : uint8_t
    {
        None = 0,
        RadarBounds = 1 << 0,
        VisibleSpace = 1 << 1,
        InBoundsAndVisible = RadarBounds | VisibleSpace,
        All = InBoundsAndVisible

    };

    constexpr std::underlying_type_t<RadarStencil> as_mask(RadarStencil mask)
    {
        return static_cast<std::underlying_type_t<RadarStencil>>(mask);
    }
}


GuiRadarView::GuiRadarView(GuiContainer* owner, string id, TargetsContainer* targets, P<PlayerSpaceship> targetSpaceship)
: SectorsView(owner, id, 5000.0f, targets), 
    auto_rotate_on_my_ship(false),
    auto_distance(true),
    next_ghost_dot_update(0.0), 
    //targets(targets) //only for merge
    missile_tube_controls(nullptr), 
    auto_center_on_my_ship(true),
    //distance(5000.0f) //only for merge
    long_range(false), 
    show_ghost_dots(false),
    show_waypoints(false), 
    show_target_projection(false), 
    show_missile_tubes(false), 
    show_callsigns(false), 
    show_heading_indicators(false), 
    show_game_master_data(false), 
    range_indicator_step_size(0.0f), 
    background_alpha(255),
    style(Circular), 
    fog_style(NoFogOfWar), 
    mouse_down_func(nullptr), 
    mouse_drag_func(nullptr), 
    mouse_up_func(nullptr),
    target_spaceship(targetSpaceship)
{
}

GuiRadarView::GuiRadarView(GuiContainer* owner, string id, float distance, TargetsContainer* targets, P<PlayerSpaceship> targetSpaceship)
: SectorsView(owner, id, distance, targets), 
    next_ghost_dot_update(0.0), 
    //targets(targets), //only for merge
    missile_tube_controls(nullptr), 
    auto_center_on_my_ship(true),
    auto_rotate_on_my_ship(false),
    //distance(distance), //only for merge
    long_range(false), 
    show_ghost_dots(false),
    show_waypoints(false), 
    show_target_projection(false), 
    show_missile_tubes(false), 
    show_callsigns(false), 
    show_heading_indicators(false), 
    show_game_master_data(false), 
    range_indicator_step_size(0.0f), 
    background_alpha(255),
    style(Circular), 
    fog_style(NoFogOfWar), 
    mouse_down_func(nullptr), 
    mouse_drag_func(nullptr), 
    mouse_up_func(nullptr),
    target_spaceship(targetSpaceship)
{
}

void GuiRadarView::onDraw(sf::RenderTarget& window)
{
    //Hacky, when not relay and we have a ship, center on it.
    if (target_spaceship && auto_center_on_my_ship) {
        setViewPosition(target_spaceship->getPosition());
    }
    if (target_spaceship && auto_rotate_on_my_ship) {
        setViewRotation(target_spaceship->getRotation() + 90);
    }
    
    if (auto_distance)
    {
        setDistance(long_range ? 30000.0f : 5000.0f);
        if (target_spaceship)
        {
            if (long_range)
                setDistance(target_spaceship->getLongRangeRadarRange());
            else
                setDistance(target_spaceship->getShortRangeRadarRange());
        }
    }

    //Setup our texture for rendering
    auto use_rendertexture = adjustRenderTexture(background_texture);
    auto& radar_target = use_rendertexture ? background_texture : window;

    if (!use_rendertexture)
    {
        // When we are not using a render texture, we must take some care to not overstep our bounds,
        // quite literally.
        // We use scissoring to define a 'box' in which all draw operations can happen.
        // This allows the side main screen to work correctly even when falling back in the non-render texture path.
        auto origin = radar_target.mapCoordsToPixel(sf::Vector2f{ rect.left, rect.top });
        auto extents = radar_target.mapCoordsToPixel(sf::Vector2f{ rect.width, rect.height });

        radar_target.setActive(true);

        glEnable(GL_SCISSOR_TEST);
        glScissor(origin.x, origin.y, extents.x, extents.y);
    }

    // Draw the initial background 'clear' color.
    if (use_rendertexture || style == Rectangular)
    {
        drawBackground(radar_target);
    }
    
    
    sf::CircleShape circle(0.f, 50);
    if ((style == CircularMasked || style == Circular))
    {
        // Draw the radar's outline. First, and before any stencil kicks in.
        // this way, the outline is not even a part of the rendering area.
        float r = std::min(rect.width, rect.height) / 2.0f - 2.0f;
        circle.setRadius(r);
        circle.setOrigin(r, r);
        circle.setPosition(getCenterPoint());
        circle.setFillColor(sf::Color::Transparent);
        circle.setOutlineThickness(2.f);
        circle.setOutlineColor(colorConfig.radar_outline);
        radar_target.draw(circle);
    }

    // Ensure the calls land in the context of the RT.
    // Even if we don't use multithreading, there are still setup per platforms
    // (for instance, FBO binding when they're used).
    // Each SFML call may reset the binding,
    // so we have to keep re-activating the target window all the time.
    // We're relying on stencil buffer to draw the radar:
    radar_target.setActive(true);

    // Stencil setup.
    glEnable(GL_STENCIL_TEST);
    glStencilMask(as_mask(RadarStencil::InBoundsAndVisible));
    
    // By default, nothing's visible.
    auto clear_mask = as_mask(RadarStencil::None);
    if (style == Rectangular)
    {
        // Rectangular shape, radar bounds is the entire texture target.
        clear_mask |= as_mask(RadarStencil::RadarBounds);

        // Without fog of war (ie GM), everything is deemed visible :)
        if (fog_style == NoFogOfWar)
            clear_mask |= as_mask(RadarStencil::VisibleSpace);
    }
    glClearStencil(clear_mask);
    glClear(GL_STENCIL_BUFFER_BIT);

    glDepthMask(GL_FALSE); // Nothing in this process writes in the depth.
    
    glStencilOp(GL_KEEP, GL_KEEP, GL_REPLACE);
    
    if ((style == CircularMasked || style == Circular))
    {
        // When drawing the radar 'scope', mark the area as "in sight" and "visible".
        glStencilFunc(GL_ALWAYS, as_mask(RadarStencil::InBoundsAndVisible), 0);

        // Draws the radar circle shape.
        // Note that this draws both in the stencil and the color buffer!
        circle.setFillColor(sf::Color{ 20, 20, 20, background_alpha });
        circle.setOutlineThickness(0.f);
        radar_target.draw(circle);
    }

    radar_target.setActive(true);
    if (fog_style == NebulaFogOfWar)
    {
        // Draw the *blocked* areas.
        // In this cas, we want to clear the 'visible' bit,
        // for all the stencil that has the radar one.
        glStencilFunc(GL_EQUAL, as_mask(RadarStencil::RadarBounds), as_mask(RadarStencil::RadarBounds));
        drawNebulaBlockedAreas(radar_target);
    }
    else if (fog_style == FriendlysShortRangeFogOfWar)
    {
        // Draws the *visible* areas.
        // Add the visible states to anything that's in friendly sight (and still in bounds)
        glStencilFunc(GL_EQUAL, as_mask(RadarStencil::InBoundsAndVisible), as_mask(RadarStencil::RadarBounds));
        drawNoneFriendlyBlockedAreas(radar_target);
    }
    // Stencil is setup!
    radar_target.setActive(true);
    glStencilMask(as_mask(RadarStencil::None)); // disable writes.
    glStencilOp(GL_KEEP, GL_KEEP, GL_KEEP); // Back to defaults.

    // These always draw within the radar's confine.
    glStencilFunc(GL_EQUAL, as_mask(RadarStencil::RadarBounds), as_mask(RadarStencil::RadarBounds));
    drawSectorGrid(radar_target);
    drawRangeIndicators(radar_target);
    if (show_target_projection)
        drawTargetProjections(radar_target);
    if (show_missile_tubes)
        drawMissileTubes(radar_target);

    ///Start drawing of foreground
    // Foreground is radar confine + not blocked out.
    
    //Draw things that are masked out by fog-of-war
    if (show_ghost_dots)
    {
        updateGhostDots();
        drawGhostDots(radar_target);
    }

    drawObjects(radar_target);

    // Post masking
    radar_target.setActive(true);
    glStencilFunc(GL_EQUAL, as_mask(RadarStencil::RadarBounds), as_mask(RadarStencil::RadarBounds));
    if (show_game_master_data)
        drawObjectsGM(radar_target);

    if (show_waypoints)
        drawWaypoints(radar_target);
    if (show_heading_indicators)
        drawHeadingIndicators(radar_target);
    drawTargets(radar_target);

    if (style == Rectangular && target_spaceship)
    {
        sf::Vector2f ship_offset = (target_spaceship->getPosition() - getViewPosition()) / getDistance() * std::min(rect.width, rect.height) / 2.0f;
        if (ship_offset.x < -rect.width / 2.0f || ship_offset.x > rect.width / 2.0f || ship_offset.y < -rect.height / 2.0f || ship_offset.y > rect.height / 2.0f)
        {
            sf::Vector2f position(rect.left + rect.width / 2.0f, rect.top + rect.height / 2.0);
            position += ship_offset / sf::length(ship_offset) * std::min(rect.width, rect.height) * 0.4f;

            sf::Sprite arrow_sprite;
            textureManager.setTexture(arrow_sprite, "waypoint");
            arrow_sprite.setPosition(position);
            arrow_sprite.setRotation(sf::vector2ToAngle(ship_offset) - 90);
            radar_target.draw(arrow_sprite);
        }
    }
    // Done with the stencil.
    radar_target.setActive(true);
    glDepthMask(GL_TRUE);
    glDisable(GL_STENCIL_TEST);
    
    if (!use_rendertexture)
    {
        glDisable(GL_SCISSOR_TEST);
    }

    radar_target.setActive(false);

    if (use_rendertexture)
    {
        //Render the final radar
        drawRenderTexture(background_texture, window);
    }
    
}

void GuiRadarView::updateGhostDots()
{
    if (next_ghost_dot_update < engine->getElapsedTime())
    {
        next_ghost_dot_update = engine->getElapsedTime() + 5.0;
        foreach(SpaceObject, obj, space_object_list)
        {
            P<SpaceShip> ship = obj;
            if (ship && sf::length(obj->getPosition() - getViewPosition()) < getDistance())
            {
                ghost_dots.push_back(GhostDot(obj->getPosition()));
            }
        }

        for(unsigned int n=0; n < ghost_dots.size(); n++)
        {
            if (ghost_dots[n].end_of_life <= engine->getElapsedTime())
            {
                ghost_dots.erase(ghost_dots.begin() + n);
                n--;
            }
        }
    }
}

void GuiRadarView::drawBackground(sf::RenderTarget& window)
{
    uint8_t tint = fog_style == NoFogOfWar ? 20 : 0;
    // When drawing a non-rectangular radar (ie circle),
    // we need full transparency on the outer edge.
    // We then use the stencil mask to allow the actual drawing.
    window.clear(style == Rectangular ? sf::Color{ tint, tint, tint, background_alpha } : sf::Color::Transparent);
}

void GuiRadarView::drawNoneFriendlyBlockedAreas(sf::RenderTarget& window)
{
    if (my_spaceship)
    {
        auto drawCircle = [this, &window](P<SpaceObject> obj, float r)
        {
            sf::CircleShape circle(r, 50);
            circle.setOrigin(r, r);
            circle.setFillColor(sf::Color{ 20, 20, 20, background_alpha });
            circle.setPosition(worldToScreen(obj->getPosition()));
            window.draw(circle);
        };

        float r_probe = my_spaceship->getProbeRangeRadarRange();
        r_probe *= getScale();

        float r_default = 5000.0f * getScale();

        foreach(SpaceObject, obj, space_object_list)
        {
            if(obj->id_galaxy != my_spaceship->id_galaxy)
                continue;
            
            P<ShipTemplateBasedObject> stb_obj = obj;
            
            if (obj == my_spaceship || (stb_obj && (obj->faction_id == my_spaceship->faction_id || obj->personality_id == 1)))
            {
                float r_stb = gameGlobalInfo->use_long_range_for_relay ? stb_obj->getLongRangeRadarRange() : stb_obj->getShortRangeRadarRange();
                r_stb *= getScale();
                drawCircle(obj, r_stb);
            }
            else if (P<Planet>(obj)
                 && (obj->faction_id == my_spaceship->faction_id || obj->personality_id == 1))
            {
                drawCircle(obj, r_default);
            }

            P<ScanProbe> sp = obj;

            if (sp && sp->owner_id == my_spaceship->getMultiplayerId())
            {
                drawCircle(obj, r_probe);
            }
        }
    }
}

void GuiRadarView::drawNebulaBlockedAreas(sf::RenderTarget& window)
{
    if (!my_spaceship)
        return;
    sf::Vector2f scan_center = my_spaceship->getPosition();
    sf::Vector2f radar_screen_center(rect.left + rect.width / 2.0f, rect.top + rect.height / 2.0f);
    PVector<Nebula> nebulas = Nebula::getNebulas();
    
    sf::CircleShape circle(0.f, 32);
    circle.setFillColor(sf::Color::Black);
    sf::VertexArray a(sf::TrianglesStrip, 5);
    for(int n=0; n<5;n++)
        a[n].color = sf::Color::Black;

    foreach(Nebula, n, nebulas)
    {
        if (my_spaceship && n->id_galaxy != my_spaceship->id_galaxy)
            continue;

        sf::Vector2f diff = n->getPosition() - scan_center;
        float diff_len = sf::length(diff);

        if (diff_len < n->getRadius() + getDistance())
        {
            if (diff_len < n->getRadius())
            {
                // Inside a nebula - everything is blocked out.
                sf::RectangleShape background(sf::Vector2f(rect.width, rect.height));
                background.setPosition(rect.left, rect.top);
                background.setFillColor(sf::Color::Black);
                window.draw(background);
                
                // Leave the loop here: there's no point adding more blocked areas.
                break;
            }else{
                float r = n->getRadius() * getScale();
                circle.setRadius(r);
                circle.setOrigin(r, r);
                circle.setPosition(worldToScreen(n->getPosition()));
                window.draw(circle);

                float diff_angle = sf::vector2ToAngle(diff);
                float angle = acosf(n->getRadius() / diff_len) / M_PI * 180.0f;

                sf::Vector2f pos_a = n->getPosition() - sf::vector2FromAngle(diff_angle + angle) * n->getRadius();
                sf::Vector2f pos_b = n->getPosition() - sf::vector2FromAngle(diff_angle - angle) * n->getRadius();
                sf::Vector2f pos_c = scan_center + sf::normalize(pos_a - scan_center) * getDistance() * 3.0f;
                sf::Vector2f pos_d = scan_center + sf::normalize(pos_b - scan_center) * getDistance() * 3.0f;
                sf::Vector2f pos_e = scan_center + diff / diff_len * getDistance() * 3.0f;

                a[0].position = worldToScreen(pos_a);
                a[1].position = worldToScreen(pos_b);
                a[2].position = worldToScreen(pos_c);
                a[3].position = worldToScreen(pos_d);
                a[4].position = worldToScreen(pos_e);
                
                window.draw(a);
            }
        }
    }

    // ship's short radar range is always visible.
    if (my_spaceship)
    {
        circle.setFillColor(sf::Color{ 20, 20, 20, background_alpha });
        auto r = my_spaceship->getShortRangeRadarRange() * getScale();;
        circle.setRadius(r);
        circle.setOrigin(r, r);
        circle.setPosition(worldToScreen(my_spaceship->getPosition()));
        //circle.setPosition(radar_screen_center + (scan_center - getViewPosition()) * getScale());
        window.draw(circle);
    }
}

void GuiRadarView::drawGhostDots(sf::RenderTarget& window)
{
    sf::VertexArray ghost_points(sf::Points, ghost_dots.size());
    for(unsigned int n=0; n<ghost_dots.size(); n++)
    {
        ghost_points[n].position = worldToScreen(ghost_dots[n].position);
        ghost_points[n].color = sf::Color(255, 255, 255, 255 * std::max(((ghost_dots[n].end_of_life - engine->getElapsedTime()) / GhostDot::total_lifetime), 0.f));
    }
    window.draw(ghost_points);
}

void GuiRadarView::drawWaypoints(sf::RenderTarget& window)
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
        drawText(window, sf::FloatRect(screen_position.x, screen_position.y - 10, 0, 0), string(n + 1), ACenter, 18, bold_font, colorConfig.ship_waypoint_text);

        if (style != Rectangular && sf::length(screen_position - radar_screen_center) > std::min(rect.width, rect.height) * 0.5f)
        {
            screen_position = radar_screen_center + ((screen_position - radar_screen_center) / sf::length(screen_position - radar_screen_center) * std::min(rect.width, rect.height) * 0.4f);

            object_sprite.setPosition(screen_position);
            object_sprite.setRotation(sf::vector2ToAngle(screen_position - radar_screen_center) - 90);
            window.draw(object_sprite);

            drawText(window, sf::FloatRect(screen_position.x, screen_position.y, 0, 0), string(n + 1), ACenter, 18, bold_font, colorConfig.ship_waypoint_text);
        }
    }
}

void GuiRadarView::drawRangeIndicators(sf::RenderTarget& window)
{
    if (range_indicator_step_size < 1.0)
        return;

    sf::Vector2f radar_screen_center(rect.left + rect.width / 2.0f, rect.top + rect.height / 2.0f);

    for(float circle_size=range_indicator_step_size; circle_size < getDistance(); circle_size+=range_indicator_step_size)
    {
        float s = circle_size * getScale();
        sf::CircleShape circle(s, 50);
        circle.setOrigin(s, s);
        circle.setPosition(radar_screen_center);
        circle.setFillColor(sf::Color::Transparent);
        circle.setOutlineColor(sf::Color(255, 255, 255, 16));
        circle.setOutlineThickness(2.0);
        window.draw(circle);
        drawText(window, sf::FloatRect(radar_screen_center.x, radar_screen_center.y - s - 20, 0, 0), string(int(circle_size / 1000.0f + 0.1f)) + DISTANCE_UNIT_1K, ACenter, 20, bold_font, sf::Color(255, 255, 255, 32));
    }
}

void GuiRadarView::drawTargetProjections(sf::RenderTarget& window)
{
    const float seconds_per_distance_tick = 5.0f;
    sf::Vector2f radar_screen_center(rect.left + rect.width / 2.0f, rect.top + rect.height / 2.0f);

    if (target_spaceship && missile_tube_controls)
    {
        for(int n=0; n<target_spaceship->weapon_tube_count; n++)
        {
            if (!target_spaceship->weapon_tube[n].isLoaded())
                continue;
            sf::Vector2f fire_position = target_spaceship->getPosition() + sf::rotateVector(target_spaceship->ship_template->model_data->getTubePosition2D(n), target_spaceship->getRotation());

            const MissileWeaponData& data = MissileWeaponData::getDataFor(target_spaceship->weapon_tube[n].getLoadType());
            float fire_angle = target_spaceship->weapon_tube[n].getDirection() + (target_spaceship->getRotation());
            float missile_target_angle = fire_angle;
            float speed = data.speed * target_spaceship->getSystemEffectiveness(SYS_MissileSystem);
            if (data.turnrate > 0.0f)
            {
                if (missile_tube_controls->getManualAim())
                {
                    missile_target_angle = missile_tube_controls->getMissileTargetAngle();
                }else{
                    float firing_solution = target_spaceship->weapon_tube[n].calculateFiringSolution(target_spaceship->getTarget());
                    if (firing_solution != std::numeric_limits<float>::infinity())
                        missile_target_angle = firing_solution;
                }
            }

            float angle_diff = sf::angleDifference(missile_target_angle, fire_angle);
            float turn_radius = ((360.0f / data.turnrate) * speed) / (2.0f * M_PI);
            if (data.turnrate == 0.0f)
                turn_radius = 0.0f;

            float left_or_right = 90;
            if (angle_diff > 0)
                left_or_right = -90;

            sf::Vector2f turn_center = sf::vector2FromAngle(fire_angle + left_or_right) * turn_radius;
            sf::Vector2f turn_exit = turn_center + sf::vector2FromAngle(missile_target_angle - left_or_right) * turn_radius;

            float turn_distance = fabs(angle_diff) / 360.0 * (turn_radius * 2.0f * M_PI);
            float lifetime_after_turn = data.lifetime - turn_distance / speed;
            float length_after_turn = speed * lifetime_after_turn;

            sf::VertexArray a(sf::LinesStrip, 13);
            a[0].position = fire_position;
            for(int cnt=0; cnt<10; cnt++)
                a[cnt + 1].position = fire_position + (turn_center + sf::vector2FromAngle(fire_angle - angle_diff / 10.0f * cnt - left_or_right) * turn_radius);
            a[11].position = fire_position + turn_exit;
            a[12].position = fire_position + (turn_exit + sf::vector2FromAngle(missile_target_angle) * length_after_turn);
            for(int cnt=0; cnt<13; cnt++) {
                a[cnt].position = worldToScreen(a[cnt].position);
                a[cnt].color = sf::Color(255, 255, 255, 128);
            }
            window.draw(a);

            float offset = seconds_per_distance_tick * speed;
            for(int cnt=0; cnt<floor(data.lifetime / seconds_per_distance_tick); cnt++)
            {
                sf::Vector2f p;
                sf::Vector2f n;
                if (offset < turn_distance)
                {
                    n = sf::vector2FromAngle(fire_angle - (angle_diff * offset / turn_distance) - left_or_right);
                    p = worldToScreen(fire_position + (turn_center + n * turn_radius));
                }else{
                    p = worldToScreen(fire_position + (turn_exit + sf::vector2FromAngle(missile_target_angle) * (offset - turn_distance)));
                    n = sf::vector2FromAngle(missile_target_angle + 90.0f);
                }
                n = sf::rotateVector(n, -getViewRotation());
                n = sf::normalize(n);
                sf::VertexArray a(sf::Lines, 2);
                a[0].position = p - n * 10.0f;
                a[1].position = p + n * 10.0f;
                window.draw(a);

                offset += seconds_per_distance_tick * speed;
            }
        }
    }

    if (getTargets())
    {
        for(P<SpaceObject> obj : getTargets()->getTargets())
        {
            if (obj->getVelocity() < 1.0f)
                continue;

            sf::VertexArray a(sf::Lines, 12);
            a[0].position = worldToScreen(obj->getPosition());
            a[0].color = sf::Color(255, 255, 255, 128);
            a[1].position = worldToScreen(obj->getPosition() + obj->getVelocity() * 60.0f);
            a[1].color = sf::Color(255, 255, 255, 0);
            sf::Vector2f n = sf::normalize(sf::rotateVector(sf::Vector2f(-obj->getVelocity().y, obj->getVelocity().x), -getViewRotation()));
            for(int cnt=0; cnt<5; cnt++)
            {
                sf::Vector2f p = sf::rotateVector(obj->getVelocity() * (seconds_per_distance_tick * (cnt + 1.0f) * getScale()), -getViewRotation());
                a[2 + cnt * 2].position = a[0].position + p + n * 10.0f;
                a[3 + cnt * 2].position = a[0].position + p - n * 10.0f;
                a[2 + cnt * 2].color = a[3 + cnt * 2].color = sf::Color(255, 255, 255, 128 - cnt * 20);
            }
            window.draw(a);
        }
    }
}

void GuiRadarView::drawMissileTubes(sf::RenderTarget& window)
{
    if (target_spaceship)
    {
        sf::VertexArray a(sf::Lines, target_spaceship->weapon_tube_count * 2);
        for(int n=0; n<target_spaceship->weapon_tube_count; n++)
        {
            sf::Vector2f fire_position = target_spaceship->getPosition() + sf::rotateVector(target_spaceship->ship_template->model_data->getTubePosition2D(n), target_spaceship->getRotation());
            sf::Vector2f fire_draw_position = worldToScreen(fire_position);

            float fire_angle = target_spaceship->getRotation() + target_spaceship->weapon_tube[n].getDirection() - getViewRotation();
            
            a[n * 2].position = fire_draw_position;
            a[n * 2 + 1].position = fire_draw_position + (sf::vector2FromAngle(fire_angle) * 1000.0f) * getScale();
            a[n * 2].color = sf::Color(128, 128, 128, 128);
            a[n * 2 + 1].color = sf::Color(128, 128, 128, 0);
        }
        window.draw(a);
    }
}

void GuiRadarView::drawObjects(sf::RenderTarget& window)
{

    std::unordered_set<SpaceObject*> visible_objects;
    visible_objects.reserve(space_object_list.size());
    switch(fog_style)
    {
    case NoFogOfWar:
        foreach(SpaceObject, obj, space_object_list)
        {
            visible_objects.emplace(*obj);
        }
        break;
    case FriendlysShortRangeFogOfWar:
        // Reveal objects if they are within short-range radar range (or 5U) of
        // a friendly ship, station, or scan probe.

        // Continue only if the player's ship exists.
        if (!my_spaceship)
        {
            return;
        }

        // For each SpaceObject on the map...
        foreach(SpaceObject, obj, space_object_list)
        {
            // If the object can't hide in a nebula, it's considered visible.
            if (!obj->canHideInNebula())
            {
                visible_objects.emplace(*obj);
            }
            // IN DAID VERSION
            // Consider the object only if it is:
            // - Any ShipTemplateBasedObject (ship or station)
            // - A SpaceObject belonging to a friendly faction
            // - The player's ship
            // - A scan probe owned by the player's ship
            // This check is duplicated in RelayScreen::onDraw.
            // Here this is other thing :

            if (target_spaceship && (obj->faction_id != target_spaceship->faction_id) && (obj->personality_id != 1))
                continue;

            // Get the radar range, either ship template based, probe or ourself
            P<ShipTemplateBasedObject> stb_obj = obj;
            
            if (!stb_obj && !P<ScanProbe>(obj) && !P<WormHole>(obj) && !P<Planet>(obj))
                continue;

            if (target_spaceship && (obj->id_galaxy != target_spaceship->id_galaxy))
                continue;

            // Set the radius to reveal as getShortRangeRadarRange() if the
            // object's a ShipTemplateBasedObject. Otherwise, default to 5U.
            float radar_range = stb_obj ? stb_obj->getShortRangeRadarRange() : 5000.0f;

            P<ScanProbe> sp = obj;
            if (sp && sp->owner_id == my_spaceship->getMultiplayerId())
            {
                radar_range = my_spaceship->getProbeRangeRadarRange();
            } 
            else if(target_spaceship == obj) //we already checked we shared same faction
            {
                //TODO FIXME verifier pourquoi c'est que moi et pas les autres de ma faction
                radar_range = gameGlobalInfo->use_long_range_for_relay ? target_spaceship->getLongRangeRadarRange() : target_spaceship->getShortRangeRadarRange();
            }     

            // Query for objects within short-range radar/5U of this object.
            sf::Vector2f position = obj->getPosition();
            PVector<Collisionable> obj_list = CollisionManager::queryArea(position - sf::Vector2f(radar_range, radar_range), position + sf::Vector2f(radar_range, radar_range));
            foreach(Collisionable, c_obj, obj_list)
            {
                P<SpaceObject> obj2 = c_obj;
                if (obj2 && (obj->getPosition() - obj2->getPosition()) < radar_range + obj2->getRadius())
                {
                    if (obj2->canHideInNebula() && Nebula::blockedByNebula(obj2->getPosition(), obj->getPosition(), my_spaceship->getShortRangeRadarRange()))
                        continue;
                    visible_objects.emplace(*obj2);
                }
            }
        }

        break;
    case NebulaFogOfWar:
        if (!target_spaceship)
            return;
            
        foreach(SpaceObject, obj, space_object_list)
        {
            if (target_spaceship && (obj->id_galaxy != target_spaceship->id_galaxy))
                continue;
            //Here : blockedByNebula can be extremely costly. This is a "Nebula fog of war and radar range" then.
            if ((target_spaceship->getPosition() - obj->getPosition()) > getDistance() + obj->getRadius())
                continue;

            if (obj->canHideInNebula() && target_spaceship && Nebula::blockedByNebula(target_spaceship->getPosition(), obj->getPosition(), my_spaceship->getShortRangeRadarRange()))
                continue;
            visible_objects.emplace(*obj);
        }
        break;
    case NoObjects:
        foreach(SpaceObject, obj, space_object_list)
        {
            if (P<Nebula>(obj) || P<BlackHole>(obj))
                visible_objects.insert(*obj);
        }
        break;
    }
    const float scale = getScale();
    auto draw_object = [&window, this, scale](SpaceObject* obj)
    {
        if (target_spaceship && (obj->id_galaxy != target_spaceship->id_galaxy))
            return;

        sf::Vector2f object_position_on_screen = worldToScreen(obj->getPosition());
        float r = obj->getRadius() * getScale();
        sf::FloatRect object_rect(object_position_on_screen.x - r, object_position_on_screen.y - r, r * 2, r * 2);
        if (obj != *target_spaceship && rect.intersects(object_rect))
        {
            if (obj->getTransparency() < 0.5)
                obj->drawOnRadar(window, object_position_on_screen, getScale(), getViewRotation(), long_range);
            if (show_callsigns && obj->getCallSign() != "" && obj->getTransparency() < 0.2)
                drawText(window, sf::FloatRect(object_position_on_screen.x, object_position_on_screen.y - 15, 0, 0), obj->getCallSign(), ACenter, 15, bold_font);
        }
    };

    window.setActive(true);
    glStencilFunc(GL_EQUAL, as_mask(RadarStencil::RadarBounds), as_mask(RadarStencil::RadarBounds));
    for(SpaceObject* obj : visible_objects)
    {
            draw_object(obj);
    }
    if (target_spaceship)
    {
        sf::Vector2f object_position_on_screen = worldToScreen(target_spaceship->getPosition());
        target_spaceship->drawOnRadar(window, object_position_on_screen, getScale(), getViewRotation(), long_range);
        if (long_range && show_callsigns && target_spaceship->getCallSign() != "")
            drawText(window, sf::FloatRect(object_position_on_screen.x, object_position_on_screen.y - 15, 0, 0), target_spaceship->getCallSign(), ACenter, 15, bold_font);
    }
}

void GuiRadarView::drawObjectsGM(sf::RenderTarget& window)
{
    foreach(SpaceObject, obj, space_object_list)
    {
        sf::Vector2f object_position_on_screen = worldToScreen(obj->getPosition());
        float r = obj->getRadius() * getScale();
        sf::FloatRect object_rect(object_position_on_screen.x - r, object_position_on_screen.y - r, r * 2, r * 2);
        if (rect.intersects(object_rect))
        {
            if (obj->getTransparency() >= 0.5)
                obj->drawOnRadar(window, object_position_on_screen, getScale(), getViewRotation(), long_range);
            obj->drawOnGMRadar(window, object_position_on_screen, getScale(), getViewRotation(), long_range);
        }
    }
}

void GuiRadarView::drawHeadingIndicators(sf::RenderTarget& window)
{
    float boundingRadius = std::min(rect.width, rect.height) / 2.0f; //NOT divided by distance here, attention. Do not use getScale() !

    sf::Vector2f radar_screen_center(rect.left + rect.width / 2.0f, rect.top + rect.height / 2.0f);
    // If radar is 600-800px then tigs run every 20 degrees, small tigs every 5.
    // So if radar is 400-600x then the tigs should run every 45 degrees and smalls every 5.
    // If radar is <400px, tigs every 90, smalls every 10.
    unsigned int tig_interval = 20;
    unsigned int small_tig_interval = 5;

    if (boundingRadius >= 300.0f)
    {
        tig_interval = 20;
        small_tig_interval = 5;
    }
    else if (boundingRadius > 200.0f && boundingRadius <= 300.0f)
    {
        tig_interval = 45;
        small_tig_interval = 5;
    }
    else if (boundingRadius <= 200.0f)
    {
        tig_interval = 90;
        small_tig_interval = 10;
    }

    sf::VertexArray tigs(sf::Lines, 360 / tig_interval * 2);
    for(unsigned int n = 0; n < 360; n += tig_interval)
    {
        tigs[n / tig_interval * 2].position = radar_screen_center + sf::vector2FromAngle(float(n) - 90 - getViewRotation()) * (boundingRadius - 20);
        tigs[n / tig_interval * 2 + 1].position = radar_screen_center + sf::vector2FromAngle(float(n) - 90 - getViewRotation()) * (boundingRadius - 40);
    }
    window.draw(tigs);

    sf::VertexArray small_tigs(sf::Lines, 360 / small_tig_interval * 2);
    for(unsigned int n = 0; n < 360; n += small_tig_interval)
    {
        small_tigs[n / small_tig_interval * 2].position = radar_screen_center + sf::vector2FromAngle(float(n) - 90 - getViewRotation()) * (boundingRadius - 20);
        small_tigs[n / small_tig_interval * 2 + 1].position = radar_screen_center + sf::vector2FromAngle(float(n) - 90 - getViewRotation()) * (boundingRadius - 30);
    }
    window.draw(small_tigs);

    for(unsigned int n = 0; n < 360; n += tig_interval)
    {
        sf::Text text(string(n), *main_font, 15);
        text.setPosition(radar_screen_center + sf::vector2FromAngle(float(n) - 90 - getViewRotation()) * (boundingRadius - 45));
        text.setOrigin(text.getLocalBounds().width / 2.0, text.getLocalBounds().height / 2.0);
        text.setRotation(n-getViewRotation());
        window.draw(text);
    }
}

void GuiRadarView::drawRadarCutoff(sf::RenderTarget& window)
{
    sf::Vector2f radar_screen_center(rect.left + rect.width / 2.0f, rect.top + rect.height / 2.0f);
    float screen_size = std::min(rect.width, rect.height) / 2.0f;

    sf::Sprite cutOff;
    textureManager.setTexture(cutOff, "radarCutoff.png");
    cutOff.setPosition(radar_screen_center);
    cutOff.setScale(screen_size / float(cutOff.getTextureRect().width) * 2, screen_size / float(cutOff.getTextureRect().width) * 2);
    window.draw(cutOff);

    sf::RectangleShape rectTop(sf::Vector2f(rect.width, radar_screen_center.y - screen_size - rect.top));
    rectTop.setFillColor(sf::Color::Black);
    rectTop.setPosition(rect.left, rect.top);
    window.draw(rectTop);
    sf::RectangleShape rectBottom(sf::Vector2f(rect.width, rect.height - screen_size - (radar_screen_center.y - rect.top)));
    rectBottom.setFillColor(sf::Color::Black);
    rectBottom.setPosition(rect.left, radar_screen_center.y + screen_size);
    window.draw(rectBottom);

    sf::RectangleShape rectLeft(sf::Vector2f(radar_screen_center.x - screen_size - rect.left, rect.height));
    rectLeft.setFillColor(sf::Color::Black);
    rectLeft.setPosition(rect.left, rect.top);
    window.draw(rectLeft);
    sf::RectangleShape rectRight(sf::Vector2f(rect.width - screen_size - (radar_screen_center.x - rect.left), rect.height));
    rectRight.setFillColor(sf::Color::Black);
    rectRight.setPosition(radar_screen_center.x + screen_size, rect.top);
    window.draw(rectRight);
}

bool GuiRadarView::onMouseDown(sf::Vector2f position)
{
    if (style == Circular || style == CircularMasked)
    {
        float radius = std::min(rect.width, rect.height) / 2.0f;
        if (position - getCenterPoint() > radius)
            return false;
    }
    return SectorsView::onMouseDown(position);
}
