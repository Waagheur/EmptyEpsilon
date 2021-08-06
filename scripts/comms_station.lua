--- Basic station comms.
--
-- Station comms that allows buying ordnance, supply drop, and reinforcements.
-- Default script for any `SpaceStation`.
--
-- TODO `player` can be replaced by `comms_source`
--
-- @script comms_station

-- uses `mergeTables`
require("utils.lua")

-- NOTE this could be imported
local MISSILE_TYPES = {"Homing", "Nuke", "Mine", "EMP", "HVLI"}

--- Main menu of communication.
function commsStationMainMenu()
    if comms_target.comms_data == nil then
        comms_target.comms_data = {}
    end
    mergeTables(
        comms_target.comms_data,
        {
            friendlyness = random(0.0, 100.0),
            weapons = {
                Homing = "neutral",
                HVLI = "neutral",
                Mine = "neutral",
                Nuke = "friend",
                EMP = "friend"
            },
            weapon_cost = {
                Homing = 2,
                HVLI = 2,
                Mine = 2,
                Nuke = 15,
                EMP = 10
            },
            services = {
                supplydrop = "friend",
                reinforcements = "friend"
            },
            service_cost = {
                supplydrop = 100,
                reinforcements = 150
            },
            reputation_cost_multipliers = {
                friend = 1.0,
                neutral = 2.5
            },
            max_weapon_refill_amount = {
                friend = 1.0,
                neutral = 0.5
            }
        }
    )

    -- comms_data is used globally (could be avoided, compare comms_ship)
    comms_data = comms_target.comms_data

    if player:isEnemy(comms_target) then
        return false
    end

    if comms_target:areEnemiesInRange(5000) then
        setCommsMessage(_("commsStation", "We are under attack! No time for chatting!"))
        return true
    end
    if not player:isDocked(comms_target) then
        handleUndockedState()
    else
        handleDockedState()
    end
    return true
end

--- Handle communications while docked with this station.
--
-- @tparam PlayerSpaceship comms_source
-- @tparam SpaceStation comms_target
function commsStationDocked(comms_source, comms_target)
    local message
    if comms_source:isFriendly(comms_target) then
        message = string.format(_("commsStation", "Good day, officer! Welcome to %s.\nWhat can we do for you today?"), comms_target:getCallSign())
    else
        message = string.format(_("commsStation", "Welcome to our lovely station %s."), comms_target:getCallSign())
    end
    setCommsMessage(message)

    local reply_messages = {
        ["Homing"] = _("commsStation", "Do you have spare homing missiles for us?"),
        ["HVLI"] = _("commsStation", "Can you restock us with HVLI?"),
        ["Mine"] = _("commsStation", "Please re-stock our mines."),
        ["Nuke"] = _("commsStation", "Can you supply us with some nukes?"),
        ["EMP"] = _("commsStation", "Please re-stock our EMP missiles.")
    }

    for idx, missile_type in ipairs(MISSILE_TYPES) do
        if comms_source:getWeaponStorageMax(missile_type) > 0 then
            addCommsReply(
                string.format(_("commsStation", "%s (%d rep each)"), reply_messages[missile_type], getWeaponCost(comms_source, comms_target, missile_type)),
                function(comms_source, comms_target)
                    handleWeaponRestock(comms_source, comms_target, missile_type)
                end
            )
        end
    end
end

--- handleWeaponRestock
--
-- @tparam string weapon the missile type
function handleWeaponRestock(comms_source, comms_target, weapon)
    if not comms_source:isDocked(comms_target) then
        setCommsMessage(_("commsStation", "You need to stay docked for that action."))
        return
    end

    if not isAllowedTo(comms_data.weapons[weapon]) then
        if weapon == "Nuke" then
            message = _("commsStation", "We do not deal in weapons of mass destruction.")
        elseif weapon == "EMP" then
            message = _("commsStation", "We do not deal in weapons of mass disruption.")
        else
            message = _("commsStation", "We do not deal in those weapons.")
        end
        return
    end

    local points_per_item = getWeaponCost(weapon)
    local item_amount = math.floor(player:getWeaponStorageMax(weapon) * comms_data.max_weapon_refill_amount[getFriendStatus()]) - player:getWeaponStorage(weapon)
    if item_amount <= 0 then
        if weapon == "Nuke" then
            message = _("commsStation", "All nukes are charged and primed for destruction.")
        else
            message = _("commsStation", "Sorry, sir, but you are as fully stocked as I can allow.")
        end
        setCommsMessage(message)
        addCommsReply(_("button", "Back"), commsStationMainMenu)
    else
        if not comms_source:takeReputationPoints(points_per_item * item_amount) then
            setCommsMessage(_("commsStation", "Not enough reputation."))
            return
        end
        comms_source:setWeaponStorage(weapon, comms_source:getWeaponStorage(weapon) + item_amount)
        local message
        if comms_source:getWeaponStorage(weapon) == comms_source:getWeaponStorageMax(weapon) then
            message = _("commsStation", "You are fully loaded and ready to explode things.")
        else
            message = _("commsStation", "We generously resupplied you with some weapon charges.\nPut them to good use.")
        end
        setCommsMessage(message)
        addCommsReply(_("button", "Back"), commsStationMainMenu)
    end
end

