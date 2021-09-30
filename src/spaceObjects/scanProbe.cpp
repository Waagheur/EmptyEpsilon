#include <GL/glew.h>
#include "scanProbe.h"
#include "explosionEffect.h"
#include "main.h"
#include "playerSpaceship.h"

#include "scriptInterface.h"

/// A scan probe.
REGISTER_SCRIPT_SUBCLASS(ScanProbe, SpaceObject)
{
    /// Set the probe's speed. A value of 1000 = 1U/second.
    /// Probes move at a fixed rate of speed and ignore physics.
    /// Requires a float value. The default vaule is 1000.
    /// Example: probe:setSpeed(2000)
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, setSpeed);
    /// Get the probe's speed. A value of 1000 = 1U/second.
    /// Returns a float value.
    /// Example: local speed = probe:getSpeed()
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, getSpeed);
    /// Set the probe's remaining lifetime, in seconds.
    /// The default initial lifetime is 10 minutes.
    /// Example: probe:setLifetime(60 * 5)
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, setLifetime);
    /// Get the probe's remaining lifetime.
    /// Example: local lifetime = probe:getLifetime()
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, getLifetime);
    /// Set the probe's target coordinates.
    /// Example: probe:setTarget(1000, 5000)
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, setTarget);
    /// Get the probe's target coordinates.
    /// Example: local targetX, targetY = probe:getTarget()
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, getTarget);
    /// Set the probe's owner SpaceObject.
    /// Requires a SpaceObject.
    /// Example: probe:setOwner(owner_ship)
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, setOwner);
    /// Get the probe's owner SpaceObject.
    /// Example: local owner_ship = probe:getOwner()
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, getOwner);
    /// Callback when the probe arrives to its target coordinates.
    /// Passes the probe and position as arguments to the callback.
    /// Example: probe:onArrival(probeArrived)
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, onArrival);
    /// Callback when the probe's lifetime expires.
    /// Passes the probe as an argument to the callback.
    /// Example: probe:onExpiration(probeExpired)
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, onExpiration);
    /// Callback when the probe is destroyed by damage.
    /// Passes the probe and instigator as arguments to the callback.
    /// Example: probe:onDestruction(probeDestroyed)
    REGISTER_SCRIPT_CLASS_FUNCTION(ScanProbe, onDestruction);
}

REGISTER_MULTIPLAYER_CLASS(ScanProbe, "ScanProbe");
ScanProbe::ScanProbe()
: SpaceObject(100, "ScanProbe"),
  probe_speed(1000.0f)
{
    lifetime = 60 * 60; // 60 minutes
    hull = 2;
    has_arrived = false;

    registerMemberReplication(&owner_id, 0.5);
    registerMemberReplication(&probe_speed, 0.1);
    registerMemberReplication(&target_position, 0.1);
    registerMemberReplication(&lifetime, 60.0);

    // Give the probe a small electrical radar signature.
    setRadarSignatureInfo(0.0, 0.2, 0.0);

    // Randomly select a probe model.
    switch(irandom(1, 3))
    {
        case 1:
        {
            model_info.setData("SensorBuoyMKI");
            break;
        }
        case 2:
        {
            model_info.setData("SensorBuoyMKII");
            break;
        }
        default:
        {
            model_info.setData("SensorBuoyMKIII");
        }
    }

    // Assign a generic callsign.
    setCallSign(string(getMultiplayerId()) + "P");
}

// Due to a suspected compiler bug, this deconstructor must be explicitly
// defined.
ScanProbe::~ScanProbe()
{
}

void ScanProbe::setSpeed(float probe_speed)
{
    this->probe_speed = probe_speed > 0.0f ? probe_speed : 0.0f;
}

float ScanProbe::getSpeed()
{
    return this->probe_speed;
}

void ScanProbe::setLifetime(float lifetime)
{
    this->lifetime = lifetime > 0.0f ? lifetime : 0.0f;
}

float ScanProbe::getLifetime()
{
    return this->lifetime;
}

