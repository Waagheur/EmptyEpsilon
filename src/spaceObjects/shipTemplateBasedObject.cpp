#include "shipTemplateBasedObject.h"
#include "spaceship.h"
#include "gameGlobalInfo.h"

#include "scriptInterface.h"

#include "i18n.h"

REGISTER_SCRIPT_SUBCLASS_NO_CREATE(ShipTemplateBasedObject, SpaceObject)
{
    /// Set the template to be used for this ship or station. Templates define hull/shields/looks etc.
    /// Examples:
    /// CpuShip():setTemplate("Phobos T3")
    /// PlayerSpaceship():setTemplate("Phobos M3P")
    /// SpaceStation():setTemplate("Large Station")
    /// WARNING: Using a string that is not a valid template name lets the game crash! This is case-sensitive.
    /// See `scripts/shipTemplates.lua` for the existing templates.
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setTemplate);
    /// [Depricated]
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setShipTemplate);
    /// Set the class name of this object. Normally the class name is copied from the template name (Ex "Cruiser") but you can override it with this function.
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setTypeName);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getTypeName);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getClass);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getSubClass);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getHackDiff);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setHackDiff);
    /// Get the current amount of hull
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getHull);
    /// Get the maximum hull value
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getHullMax);
    /// Set the current hull value, note that setting this to 0 does not destroy the station.
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setHull);
    /// Set the maximum amount of hull for this station. Stations never repair hull damage, so this only effects the percentage displays
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setHullMax);
    /// Set whether the object can be destroyed.
    /// Requires a Boolean value.
    /// Example: ship:setCanBeDestroyed(true)
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setCanBeDestroyed);
    /// Get whether the object can be destroyed.
    /// Returns a Boolean value.
    /// Example: ship:getCanBeDestroyed()
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getCanBeDestroyed);
    /// Get the specified shield's current level.
    /// Requires an integer index value.
    /// Returns a float value.
    /// Example to get shield level on front shields of a ship with two shields:
    ///     ship:getShieldLevel(0)
    /// Rear shields: ship:getShieldLevel(1)
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getShieldLevel);
    /// Get the number of shields on this object.
    /// For example, a ship with 1 shield count has a single shield covering
    /// all angles, a ship with 2 covers front and back, etc.
    /// Returns an integer count.
    /// Example: ship:getShieldCount()
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getShieldCount);
    /// Get the maxium shield level.
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getShieldMax);
    /// Set the current amount of shields.
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setShields);
    /// Sets by how much the shields recharge over time for all shields. Default value is 0.3. Value is a float.
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setShieldRechargeRate);
    /// Set the maximum shield level. Note that this does low the current shield level when the max becomes lower, but it does not increase the shield level.
    /// A seperate call to setShield is needed for that.
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setShieldsMax);
    /// Set the icon to be used for this object on the radar.
    /// For example, station:setRadarTrace("arrow.png") will show an arrow instead of a dot for this station.
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setRadarTrace);
    /// Set the sound file to be used for this object's impulse engines.
    /// Requires a string for a filename relative to the resources path.
    /// Example: setImpulseSoundFile("engine.wav")
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setImpulseSoundFile);
    /// Are the shields online or not. Currently always returns true except for player ships, as only players can turn off shields.
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getShieldsActive);

    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getSharesEnergyWithDocked);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setSharesEnergyWithDocked);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getRepairDocked);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setRepairDocked);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getRestocksScanProbes);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setRestocksScanProbes);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getRestocksMissilesDocked);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setRestocksMissilesDocked);

    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getLongRangeRadarRange);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getShortRangeRadarRange);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setLongRangeRadarRange);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setShortRangeRadarRange);

    /// [Depricated]
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getFrontShield);
    /// [Depricated]
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getFrontShieldMax);
    /// [Depricated]
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setFrontShield);
    /// [Depricated]
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setFrontShieldMax);
    /// [Depricated]
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getRearShield);
    /// [Depricated]
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getRearShieldMax);
    /// [Depricated]
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setRearShield);
    /// [Depricated]
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setRearShieldMax);
    /// Set a function that will be called if the object is taking damage.
    /// First argument given to the function will be the object taking damage, the second the instigator SpaceObject (or nil).
    /// If instigator is not nil, you will get in this order :
    /// a string which is the damage type as defined in EDamageType and converted as string in shipTemplate source, 
    /// a number which is the frequency used, 
    /// a string which is the subsystem hit, 
    /// two floats which are resp. damage taken by shields and damage taken by hull
    /// and a number which is the shield index if shield is hit, -1 if no shield is hit
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, onTakingDamage);
    /// Set a function that will be called if the object is destroyed by taking damage.
    /// First argument given to the function will be the object taking damage, the second the instigator SpaceObject that gave the final blow (or nil).
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, onDestruction);
    //Ajouts Tdelc
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setRotationSpeed);
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, getRotationSpeed);

    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setSystemDamageRatio);//multiplies the damage applied to systems when hit
    REGISTER_SCRIPT_CLASS_FUNCTION(ShipTemplateBasedObject, setSystemDamageHullThreshold);//if the hull has a higher percentage than this, no damage to systems occur.
}