--- Handle communications when we are not docked with the station.
--
-- @tparam PlayerSpaceship comms_source
-- @tparam SpaceStation comms_target
function commsStationUndocked(comms_source, comms_target)
    local message
    if comms_source:isFriendly(comms_target) then
        message = string.format(_("commsStation", "This is %s. Good day, officer.\nIf you need supplies, please dock with us first."), comms_target:getCallSign())
    else
        message = string.format(_("commsStation", "This is %s. Greetings.\nIf you want to do business, please dock with us first."), comms_target:getCallSign())
    end
    setCommsMessage(message)

    -- supply drop
    if isAllowedTo(comms_source, comms_target, comms_target.comms_data.services.supplydrop) then
        addCommsReply(
            string.format(_("commsStation", "Can you send a supply drop? (%d rep)"), getServiceCost(comms_source, comms_target, "supplydrop")),
            --
            commsStationSupplyDrop
        )
    end

    -- reinforcements
    if isAllowedTo(comms_target.comms_data.services.reinforcements) then
        addCommsReply(
            string.format(_("commsStation", "Please send reinforcements! (%d rep)"), getServiceCost(comms_source, comms_target, "reinforcements")),
            --
            commsStationReinforcements
        )
    end
end

--- Ask for a waypoint and deliver supply drop to it.
--
-- Uses the script `supply_drop.lua`
--
-- @tparam PlayerSpaceship comms_source
-- @tparam SpaceStation comms_target
function commsStationSupplyDrop(comms_source, comms_target)
    if comms_source:getWaypointCount() < 1 then
        setCommsMessage(_("commsStation", "You need to set a waypoint before you can request backup."))
    else
        setCommsMessage(_("commsStation", "To which waypoint should we deliver your supplies?"))
        for n = 1, comms_source:getWaypointCount() do
            addCommsReply(
                formatWaypoint(n),
                function(comms_source, comms_target)
                    local message
                    if comms_source:takeReputationPoints(getServiceCost(comms_source, comms_target, "supplydrop")) then
                        local position_x, position_y = comms_target:getPosition()
                        local target_x, target_y = comms_source:getWaypoint(n)
                        local script = Script()
                        script:setVariable("position_x", position_x):setVariable("position_y", position_y)
                        script:setVariable("target_x", target_x):setVariable("target_y", target_y)
                        script:setVariable("faction_id", comms_target:getFactionId()):run("supply_drop.lua")
                        message = string.format(_("commsStation", "We have dispatched a supply ship toward %s."), formatWaypoint(n))
                    else
                        message = _("commsStation", "Not enough reputation!")
                    end
                    setCommsMessage(message)
                    addCommsReply(_("button", "Back"), commsStationMainMenu)
                end
            )
        end
    end
    addCommsReply(_("button", "Back"), commsStationMainMenu)
end

--- Ask for a waypoint and send reinforcements to defend it.
--
-- @tparam PlayerSpaceship comms_source
-- @tparam SpaceStation comms_target
function commsStationReinforcements(comms_source, comms_target)
    if comms_source:getWaypointCount() < 1 then
        setCommsMessage(_("commsStation", "You need to set a waypoint before you can request reinforcements."))
    else
        setCommsMessage(_("commsStation", "To which waypoint should we dispatch the reinforcements?"))
        for n = 1, comms_source:getWaypointCount() do
            addCommsReply(
                formatWaypoint(n),
                function(comms_source, comms_target)
                    local message
                    if comms_source:takeReputationPoints(getServiceCost(comms_source, comms_target, "reinforcements")) then
                        local ship = CpuShip():setFactionId(comms_target:getFactionId()):setPosition(comms_target:getPosition()):setTemplate("Adder MK5"):setScanned(true):orderDefendLocation(comms_source:getWaypoint(n))
                        message = string.format(_("commsStation", "We have dispatched %s to assist at %s."), ship:getCallSign(), formatWaypoint(n))
                    else
                        message = _("commsStation", "Not enough reputation!")
                    end
                    setCommsMessage(message)
                    addCommsReply(_("button", "Back"), commsStationMainMenu)
                end
                addCommsReply("Back", commsStationMainMenu)
            end
        )
    end
    addCommsReply(_("button", "Back"), commsStationMainMenu)
end

--- isAllowedTo
--
-- @treturn boolean
function isAllowedTo(state)
    if state == "friend" and player:isFriendly(comms_target) then
        return true
    end
    if state == "neutral" and not player:isEnemy(comms_target) then
        return true
    end
    return false
end

--- Return the number of reputation points that a specified weapon costs for the
-- current player.
--
-- @tparam string weapon the missile type
-- @treturn integer
function getWeaponCost(weapon)
    return math.ceil(comms_data.weapon_cost[weapon] * comms_data.reputation_cost_multipliers[getFriendStatus()])
end

--- Return the number of reputation points that a specified service costs for
-- the current player.
--
-- @tparam string service the service
-- @treturn integer
function getServiceCost(service)
    return math.ceil(comms_data.service_cost[service])
end

--- Return "friend" or "neutral".
--
-- @treturn string
function getFriendStatus()
    if player:isFriendly(comms_target) then
        return "friend"
    else
        return "neutral"
    end
end

--- Format integer i as "WP i".
--
-- @tparam integer i the index of the waypoint
-- @treturn string "WP i"
function formatWaypoint(i)
    return string.format(_("commsStation", "WP %d"), i)
end

-- `comms_source` and `comms_target` are global in comms script.
commsStationMainMenu(comms_source, comms_target)
