-- Fonctions de script communes pour le wh de mars 2021

-- Fonctions pour creer des vagues d'ennemis
--- Add an enemy wave.
--
-- That is, create it and add it to `list`.
--
-- @tparam table list A table containing enemy ship objects.
-- @tparam integer kind A number; at each integer, determines a different wave of ships to add
--  to the list. Any number is valid, but only 0.99-9.0 are meaningful.
-- @tparam number a The spawned wave's heading relative to the players' spawn point.
-- @tparam number d The spawned wave's distance from the players' spawn point.

require("emergency_jump.lua")
require("normal_jump.lua")

function addWave(enemyList,type,l,e,f,a,d)
		leader = setCirclePos(CpuShip():setTemplate(l):setFaction(f):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-1, 1), d + random(-100, 100))
		table.insert(enemyList, leader)
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate(e):setFaction(f):setRotation(a + 180):orderFlyFormation(leader,-400, 0), 0, 0, a + random(-1, 1), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate(e):setFaction(f):setRotation(a + 180):orderFlyFormation(leader, 400, 0), 0, 0, a + random(-1, 1), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate(e):setFaction(f):setRotation(a + 180):orderFlyFormation(leader,-400, 400), 0, 0, a + random(-1, 1), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate(e):setFaction(f):setRotation(a + 180):orderFlyFormation(leader, 400, 400), 0, 0, a + random(-1, 1), d + random(-100, 100)))
end

function addFixedWave(template_l,template_gen,faction,angle,x,y)
	leader = setCirclePos(CpuShip():setTemplate(template_l):setFaction(faction):setRotation(angle + 180):orderRoaming(), x, y, angle + random(-1, 1), random(-500, 500))
	setCirclePos(CpuShip():setTemplate(template_gen):setFaction(faction):setRotation(angle + 180):orderFlyFormation(leader,-400, 0), x, y, angle + random(-1, 1), random(-500, 500))
	setCirclePos(CpuShip():setTemplate(template_gen):setFaction(faction):setRotation(angle + 180):orderFlyFormation(leader, 400, 0), x, y, angle + random(-1, 1), random(-500, 500))
	setCirclePos(CpuShip():setTemplate(template_gen):setFaction(faction):setRotation(angle + 180):orderFlyFormation(leader,-400, 400), x, y, angle + random(-1, 1), random(-500, 500))
	setCirclePos(CpuShip():setTemplate(template_gen):setFaction(faction):setRotation(angle + 180):orderFlyFormation(leader, 400, 400), x, y, angle + random(-1, 1), random(-500, 500))
end

--- Returns a semi-random heading.
--
-- @tparam number cnt A counter, generally between 1 and the number of enemy groups.
-- @tparam number enemy_group_count A number of enemy groups, generally set by the scenario variation.
-- @treturn number a random angle (between 0-60 and 360+60)
function randomWaveAngle(cnt, enemy_group_count)
    return cnt * 360 / enemy_group_count + random(-60, 60)
end

--- Returns a semi-random distance.
--
-- `enemy_group_count` is multiplied by 3 u and increases the distance.
--
-- @tparam number enemy_group_count A number of enemy groups, generally set by the scenario variation.
-- @treturn number a distance
function randomWaveDistance(enemy_group_count)
    return random(35000, 40000 + enemy_group_count * 3000)
end

-- Functions utilitaires diverses

-- Get number_of_systems random systems. Warning : systems may or may not be activated on the ship
function luaRandomSystems(number_of_systems)
    --local pship = getPlayerShip(-1)
    rand_table = {}
    for _, system in ipairs(SYSTEMS) do
        table.insert(rand_table, system)
    end
    table.shuffle(rand_table)
    return_table = {}
    for count = 1,number_of_systems do
        table.insert(return_table, rand_table[count])
    end
    return return_table
end