ShipTemplateBasedObject::ShipTemplateBasedObject(float collision_range, string multiplayer_name, float multiplayer_significant_range)
: SpaceObject(collision_range, multiplayer_name, multiplayer_significant_range)
{
    setCollisionPhysics(true, true);

    shield_count = 0;
    for(int n=0; n<max_shield_count; n++)
    {
        shield_level[n] = 0.0;
        shield_max[n] = 0.0;
        shield_hit_effect[n] = 0.0;
    }
    hull_strength = hull_max = 100.0;

    long_range_radar_range = 30000.0f;
    short_range_radar_range = 5000.0f;

    registerMemberReplication(&template_name);
    registerMemberReplication(&type_name);
    registerMemberReplication(&shield_count);
    for(int n=0; n<max_shield_count; n++)
    {
        registerMemberReplication(&shield_level[n], 0.5);
        registerMemberReplication(&shield_max[n]);
        registerMemberReplication(&shield_hit_effect[n], 0.5);
    }
    registerMemberReplication(&radar_trace);
    registerMemberReplication(&impulse_sound_file);
    registerMemberReplication(&hull_strength, 0.5);
    registerMemberReplication(&hull_max);
    registerMemberReplication(&long_range_radar_range, 0.5);
    registerMemberReplication(&short_range_radar_range, 0.5);

    callsign = "[" + string(getMultiplayerId()) + "]";

//    hack_diff = 0;

    hack_protect = false;

    registerMemberReplication(&hack_diff);
    registerMemberReplication(&hack_protect);

    can_be_destroyed = true;
    registerMemberReplication(&can_be_destroyed);

    lock_fire = true;
    registerMemberReplication(&lock_fire);

    rotation_speed = 0.0;
    registerMemberReplication(&rotation_speed);

    system_damage_ratio = 1.0f;
    registerMemberReplication(&system_damage_ratio);

    system_damage_hull_threshold = 0.0f;
    registerMemberReplication(&system_damage_hull_threshold);

    shield_recharge_rate = 0.3f;
    registerMemberReplication(&shield_recharge_rate);
}

