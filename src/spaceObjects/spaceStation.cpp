#include "spaceObjects/explosionEffect.h"
#include "spaceObjects/spaceStation.h"
#include "spaceObjects/spaceship.h"
#include "spaceObjects/playerSpaceship.h"
#include "shipTemplate.h"
#include "playerInfo.h"
#include "factionInfo.h"
#include "mesh.h"
#include "main.h"
#include "pathPlanner.h"

#include "scriptInterface.h"
REGISTER_SCRIPT_SUBCLASS(SpaceStation, ShipTemplateBasedObject)
{
}

REGISTER_MULTIPLAYER_CLASS(SpaceStation, "SpaceStation");
SpaceStation::SpaceStation()
: ShipTemplateBasedObject(300, "SpaceStation")
{
    restocks_scan_probes = true;
    restocks_missiles_docked = true;
    comms_script_name = "comms_station.lua";
    setRadarSignatureInfo(0.2, 0.5, 0.5);
    setScanningParameters(2,2);

    callsign = "DS" + string(getMultiplayerId());
}

void SpaceStation::drawOnRadar(sp::RenderTarget& renderer, glm::vec2 position, float scale, float rotation, bool long_range)
{
    string object_sprite;
    glm::u8vec4 color = glm::u8vec4(255,255,255,255);
    // If the object is a station that hasn't been scanned, draw the default icon.
    // Otherwise, draw the station-specific icon.
	float sprite_scale = 0.2f;
	if (my_spaceship && (getScannedStateFor(my_spaceship) == SS_NotScanned || getScannedStateFor(my_spaceship) == SS_FriendOrFoeIdentified) && getFactionId() != my_spaceship->getFactionId())
    {
        color = glm::u8vec4(192, 192, 192, 255);
        object_sprite = "radar/blip.png";
    }
    else
    {
        if (factionInfo[getFactionId()])
            color = factionInfo[getFactionId()]->getGMColor();
        object_sprite = radar_trace;
        //sprite_scale = scale * getRadius() * 1.5 / objectSprite.getTextureRect().width;
        sprite_scale = scale * getRadius() * 2.0f / 32;
    }

    if (!long_range)
    {
        sprite_scale *= 0.7f;
        drawShieldsOnRadar(renderer, position, scale, rotation, sprite_scale, true);
    }
    sprite_scale = std::max(0.15f, sprite_scale);

    if(my_spaceship)
    {
        if(getScannedStateFor(my_spaceship) == SS_FriendOrFoeIdentified)
        {
            if(isEnemy(my_spaceship))
            {
                color = glm::u8vec4(255,0,0,255);
            }
            else if(isFriendly(my_spaceship))
            {
                color = glm::u8vec4(128,255,128, 255);
            }
            else
            {
                color = glm::u8vec4(192,192,192, 255);
            }
        }
    }

     renderer.drawRotatedSprite(object_sprite, position, sprite_scale * 32, getRotation() - rotation, color);
}

void SpaceStation::applyTemplateValues()
{
    PathPlannerManager::getInstance()->addAvoidObject(this, getRadius() * 1.5f);
}

void SpaceStation::destroyedByDamage(DamageInfo& info)
{
    ExplosionEffect* e = new ExplosionEffect();
    e->setSize(getRadius());
    e->setPosition(getPosition());
    e->setRadarSignatureInfo(0.0, 0.4, 0.4);

    if (info.instigator)
    {
        float points = 0;
        if (shield_count > 0)
        {
            for(int n=0; n<shield_count; n++)
            {
                points += shield_max[n] * 0.1f;
            }
            points /= shield_count;
        }
        points += hull_max * 0.1f;
        if (isEnemy(info.instigator))
            info.instigator->addReputationPoints(points);
        else
            info.instigator->removeReputationPoints(points);
    }
}

DockStyle SpaceStation::canBeDockedBy(P<SpaceObject> obj)
{
    if (isEnemy(obj))
        return DockStyle::None;
    P<SpaceShip> ship = obj;
    if (!ship)
        return DockStyle::None;
    return DockStyle::External;
}

bool SpaceStation::canBeLandedOn(P<SpaceObject> obj)
{
    if (isEnemy(obj) || !ship_template)
        return false;
    P<SpaceShip> ship = obj;
    if (!ship || !ship->ship_template)
        return false;
    if (ship->getFactionId() != getFactionId())
        return false;
    // return ship_template->can_be_docked_by_class.count(ship->ship_template->getClass()) > 0;
    return true;
}

string SpaceStation::getExportLine()
{
    string ret = "SpaceStation()";
    ret += ":setTemplate(\"" + template_name + "\")";

    if (getShortRangeRadarRange() != ship_template->short_range_radar_range)
    {
        ret += ":setShortRangeRadarRange(" + string(getShortRangeRadarRange(), 0) + ")";
    }

    if (getLongRangeRadarRange() != ship_template->long_range_radar_range)
    {
        ret += ":setLongRangeRadarRange(" + string(getLongRangeRadarRange(), 0) + ")";
    }

    ret += ":setFaction(\"" + getFaction() + "\")";
    ret += ":setCallSign(\"" + getCallSign() + "\")";
    ret += ":setPosition(" + string(getPosition().x, 0) + ", " + string(getPosition().y, 0) + ")";

    return ret;
}
