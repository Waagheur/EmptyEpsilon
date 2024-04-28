-- Script de saut d'urgence

local jumps = {}

function activateEmergencyJump(runtime, pcship, callback)
    timer_max = tonumber(runtime)
    pcship.internalCallback = callback
    local toinsert = {timer = timer_max, ship = pcship}
    table.insert(jumps, toinsert)
end

function updateEmergencyJump(delta)
    for i=#jumps, 1, -1 do
        obj = jumps[i]
        obj.timer = obj.timer - delta
        if obj.timer < 0 then
            obj.timer = 0
        end
        if(obj.timer > 0) then
            obj.ship:addCustomButton("Helms","emergencyJumpButton", string.format("Saut d'urgence dans %.1f", obj.timer), nil)
        else 
            obj.ship:cancelNormalJump()
            obj.ship:setPosition(7532474, -1252471)
            obj.ship:setMaxRepair(obj.ship:getMaxRepair() - 0.70 - random(0,0.1))
            if(obj.ship:getMaxRepair() < 0) then 
                obj.ship:setMaxRepair(0)
            end
            for _, system in ipairs(SYSTEMS) do
                obj.ship:setSystemHealthMax(system, obj.ship:getSystemHealthMax(system) - 0.04 - random(0,0.02))
                obj.ship:setSystemHealth(system, obj.ship:getSystemHealth(system) - 0.20 - random(0,0.1))
            end
            obj.ship:addToShipLog("Degats sur les systemes de reparation", "red")
            obj.ship:addCustomButton("Helms","emergencyJumpButton", "Saut d'urgence", obj.ship.internalCallback)
            table.remove(jumps, i)
        end
    end
end