void ShipTemplateBasedObject::drawShieldsOnRadar(sp::RenderTarget& renderer, glm::vec2 position, float scale, float rotation, float sprite_scale, bool show_levels)
{
    if (!getShieldsActive())
        return;
    if (shield_count == 1)
    {
        glm::u8vec4 color = glm::u8vec4(255, 255, 255, 64);
        if (show_levels)
        {
            float level = shield_level[0] / shield_max[0];
            color = Tween<glm::u8vec4>::linear(level, 1.0f, 0.0f, glm::u8vec4(128, 128, 255, 128), glm::u8vec4(255, 0, 0, 64));
        }
        if (shield_hit_effect[0] > 0.0f)
        {
            color = Tween<glm::u8vec4>::linear(shield_hit_effect[0], 0.0f, 1.0f, color, glm::u8vec4(255, 0, 0, 128));
        }
        renderer.drawSprite("shield_circle.png", position, sprite_scale * 0.25f * 1.5f * 256.0f, color);
    }else if (shield_count > 1) {
        float direction = getRotation()-rotation;
        float arc = 360.0f / float(shield_count);

        for(int n=0; n<shield_count; n++)
        {
            glm::u8vec4 color = glm::u8vec4(255, 255, 255, 64);
            if (show_levels)
            {
                float level = shield_level[n] / shield_max[n];
                color = Tween<glm::u8vec4>::linear(level, 1.0f, 0.0f, glm::u8vec4(128, 128, 255, 128), glm::u8vec4(255, 0, 0, 64));
            }
            if (shield_hit_effect[n] > 0.0f)
            {
                color = Tween<glm::u8vec4>::linear(shield_hit_effect[n], 0.0f, 1.0f, color, glm::u8vec4(255, 0, 0, 128));
            }

            glm::vec2 delta_a = vec2FromAngle(direction - arc / 2.0f);
            glm::vec2 delta_b = vec2FromAngle(direction);
            glm::vec2 delta_c = vec2FromAngle(direction + arc / 2.0f);
            
            auto p0 = position + delta_b * sprite_scale * 32.0f * 0.05f;
            renderer.drawTexturedQuad("shield_circle.png",
                p0,
                p0 + delta_a * sprite_scale * 32.0f * 1.5f,
                p0 + delta_b * sprite_scale * 32.0f * 1.5f,
                p0 + delta_c * sprite_scale * 32.0f * 1.5f,
                glm::vec2(0.5, 0.5),
                glm::vec2(0.5, 0.5) + delta_a * 0.5f,
                glm::vec2(0.5, 0.5) + delta_b * 0.5f,
                glm::vec2(0.5, 0.5) + delta_c * 0.5f,
                color);
            direction += arc;
        }
    }
}

void ShipTemplateBasedObject::draw3DTransparent(const glm::mat4& object_view_matrix)
{
    if (shield_count < 1)
        return;

    float angle = 0.0;
    float arc = 360.0f / shield_count;
    for(int n = 0; n<shield_count; n++)
    {
        if (shield_hit_effect[n] > 0)
        {
            if (shield_count > 1)
            {
                model_info.renderShield(object_view_matrix, (shield_level[n] / shield_max[n]) * shield_hit_effect[n], angle);
            }else{
                model_info.renderShield(object_view_matrix, (shield_level[n] / shield_max[n]) * shield_hit_effect[n]);
            }
        }
        angle += arc;
    }
}

void ShipTemplateBasedObject::update(float delta)
{
    // All ShipTemplateBasedObjects should have a valid template.
    // If this object lacks a template, or has an inconsistent template...
    if (!ship_template || ship_template->getName() != template_name)
    {
        // Attempt to align the object's template to its reported template name.
        ship_template = ShipTemplate::getTemplate(template_name);

        // If the template still doesn't exist, destroy the object.
        if (!ship_template)
        {
            LOG(ERROR) << "ShipTemplateBasedObject with ID " << string(getMultiplayerId()) << " lacked a template, so it was destroyed.";
            destroy();
            return;
        }

        // If it does exist, set up its collider and model.
        ship_template->setCollisionData(this);
        model_info.setData(ship_template->model_data);
    }

    for(int n=0; n<shield_count; n++)
    {
        if (shield_level[n] < shield_max[n])
        {
            shield_level[n] = std::min(shield_max[n], shield_level[n] + delta * getShieldRechargeRate(n));
        }
        if (shield_hit_effect[n] > 0)
        {
            shield_hit_effect[n] -= delta;
        }
    }
    if (rotation_speed != 0.0)
        setHeading(getHeading()+delta*rotation_speed);
}