--
-- Verifie si le vaisseau doit devenir une epave selon des criteres de degats
-- et si c'est le cas, change sa faction pour celle passee en parametre
-- met les systemes au max a -50%, energie a 0, power level a 0, boucliers a 0
-- fait aussi une explosion qui se voit sur le radar et endommage les autres vaisseaux
--
function checkAndMakeDerelict(ship, hullDamage, derelict_faction)
	if hullDamage >= ship:getHull()  then
		ship:setHull(5 + hullDamage)
		for _, system in ipairs(SYSTEMS) do
			ship:setSystemHealthMax(system, -0.5)
			ship:setSystemHealth(system, -0.5)
			ship:setSystemPower(system, 0)
			if ship.typeName == "PlayerSpaceship" then
				ship:commandSetSystemPowerRequest(system, 0)
			end
		end
		ship:setFrontShield(0)
		ship:setRearShield(0)
		ship:setEnergy(0.001) --there is a bug, 0 is not accepted
		ship:setJumpDriveCharge(0)
		-- Derelict ships won't explode again
		if ship:getFaction() ~= derelict_faction then
			ship:setFaction(derelict_faction)
			x, y = ship:getPosition()
			explodeDerelict(x,y,2000)
		end
		
		return true
	end
	return false
end

---
--- Explosion sur un range specifie en parametre, fait des degats
	---
	function explodeDerelict(x,y,range)
		--print "boom. boom boom."
		ExplosionEffect():setPosition(x,y):setSize(range):setOnRadar(true)
		for _, obj in ipairs(getObjectsInRadius(x,y,range)) do
			if obj:getFaction() ~= "Epave" then
				obj:takeDamage(200)
			end
	end
end

-- Fait apparaitre un warpjammer a cote su vaisseau pourvu qu'il en ait en stock (info value 11)
function popWarpJammer(ship)
    nb_warpjam = tonumber(ship:getInfosValue(11))
    if(nb_warpjam and nb_warpjam > 0) then
        local posx,posy = ship:getPosition()
        warpJammer = WarpJammer():setFaction(ship:getFaction()):setRange(100000):setPosition(posx-500, posy)
        ship:addInfos(11,"Nb Warpjam", nb_warpjam - 1)
        ship:removeCustom(popWarpJammerButton)
		if(nb_warpjam-1 > 0) then
			ship:addCustomButton("Relay",popWarpJammerButton,string.format("Deployer antiwarp (%i)", tonumber(ship:getInfosValue(11))),ship.popWarpJammer)
		end
    end
    
end

-- Functions appelees par les callbacks EE 

function doOnNewShip(ship)
--recharge X2 sur tout les vaisseaux
--ship:setShieldRechargeRate(1.2)
	-- ATTENTION MODIFIER ICI SI ON NE VEUT PAS QUE TOUS LES VAISSEAUX SOIENT TRANSFORMABLES EN EPAVE
		if (ship:getClass() ~= "Chasseur" and ship:getClass() ~= "Destroyer") then ship:addInfos(12,"Peut_Epave", 1) end
		-- FIN DE MODIFICATION
        ship:onTakingDamage(
            function(self,instigator, typeOfDamage, freq, systemHit, shieldsDamage, hullDamage, hitShield)
				if hullDamage == nil then
					return
				end
				
				if ship:getInfosValue(12) ~= nil and tonumber(ship:getInfosValue(12)) == 1 then
					if checkAndMakeDerelict(ship, hullDamage, "Epave") then
						return
					end
				end
				
                if instigator ~= nil then --mandatory to check there is an instigator, else it can be asteroid etc.
                    if typeOfDamage == "emp" and hullDamage > 0 then --means damage is an EMP missile, and some damage passed through shields
                        -- BEGIN BALANCE MODIFICATION HERE
                        -- BEGIN BALANCE MODIFICATION HERE
                        -- BEGIN BALANCE MODIFICATION HERE
                        local num_of_sys_hit = 3 --edit here to change number of affected systems
                        -- END BALANCE MODIFICATION
                        -- END BALANCE MODIFICATION
                        -- END BALANCE MODIFICATION

                        list_of_systems = luaRandomSystems(num_of_sys_hit) --means we get the random systems (which may NOT be activated on ship)
                        --print(string.format("Degats: type %s freq %i sys %s shi %f dam %f hit %i",typeOfDamage,freq,systemHit,shieldsDamage,hullDamage,hitShield))
                        for count = 1, num_of_sys_hit do
                            --print(string.format("%s hit for %f damage ", list_of_systems[count], hullDamage))

                            -- BEGIN BALANCE MODIFICATION HERE
                            -- BEGIN BALANCE MODIFICATION HERE
                            -- BEGIN BALANCE MODIFICATION HERE
                            
                            --inflicts energy loss
                            local current_energy = ship:getEnergy()
                            ship:setEnergy((current_energy - hullDamage) *10 ) --set the multiplier as it's total energy - damage
                            
                            --inflicts heat (heat is between 0 and 1, damage can be high)
                            local current_heat = ship:getSystemHeat(list_of_systems[count])
                            ship:setSystemHeat(list_of_systems[count], current_heat + hullDamage/100) --set this as for now it's 1 damage = 1%
                            
                            --inflicts hack (hack is between 0 and 1, damage can be high)
                            local current_hack = ship:getSystemHackedLevel(list_of_systems[count])
                            ship:setSystemHackedLevel(list_of_systems[count], current_hack + hullDamage/100) --set this as for now it's 1 damage = 1%

                            --inflicts damage on system (overrides system harness set by ratio or minimal damage needed to hit) (health is between 0 and 1, damage can be high)
                            local current_health = ship:getSystemHealth(list_of_systems[count])
                            ship:setSystemHealth(list_of_systems[count], current_health - hullDamage/100) --set this as for now it's 1 damage = 1%

                            -- END BALANCE MODIFICATION
                            -- END BALANCE MODIFICATION
                            -- END BALANCE MODIFICATION

                        end --for
                    elseif typeOfDamage ~= "emp" then
                            --print "Not emp damage"
                    elseif hullDamage <= 0 then
                            --print "No damage went through shields"
                    end --if damage and type
                end --if instigator
            end
        )
