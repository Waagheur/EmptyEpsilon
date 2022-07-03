-- Script de saut d'urgence

local jumps = {}

function activateNormalJump(runtime, pcship, callback)
    timer_max = tonumber(runtime)
    pcship.internalCallback = callback

    -- consomme directement 80% de l'energie
    pcship:setEnergy(pcship:getEnergy() - 0.8*pcship:getMaxEnergy());
    local target_x, target_y = pcship:getWaypoint(1)
    local toinsert = {timer = timer_max, ship = pcship, coord_x = target_x, coord_y = target_y }
    table.insert(jumps, toinsert)
end

function cancelNormalJump(pcship)
    for i=#jumps, 1, -1 do
        obj = jumps[i]
        if(obj.ship == pcship)
        then
            table.remove(jumps, i)
            obj.ship:addCustomButton("Helms","normalJumpButton", "Saut warp", obj.ship.internalCallback)
        end
    end
end

function updateNormalJump(delta)
    for i=#jumps, 1, -1 do
        obj = jumps[i]
        obj.timer = obj.timer - delta
        if obj.timer < 0 then
            obj.timer = 0
        end
        if(obj.timer > 0) then
            obj.ship:addCustomButton("Helms","normalJumpButton", string.format("Saut dans %.1f (Annuler)", obj.timer), obj.ship.cancelNormalJump)
            -- Desactivation des systemes pendant la preparation du saut
            obj.ship:setSystemPower(SYS_IMPULSE, 0)
            obj.ship:setSystemPower(SYS_WARP, 0)
            obj.ship:setSystemPower(SYS_JUMPDRIVE, 0)
            obj.ship:setSystemPower(SYS_BEAMWEAPONS, 0)
            obj.ship:setSystemPower(SYS_MISSILESYSTEM, 0)
            obj.ship:setSystemPower(SYS_MANEUVER, 0)
        else 
            list_of_systems = luaRandomSystems(math.floor(#SYSTEMS / 2)) --means we get the random systems (which may NOT be activated on ship)
            --Surchauffe de 50% d'un systeme aleatoire
            
            for count = 1, #list_of_systems do
                obj.ship:setSystemHeat(list_of_systems[count], obj.ship:getSystemHeat(list_of_systems[count]) + 0.5)
            end
            
            local random_x = math.random(-20000,20000)
            local random_y = math.random(-20000,20000)

            print(string.format("rx : %.1f ry : %.1f",random_x,random_y))

            -- if WarpJammer::isWarpJammed
            obj.ship:setPosition(obj.coord_x + random_x, obj.coord_y + random_y)
            
            --if(obj.ship:getMaxRepair() < 0) then 
            --    obj.ship:setMaxRepair(0)
            --end
            --for _, system in ipairs(SYSTEMS) do
            --    obj.ship:setSystemHealthMax(system, obj.ship:getSystemHealthMax(system) - 0.04 - random(0,0.02))
            --    obj.ship:setSystemHealth(system, obj.ship:getSystemHealth(system) - 0.20 - random(0,0.1))
            --end
            --obj.ship:addToShipLog("Degats sur les systemes de reparation", "red")
            table.remove(jumps, i)
            obj.ship:addCustomButton("Helms","normalJumpButton", "Saut warp", obj.ship.internalCallback)
        end
    end
end