std::unordered_map<string, string> ShipTemplateBasedObject::getGMInfo()
{
    std::unordered_map<string, string> ret;
    ret[trMark("gm_info", "CallSign")] = callsign;
    ret[trMark("gm_info", "Type")] = type_name;
    ret[trMark("gm_info", "Hull")] = string(hull_strength) + "/" + string(hull_max);
    for(int n=0; n<shield_count; n++)
    {
        // Note, translators: this is a compromise.
        // Because of the deferred translation the variable parameter can't be forwarded, so it'll always be a suffix.
        ret[trMark("gm_info", "Shield") + string(n + 1)] = string(shield_level[n]) + "/" + string(shield_max[n]);
    }
    return ret;
}

bool ShipTemplateBasedObject::hasShield()
{
    for(int n=0; n<shield_count; n++)
    {
        if (shield_level[n] < shield_max[n] / 50)
            return false;
    }
    return true;
}

void ShipTemplateBasedObject::takeDamage(float damage_amount, DamageInfo info)
{
    signed int hit_shield_index = -1;
    float shield_damage = 0;
    if (shield_count > 0 && getShieldsActive())
    {
        float angle = angleDifference(getRotation(), vec2ToAngle(info.location - getPosition()));
        if (angle < 0)
            angle += 360.0f;
        float arc = 360.0f / float(shield_count);
        int shield_index = int((angle + arc / 2.0f) / arc);
        shield_index %= shield_count;

        shield_damage = damage_amount * getShieldDamageFactor(info, shield_index);
        soundManager->playSound("explosion_shields.wav", getPosition(), 200.0, 1.0, 1.0f + random(-0.1f, 0.1f),shield_damage*100.0);

        damage_amount -= shield_level[shield_index];
        shield_level[shield_index] -= shield_damage;
        hit_shield_index = shield_index;

        if (shield_level[shield_index] < 0)
        {
            shield_level[shield_index] = 0.0;
        } else {
            shield_hit_effect[shield_index] = 1.0;
        }
        if (damage_amount < 0.0f)
        {
            damage_amount = 0.0;
        }
    }

    if (hull_strength > 0)
    {
        if (on_taking_damage.isSet())
        {
            if (info.instigator)
            {
                on_taking_damage.call<void>(P<ShipTemplateBasedObject>(this), P<SpaceObject>(info.instigator), 
                                        info.type, frequencyToDisplayNumber(info.frequency), 
                                        info.system_target, 
                                        shield_damage, 
                                        damage_amount,
                                        hit_shield_index);
            } else {
                on_taking_damage.call<void>(P<ShipTemplateBasedObject>(this));
            }
        }
    }

    if (info.type != DT_EMP && damage_amount > 0.0f)
    {
        soundManager->playSound("explosion.wav", getPosition(), 200.0, 1.0, 1.0f + random(-0.1f, 0.1f),damage_amount*100.0);
        takeHullDamage(damage_amount, info);
    }

    if (hull_strength > 0)
    {
        if (on_taking_damage.isSet())
        {
            if (info.instigator)
            {
                on_taking_damage.call<void>(P<ShipTemplateBasedObject>(this), P<SpaceObject>(info.instigator));
            } else {
                on_taking_damage.call<void>(P<ShipTemplateBasedObject>(this));
            }
        }
    }
}

void ShipTemplateBasedObject::takeHullDamage(float damage_amount, DamageInfo& info)
{
    hull_strength -= damage_amount;
    if (hull_strength <= 0.0f && !can_be_destroyed)
    {
        hull_strength = 1;
    }
    if (hull_strength <= 0.0f)
    {
        destroyedByDamage(info);
        if (on_destruction.isSet())
        {
            if (info.instigator)
            {
                on_destruction.call<void>(P<ShipTemplateBasedObject>(this), P<SpaceObject>(info.instigator));
            } else {
                on_destruction.call<void>(P<ShipTemplateBasedObject>(this));
            }
        }
        destroy();
    }
}