end

function doOnNewPlayerShip(pc)
	pc.popWarpJammer = function()
			popWarpJammer(pc)
	end
	
	pc:addInfos(11,"Nb Warpjam", "0")
	if pc:hasJumpDrive() then
		pc:addInfos(13,"Warp jump", "0")
	end
	pc:setMaxCoolant(10)
	pc:setCanDock(true)
	pc:setRepairCrewCount(3)
--	pc:setFaction("Imperium")
	
	if (pc:getClass() ~= "Chasseur" ) 
	then
		pc:setMaxScanProbeCount(16)
		pc:setScanProbeCount(16)
		if pc:hasJumpDrive() then
			pc:addInfos(13,"Warp jump", "1")
		end
	end 
	
	if (pc:getClass() ~= "Experimental" and pc:getClass() ~= "Croiseur Marchand") 
	then
		pc:setJumpDriveEnergy(5)
		pc:setJumpDriveChargeTime(300)
	end 
--	PC:setJumpDriveCharge(50000)
	if pc:hasJumpDrive() then
		pc.emergencyJump = function()
			print(string.format("%f", pc:getSystemHealth("jumpdrive")))
			if((pc:getSystemHealth("jumpdrive") > 0.5) and (pc:getMaxRepairPerSystem() > 0.75)) 
			then
				if(pc:getMaxRepair() >= 0.7) then
					activateEmergencyJump(10, pc, pc.emergencyJump)
				else
					pc:addToShipLog("Pas assez de personnel de reparation pour effectuer un saut d'urgence", "red")	
				end
			elseif (pc:getSystemHealth("jumpdrive") <= 0.5) then
				pc:addToShipLog("Moteur warp trop endommage pour effectuer un saut d'urgence", "red")
			elseif (pc:getMaxRepairPerSystem() <= 0.75) then
				pc:addToShipLog("Système de réparation trop endommagé pour effectuer un saut d'urgence", "red")
			end
		end
		pc:addCustomButton("Helms","emergencyJumpButton", "Saut d'urgence", pc.emergencyJump)
		pc.normalJump = function()
			
			if((tonumber(pc:getInfosValue(13)) >= 1) and (pc:getWaypointCount() >=1) and (pc:getSystemHealth("jumpdrive") > 0.5) and (pc:getEnergy()/pc:getMaxEnergy() > 0.8))
			then
				activateNormalJump(300, pc, pc.normalJump)
			elseif (tonumber(pc:getInfosValue(13)) < 1) then
				pc:addToShipLog("Vous ne pouvez pas calculer le saut", "yellow")
			elseif (pc:getWaypointCount() < 1) then
				pc:addToShipLog("Vous devez choisir une destination (marqueur Auspex LP)", "yellow")
			elseif (pc:getSystemHealth("jumpdrive") <= 0.5) then
				pc:addToShipLog("Moteur warp trop endommage pour effectuer un saut", "yellow")
			elseif (pc:getEnergy()/pc:getMaxEnergy() <= 0.8) then
				pc:addToShipLog("Energie insuffisante pour effectuer un saut", "yellow")
			end
		end
		pc.cancelNormalJump = function()
			cancelNormalJump(pc)
		end
		--pc:addCustomButton("Helms","normalJumpButton","Saut warp", pc.normalJump)
		
	end
	
		
	--popWarpJammerButton = "popWarpjammerButton"
	--pc:addCustomButton("Relay",popWarpJammerButton,string.format("Deployer antiwarp (%i)", tonumber(pc:getInfosValue(11))),pc.popWarpJammer)