void ScanProbe::update(float delta)
{
    // Tick down lifetime until expiration, then destroy the probe.
    lifetime -= delta;

    if (lifetime <= 0.0)
    {
        // Fire the onExpiration callback, if set.
        if (on_expiration.isSet())
        {
            on_expiration.call<void>(P<ScanProbe>(this));
        }

        destroy();
    }

    // The probe moves in a straight line to its destination, independent of
    // physics and at a fixed rate of speed.
    auto diff = target_position - getPosition();
    float movement = delta * probe_speed;
    float distance = glm::length(diff);

    // If the probe's outer radius hasn't reached the target position ...
    if (distance > getRadius())
    {
        // The probe is still in transit.
        has_arrived = false;

        // Normalize the diff.
        auto v = glm::normalize(diff);

        // Update the probe's heading.
        setHeading(vec2ToAngle(v) + 90.0f);

        // Move toward the target position at the given rate of speed.
        // However, don't overshoot the target if traveling so fast that the
        // movement per tick is greater than the distance to the destination.
        if (distance < movement)
        {
            movement = distance;
        }

        setPosition(getPosition() + v * movement);
    }
    else if (!has_arrived)
    {
        // The probe arrived to its destination.
        has_arrived = true;

        // Fire the onArrival callback, if set.
        if (on_arrival.isSet())
        {
            on_arrival.call<void>(P<ScanProbe>(this), getPosition().x, getPosition().y);
        }
    }
}

void ScanProbe::collide(Collisionable* target, float force)
{
    if (!game_server)
        return;
    P<PlayerSpaceship> player = P<Collisionable>(target);
    if (!player)
        return;
    if (player -> getMultiplayerId() != owner_id)
        return;
    if (glm::length(getTarget() - getPosition()) > getRadius())
        return;
    player -> scan_probe_stock = player -> scan_probe_stock + 1;
    destroy();
}

bool ScanProbe::canBeTargetedBy(P<SpaceObject> other)
{
    // The probe cannot be targeted until it reaches its destination.
    return glm::length2(getTarget() - getPosition()) < getRadius()*getRadius();
}

void ScanProbe::takeDamage(float damage_amount, DamageInfo info)
{
    // Fire the onDestruction callback, if set. Pass the damage instigator if
    // there was one.
    if (on_destruction.isSet())
    {
        if (info.instigator)
        {
            on_destruction.call<void>(P<ScanProbe>(this), P<SpaceObject>(info.instigator));
        }
        else
        {
            on_destruction.call<void>(P<ScanProbe>(this));
        }
    }

    // Any amount of damage instantly destroys the probe.
    destroy();
}

void ScanProbe::drawOnRadar(sp::RenderTarget& renderer, glm::vec2 position, float scale, float rotation, bool long_range)
{
    // All probes use the same green icon on radar.
    renderer.drawSprite("radar/probe.png", position, 10, glm::u8vec4(96, 192, 128, 255));

    if (long_range && !has_arrived)
    {
        float distance = glm::length(position - glm::vec2(target_position.x, target_position.y));
        if (distance > 1000.0)
        {
                renderer.drawLine(position, position + glm::vec2(target_position.x, target_position.y) - glm::vec2(getPosition().x, getPosition().y)*scale, glm::u8vec4(255, 255, 255, 32));
        }
    }
}

void ScanProbe::drawOnGMRadar(sp::RenderTarget& renderer, glm::vec2 position, float scale, float rotation, bool long_range)
{
    SpaceObject::drawOnGMRadar(renderer, position, scale, rotation, long_range);
    if (long_range)
    {
        P<PlayerSpaceship> player = owner;
        if(player)
        {
            renderer.drawCircleOutline(position, player->getProbeRangeRadarRange()*scale, 3.0, glm::u8vec4(255, 255, 255, 64));
        }
    }
}

void ScanProbe::setOwner(P<SpaceObject> owner)
{
    if (!owner)
    {
        return;
    }

    // Set the probe's faction and ship ownership based on the passed object.
    setFactionId(owner->getFactionId());
    this->owner = owner;
    owner_id = owner->getMultiplayerId();
}

void ScanProbe::onArrival(ScriptSimpleCallback callback)
{
    this->on_arrival = callback;
}

void ScanProbe::onDestruction(ScriptSimpleCallback callback)
{
    this->on_destruction = callback;
}

void ScanProbe::onExpiration(ScriptSimpleCallback callback)
{
    this->on_expiration = callback;
}