float ShipTemplateBasedObject::getShieldDamageFactor(DamageInfo& info, int shield_index)
{
    return 1.0f;
}

float ShipTemplateBasedObject::getShieldRechargeRate(int shield_index)
{
    return shield_recharge_rate;
}

void ShipTemplateBasedObject::setTemplate(string template_name)
{
    P<ShipTemplate> new_ship_template = ShipTemplate::getTemplate(template_name);
    this->template_name = template_name;
    ship_template = new_ship_template;
    type_name = new_ship_template->getLocaleName();
    locale_name = new_ship_template->getLocaleName();
    class_name = ship_template->getClass();
    sub_class_name = ship_template->getSubClass();

    hull_strength = hull_max = ship_template->hull;
    shield_count = ship_template->shield_count;
    shield_recharge_rate = ship_template->shield_recharge_rate;
    for(int n=0; n<shield_count; n++)
        shield_level[n] = shield_max[n] = ship_template->shield_level[n];

    // Set the ship's radar ranges.
    long_range_radar_range = ship_template->long_range_radar_range;
    short_range_radar_range = ship_template->short_range_radar_range;

    radar_trace = ship_template->radar_trace;
    impulse_sound_file = ship_template->impulse_sound_file;

    hack_diff = ship_template->getHackDiff();

    shares_energy_with_docked = ship_template->shares_energy_with_docked;
    repair_docked = ship_template->repair_docked;

    ship_template->setCollisionData(this);
    model_info.setData(ship_template->model_data);

    system_damage_ratio = ship_template->system_damage_ratio;
    system_damage_hull_threshold = ship_template->system_damage_hull_threshold;

    //Call the virtual applyTemplateValues function so subclasses can get extra values from the ship templates.
    applyTemplateValues();
}

void ShipTemplateBasedObject::setShields(std::vector<float> amounts)
{
    for(int n=0; n<std::min(int(amounts.size()), shield_count); n++)
    {
        shield_level[n] = amounts[n];
    }
}

void ShipTemplateBasedObject::setShieldsMax(std::vector<float> amounts)
{
    shield_count = std::min(max_shield_count, int(amounts.size()));
    for(int n=0; n<shield_count; n++)
    {
        shield_max[n] = amounts[n];
        shield_level[n] = std::min(shield_level[n], shield_max[n]);
    }
}

ESystem ShipTemplateBasedObject::getShieldSystemForShieldIndex(int index)
{
    if (shield_count < 2)
        return SYS_FrontShield;
    float angle = index * 360.0f / shield_count;
    if (std::abs(angleDifference(angle, 0.0f)) < 90)
        return SYS_FrontShield;
    return SYS_RearShield;
}

void ShipTemplateBasedObject::onTakingDamage(ScriptSimpleCallback callback)
{
    this->on_taking_damage = callback;
}

void ShipTemplateBasedObject::onDestruction(ScriptSimpleCallback callback)
{
    this->on_destruction = callback;
}

string ShipTemplateBasedObject::getShieldDataString()
{
    string data = "";
    for(int n=0; n<shield_count; n++)
    {
        if (n > 0)
            data += ":";
        data += string(int(shield_level[n]));
    }
    return data;
}

void ShipTemplateBasedObject::setLongRangeRadarRange(float range)
{
    range = std::max(range, 100.0f);
    long_range_radar_range = range;
    short_range_radar_range = std::min(short_range_radar_range, range);
}

void ShipTemplateBasedObject::setShortRangeRadarRange(float range)
{
    range = std::max(range, 100.0f);
    short_range_radar_range = range;
    long_range_radar_range = std::max(long_range_radar_range, range);
}


int frequencyToDisplayNumber(int frequency)
{
    return 400 + (frequency * 20);
}