end

function doInit()
	--math.randomseed(os.time())
	list_info_value_warpjam = {}
	

	-- GM functions to manually trigger enemy waves.
	-- addGMFunction("Vague Imperium Random", function()
		-- addWave(enemyList,1,'Bombardier Imperial Starhawk','Intercepteur Imperial Fury',"Imperium",randomWaveAngle(math.random(20), math.random(20)),randomWaveDistance(math.random(5)))
--	end)	
	
	addGMFunction("Vague Imperium", function()
		onGMClick(function(x, y)
			addFixedWave('Bombardier Imperial Starhawk','Intercepteur Imperial Fury',"Imperium", randomWaveAngle(math.random(20), math.random(20)), x, y)
		end)
	end)

	addGMFunction("Vague Imperium intercept", function()
		onGMClick(function(x, y)
			addFixedWave('Intercepteur Imperial Fury','Intercepteur Imperial Fury',"Imperium",randomWaveAngle(math.random(20), math.random(20)),x,y)
		end)
	end)
	
	addGMFunction("Vague Imperium Chasse", function()
		onGMClick(function(x, y)
			addFixedWave('Chasseur Lourd','Chasseur',"Imperium",randomWaveAngle(math.random(20), math.random(20)),x,y)
		end)
	end)
	
	addGMFunction("Vague chaos Chasse", function()
		onGMClick(function(x, y)
			addFixedWave('Chasseur Lourd','Chasseur',"Chaos",randomWaveAngle(math.random(20), math.random(20)),x,y)
		end)
	end)
	
	addGMFunction("Vague Chaos", function()
		onGMClick(function(x, y)
			addFixedWave('Bombardier du Chaos Doomfire','Chasseur',"Chaos",randomWaveAngle(math.random(20), math.random(20)),x,y)
		end)
	end)	

	addGMFunction("Vague Corsair", function()
		onGMClick(function(x, y)
			addFixedWave('Bombardier Corsair','Chasseur Corsair',"Eldars",randomWaveAngle(math.random(20), math.random(20)),x,y)
		end)
	end)
	    addGMFunction("Warp WormHole", function()
        onGMClick(addWarp)
    end)
	function addWarp (x,y)
		WormHole():setTargetPosition(-44483, -5198224):setPosition(x,y)
	end


	addGMFunction("Vague Corsair chass ", function()
		onGMClick(function(x, y)
			addFixedWave('Chasseur Corsair','Chasseur Corsair',"Eldars",randomWaveAngle(math.random(20), math.random(20)),x,y)
		end)
	end)
end

function doUpdateUtils(delta)
	--doUpdateShips(delta)
	updateEmergencyJump(delta)
	--updateNormalJump(delta)
end

-- Attention a ne pas trop surcharger cette methode
--function doUpdateShips(delta)
	--for pidx=1,32 do
		--p = getPlayerShip(pidx)
			--if p ~= nil and p:isValid() then
				-- Mise a jour du stock du warp jammer
				--if p:getInfosValue(11) ~= list_info_value_warpjam[pidx] then
					--list_info_value_warpjam[pidx] = p:getInfosValue(11)
					--if(tonumber(p:getInfosValue(11)) > 0) then
						--popWarpJammerButton = "popWarpjammerButton"
						--p:addCustomButton("Relay",popWarpJammerButton,string.format("Deployer antiwarp (%i)", tonumber(p:getInfosValue(11))),p.popWarpJammer)
					--end
				--end
			--end 
		--end 

--end
