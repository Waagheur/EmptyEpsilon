#include "warpJammer.h"
#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "explosionEffect.h"
#include "main.h"

#include "scriptInterface.h"

/// A warp jammer.
REGISTER_SCRIPT_SUBCLASS(WarpJammer, SpaceObject)
{
    REGISTER_SCRIPT_CLASS_FUNCTION(WarpJammer, setRange);
    /// Set a function that will be called if the warp jammer is taking damage.
    /// First argument given to the function will be the warp jammer, the second the instigator SpaceObject (or nil).
    REGISTER_SCRIPT_CLASS_FUNCTION(WarpJammer, onTakingDamage);
    /// Set a function that will be called if the warp jammer is destroyed by taking damage.
    /// First argument given to the function will be the warp jammer, the second the instigator SpaceObject that gave the final blow (or nil).
    REGISTER_SCRIPT_CLASS_FUNCTION(WarpJammer, onDestruction);
}


static int isWarpJammed(lua_State* L)
{
    float x = luaL_checknumber(L, 1);
    float y = luaL_checknumber(L, 2);
    
    lua_pushboolean(L, WarpJammer::isWarpJammed(glm::vec2(x,y)));
    return 1;
}
/// Tests if position is warp jammed by any WarpJammer
/// Arguments are x and y position
REGISTER_SCRIPT_FUNCTION(isWarpJammed);

static int getFirstNoneJammedPosition(lua_State* L)
{
    float x_src = luaL_checknumber(L, 1);
    float y_src = luaL_checknumber(L, 2);

    float x_dest = luaL_checknumber(L, 3);
    float y_dest = luaL_checknumber(L, 4);

    glm::vec2 start{x_src, y_src};
    glm::vec2 end{x_dest, y_dest};

    glm::vec2 ret = WarpJammer::getFirstNoneJammedPosition(start, end);

    lua_pushnumber(L, ret.x);
    lua_pushnumber(L, ret.y);

    return 2;
}
REGISTER_SCRIPT_FUNCTION(getFirstNoneJammedPosition);

REGISTER_MULTIPLAYER_CLASS(WarpJammer, "WarpJammer");

PVector<WarpJammer> WarpJammer::jammer_list;

WarpJammer::WarpJammer()
: SpaceObject(100, "WarpJammer")
{
    range = 7000.0;
    hull = 50;

    jammer_list.push_back(this);
    setRadarSignatureInfo(0.05, 0.5, 0.0);

    registerMemberReplication(&range);

    model_info.setData("shield_generator");
}

// Due to a suspected compiler bug this desconstructor needs to be explicity defined
WarpJammer::~WarpJammer()
{
}

void WarpJammer::drawOnRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, float rotation, bool long_range)
{
    sf::Sprite object_sprite;
    textureManager.setTexture(object_sprite, "RadarBlip.png");
    object_sprite.setRotation(getRotation());
    object_sprite.setPosition(position);
    if (my_spaceship && my_spaceship->isEnemy(this))
        object_sprite.setColor(sf::Color(255, 0, 0));
    else
        object_sprite.setColor(sf::Color(200, 150, 100));
    float size = 0.6;
    object_sprite.setScale(size, size);
    window.draw(object_sprite);

    if (long_range)
    {
        sf::CircleShape range_circle(range * scale);
        range_circle.setOrigin(range * scale, range * scale);
        range_circle.setPosition(position);
        range_circle.setFillColor(sf::Color::Transparent);
        if (my_spaceship && my_spaceship->isEnemy(this))
            range_circle.setOutlineColor(sf::Color(255, 0, 0, 64));
        else
            range_circle.setOutlineColor(sf::Color(200, 150, 100, 64));
        range_circle.setOutlineThickness(2.0);
        window.draw(range_circle);
    }
}

void WarpJammer::takeDamage(float damage_amount, DamageInfo info)
{
    if (info.type == DT_EMP)
        return;
    hull -= damage_amount;
    if (hull <= 0)
    {
        P<ExplosionEffect> e = new ExplosionEffect();
        e->setSize(getRadius());
        e->setPosition(getPosition());
        e->setRadarSignatureInfo(0.5, 0.5, 0.1);

        if (on_destruction.isSet())
        {
            if (info.instigator)
            {
                on_destruction.call<void>(P<WarpJammer>(this), P<SpaceObject>(info.instigator));
            } else {
                on_destruction.call<void>(P<WarpJammer>(this));
            }
        }

        destroy();
    } else {
        if (on_taking_damage.isSet())
        {
            if (info.instigator)
            {
                on_taking_damage.call<void>(P<WarpJammer>(this), P<SpaceObject>(info.instigator));
            } else {
                on_taking_damage.call<void>(P<WarpJammer>(this));
            }
        }
    }
}

bool WarpJammer::isWarpJammed(glm::vec2 position)
{
    foreach(WarpJammer, wj, jammer_list)
    {
        if (glm::length2(wj->getPosition() - position) < wj->range * wj->range)
            return true;
    }
    return false;
}

glm::vec2 WarpJammer::getFirstNoneJammedPosition(glm::vec2 start, glm::vec2 end)
{
    auto startEndDiff = end - start;
    float startEndLength = glm::length(startEndDiff);
    P<WarpJammer> first_jammer;
    float first_jammer_f = startEndLength;
    glm::vec2 first_jammer_q{0, 0};
    foreach(WarpJammer, wj, jammer_list)
    {
        float f = glm::dot(startEndDiff, wj->getPosition() - start) / startEndLength;
        if (f < 0.0)
            f = 0;
        glm::vec2 q = start + startEndDiff / startEndLength * f;
        if (glm::length2(q - wj->getPosition()) < wj->range*wj->range)
        {
            if (!first_jammer || f < first_jammer_f)
            {
                first_jammer = wj;
                first_jammer_f = f;
                first_jammer_q = q;
            }
        }
    }
    if (!first_jammer)
        return end;

    float d = glm::length(first_jammer_q - first_jammer->getPosition());
    return first_jammer_q + glm::normalize(start - end) * sqrtf(first_jammer->range * first_jammer->range - d * d);
}

void WarpJammer::onTakingDamage(ScriptSimpleCallback callback)
{
    this->on_taking_damage = callback;
}

void WarpJammer::onDestruction(ScriptSimpleCallback callback)
{
    this->on_destruction = callback;
}

string WarpJammer::getExportLine()
{
    string ret = "WarpJammer():setFaction(\"" + getFaction() + "\"):setPosition(" + string(getPosition().x, 0) + ", " + string(getPosition().y, 0) + ")";
    if (getRange()!=7000.0) {
	    ret += ":setRange("+string(getRange())+")";
    }
    return ret;
}
