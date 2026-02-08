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

--Transformation des vaisseaux en épave à destruction
function doOnNewShip(ship)
	-- ATTENTION MODIFIER ICI SI ON NE VEUT PAS QUE TOUS LES VAISSEAUX SOIENT TRANSFORMABLES EN EPAVE
		if (ship:getClass() ~= "Chasseur") then ship:addInfos(12,"Peut_Epave", 1) end
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
				
                if instigator ~= nil then --obligatoire de vérifier qu’il y a un instigateur, sinon ça peut être un astéroïde, etc.
                    if typeOfDamage == "emp" and hullDamage > 0 then -- signifie que les dommages sont un missile EMP et certains dommages ont traversé des boucliers
                        -- DEBUT DE MODIFICATION ICI
                        -- DEBUT DE MODIFICATION ICI
                        -- DEBUT DE MODIFICATION ICI
                        local num_of_sys_hit = 3 -- modifier ici pour changer le nombre de systèmes touchés par un IEM
                        -- FIN DE MODIFICATION ICI
                        -- FIN DE MODIFICATION ICI
                        -- FIN DE MODIFICATION ICI

                        list_of_systems = luaRandomSystems(num_of_sys_hit) -- Cible des systèmes aléatoirement (même non présents sur le vaisseau)
                        --print(string.format("Degats: type %s freq %i sys %s shi %f dam %f hit %i",typeOfDamage,freq,systemHit,shieldsDamage,hullDamage,hitShield))
                        for count = 1, num_of_sys_hit do
                            --print(string.format("%s hit for %f damage ", list_of_systems[count], hullDamage))

                        -- DEBUT DE MODIFICATION ICI
                        -- DEBUT DE MODIFICATION ICI
                        -- DEBUT DE MODIFICATION ICI
                            
                            --Inflige une perte d'énergie
                            local current_energy = ship:getEnergy()
                            ship:setEnergy((current_energy - hullDamage) *10 ) -- régler le multiplicateur attribuéà l a valeur (énergie totale - dommages)
                            
                            -- infliger une surchauffe (la surchauffe est comprise entre 0 et 1, les dommages peuvent être élevés)
                            local current_heat = ship:getSystemHeat(list_of_systems[count])
                            ship:setSystemHeat(list_of_systems[count], current_heat + hullDamage/100) --Régler ceci comme étant 1 dégât = 1%
                            
                            -- infliger un piratage (le piratage est compris entre 0 et 1, les dégâts peuvent être élevés)
                            local current_hack = ship:getSystemHackedLevel(list_of_systems[count])
                            ship:setSystemHackedLevel(list_of_systems[count], current_hack + hullDamage/100) --set this as for now it's 1 damage = 1%

                            -- Inflige des dégâts au système (le faisceau doit surpasser la valeur de seuil spécifique au vaisseau pour infliger des dégâts) (la santé est comprise entre 0 et 1, les dégâts peuvent être élevés)
                            local current_health = ship:getSystemHealth(list_of_systems[count])
                            ship:setSystemHealth(list_of_systems[count], current_health - hullDamage/100) --set this as for now it's 1 damage = 1%

                        -- FIN DE MODIFICATION ICI
                        -- FIN DE MODIFICATION ICI
                        -- FIN DE MODIFICATION ICI

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
	end
end

-- Crée dans l'écran du MJ des boutons permettant de faire apparaitre des flottes pré-programmées.	
function doInit()
	list_info_value_warpjam = {}
	
	addGMFunction("Demon", function()
		onGMClick(function(x, y)
			local Demon = CpuShip():setFaction("Chaos"):setTemplate("000 Entitee Psychique"):setCallSign("ERREUR"):setPosition(x,y):setRadarSignatureInfo(0.0, 0.0, 0.0):setScanningParameters(1, 1):setCanBeDestroyed(false):setDescriptions("", [[Cet "objet" n'a aucune existence physique, n'a aucune signature identifiable mais pourtant, il semble bien présent.]], [[Cet "objet" n'a aucune existence physique, n'a aucune signature identifiable mais pourtant, il semble bien présent.
			
			]])
		end)
	end)
	
	addGMFunction("Flotte Memnon", function()
		onGMClick(function(x, y)
			local Murmure = CpuShip():setFaction("Chaos"):setTemplate("AA91 Croiseur Lourd Hades"):setCallSign("NOX1"):setPosition(x, y):setRadarSignatureInfo(0.4, 0.9, 0.5):setScanningParameters(3,1):setCustomWeaponStorage("MCANMK4", 200):setCustomWeaponStorageMax("MCANMK4", 200):setDescriptions("", [[Croiseur Lourd Hadès "Murmure du Destin"]], [[Le "Murmure du Destin" est un Croiseur Lourd de classe Hadès dont les origines sont entourées de mystères. Certains disent qu'il a été trouvé par Memnon Sakhell dans une station abandonnée, qu'il l'a échangé a des pirates contre toute une population planétaire qu'il avait réduite en esclavage, ou encore que les Puissances de la Ruine elles même l'ont fait sortir du Warp pour lui. Une chose est sure, ce vaisseau menait la seconde vague Chaotique contre Merinita, et sa puissance au combat peut surpasser n'importe quel Croiseur de Combat.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZQ4 Fregate Firestorm"):setCallSign("MS01"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2, 1):orderDefendTarget(Murmure,500,15000):setDescriptions("", [[Frégate Firestorm "Ultime Vision"]], [[La Frégate Firestorm "Ultime Vision" semble reconstruite sur la carcasse d'une ancienne Frégate Impériale, le "Dominus Lex". Le "Dominus Lex" était encore en service il y a 20 ans. Les derniers rapports à son sujet mentionnent qu'elle a quitté son escadron pour répondre à un appel de détresse de la Marine Impériale. Elle n'a pas été revue depuis.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP8 Escorteur Viper"):setCallSign("MS02"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Murmure,500,15000):setDescriptions("", [[Escorteur Viper "Kaléidoscope Macabre"]], [[L'Escorteur Viper "Kaléidoscope Macabre" s'est fait remarquer lors de la Bataille de Mérinita, avec l'Escorteur Viper "Dernière Volonté", par la manière dont ils sont parvenus à détruire de nombreux vaisseaux de tonnage supérieur, profitant que ceux-ci étaient trop enlisés dans la bataille pour esquiver leurs redoutables torpilles. Sa coque est d'ailleurs marquée de plusieurs noms, sans doute ceux de navirs abatus. Parmi ceux-ci se trouve le "Martyr de Sainte Elena".
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP8 Escorteur Viper"):setCallSign("MS03"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Murmure,500,15000):setDescriptions("", [[Escorteur Viper "Dernière Volonté"]], [[L'Escorteur Viper "Dernière Volonté" s'est fait remarquer lors de la Bataille de Mérinita, avec l'Escorteur Viper "Kaléidoscope Macabre", par la manière dont ils sont parvenus à détruire de nombreux vaisseaux de tonnage supérieur, profitant que ceux-ci étaient trop enlisés dans la bataille pour esquiver leurs redoutables torpilles. Sa coque est d'ailleurs marquée de plusieurs noms, sans doute ceux de navirs abatus. Parmi ceux-ci se trouve le "Celestis Veritas".
			
			
			]])
		end)
	end)

	addGMFunction("Flotte Memnon PJ", function()
		onGMClick(function(x, y)
			local MurmurePJ = PlayerSpaceship():setFaction("Chaos"):setTemplate("AA91 Hades"):setCallSign("NOX1"):setPosition(x, y):setRadarSignatureInfo(0.4, 0.9, 0.5):setScanningParameters(3,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK4", 200):setCustomWeaponStorageMax("MCANMK4", 200):setDescriptions("", [[Croiseur Lourd Hadès "Murmure du Destin"]], [[Le "Murmure du Destin" est un Croiseur Lourd de classe Hadès dont les origines sont entourées de mystères. Certains disent qu'il a été trouvé par Memnon Sakhell dans une station abandonnée, qu'il l'a échangé a des pirates contre toute une population planétaire qu'il avait réduite en esclavage, ou encore que les Puissances de la Ruine elles même l'ont fait sortir du Warp pour lui. Une chose est sure, ce vaisseau menait la seconde vague Chaotique contre Merinita, et sa puissance au combat peut surpasser n'importe quel Croiseur de Combat.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZQ4 Fregate Firestorm"):setCallSign("MS01"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2, 1):orderDefendTarget(MurmurePJ,500,15000):setScanned(false):setScannedByFaction("Chaos",true):setDescriptions("", [[Frégate Firestorm "Ultime Vision"]], [[La Frégate Firestorm "Ultime Vision" semble reconstruite sur la carcasse d'une ancienne Frégate Impériale, le "Dominus Lex". Le "Dominus Lex" était encore en service il y a 20 ans. Les derniers rapports à son sujet mentionnent qu'elle a quitté son escadron pour répondre à un appel de détresse de la Marine Impériale. Elle n'a pas été revue depuis.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP8 Escorteur Viper"):setCallSign("MS02"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(MurmurePJ,500,15000):setDescriptions("", [[Escorteur Viper "Kaléidoscope Macabre"]], [[L'Escorteur Viper "Kaléidoscope Macabre" s'est fait remarquer lors de la Bataille de Mérinita, avec l'Escorteur Viper "Dernière Volonté", par la manière dont ils sont parvenus à détruire de nombreux vaisseaux de tonnage supérieur, profitant que ceux-ci étaient trop enlisés dans la bataille pour esquiver leurs redoutables torpilles. Sa coque est d'ailleurs marquée de plusieurs noms, sans doute ceux de navirs abatus. Parmi ceux-ci se trouve le "Martyr de Sainte Elena".
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP8 Escorteur Viper"):setCallSign("MS03"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(MurmurePJ,500,15000):setDescriptions("", [[Escorteur Viper "Dernière Volonté"]], [[L'Escorteur Viper "Dernière Volonté" s'est fait remarquer lors de la Bataille de Mérinita, avec l'Escorteur Viper "Kaléidoscope Macabre", par la manière dont ils sont parvenus à détruire de nombreux vaisseaux de tonnage supérieur, profitant que ceux-ci étaient trop enlisés dans la bataille pour esquiver leurs redoutables torpilles. Sa coque est d'ailleurs marquée de plusieurs noms, sans doute ceux de navirs abatus. Parmi ceux-ci se trouve le "Celestis Veritas".
			
			
			]])
		end)
	end)
	
	addGMFunction("Flotte Rodrigo", function()
		onGMClick(function(x, y)
			local Orgueil = CpuShip():setFaction("Chaos"):setTemplate("ZR1 Croiseur Leger Dauntless"):setCallSign("RB01"):setPosition(x, y):setRadarSignatureInfo(0.2, 0.7, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setDescriptions("", [[Croiseur Léger Dauntless "Orgueil Légitime"]], [[Le Croiseur Léger Dauntless "Orgueil Légitime" est un ancien vaisseau de la Marine Impériale, qui a cessé toute activité il y a plus de deux siècles, après avoir subit de très lourds dommages durant une bataille oubliée depuis. Alors que la Marine Impériale hésitait entre le réparer entièrement ou simplement récupérer les éléments exploitables pour coustruire un tout nouveau vaisseau, un obscur Libre-Marchand proposa de le racheter a un prix très intéressant, permettant à la Marine de financer la suasi-totalité d'un nouveau Croiseur Léger. Sommairement remis en état, il évolua un peu dans les secteurs voisins avant d'être capturé par des pirates. Il changea ensuite de nombreuses fois de mains, chaque propriétaire poursuivant peu à peu les réparations avant de se le faire prendre à son tour.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA1 Vaisseau Esclavagiste Soulcage"):setCallSign("RB02"):setPosition(x+5000,y):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(Orgueil,500,5000):setDescriptions("", [[Vaisseau Esclavagiste Soulcage "Pourvoyeur d'Agonie"]], [[Le Vaisseau Esclavagiste Soulcage "Pourvoyeur d'Agonie" est un ancien vaisseau de fret reconverti pour transporter un bétail humain. Chaque pont a été reconditionné pour héberger, dans des conditions tout juste vivables, des prisonniers et des esclaves en grande quantité, afin qu'ils puissent être transportés de leur lieu de capture à leur lieu de vente pour un coût réduit. Si on en croit les rumeurs, le taux de perte parmi la marchandise y est d'environ 20%, un chiffre dans la moyenne des vaisseaux de ce type.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA1 Vaisseau Esclavagiste Soulcage"):setCallSign("RB03"):setPosition(x,y+5000):setRadarSignatureInfo(0.2, 0.8, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(Orgueil,500,5000):setDescriptions("", [[Vaisseau Esclavagiste Soulcage "Dispensateur des Dons"]], [[Le Vaisseau Esclavagiste Soulcage "Dispensateur des Dons" est un ancien vaisseau de fret Impérial que son générateur de champ Geller Bellecane 90.r défectueux a rendu trop dangereux à utiliser. Racheté par un armateur privé, il a disparu avant d'être repéré à nouveau au sein de la flotte de Memnon Sakhell, reconverti pour transporter un bétail humain. Si chaque pont a été reconditionné pour héberger, dans des conditions tout juste vivables, des prisonniers et des esclaves en grande quantité, afin qu'ils puissent être transportés de leur lieu de capture à leur lieu de vente pour un coût réduit, on y dénombre un taux relativement faible de décès, à peine 10%. Cependant, il se murmure qu'une partie des individus transportés présentent d'étranges mutations.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA1 Vaisseau Esclavagiste Soulcage"):setCallSign("RB04"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(Orgueil,500,5000):setDescriptions("", [[Vaisseau Esclavagiste Soulcage "Passeur des Morts"]], [[Le Vaisseau Esclavagiste Soulcage "Passeur des Morts" est un ancien vaisseau de fret Impérial spécialisé dans le transport de vivres. Disparu de la circulation avant d'être repéré à nouveau au sein de la flotte de Memnon Sakhell, il a été partiellement reconverti pour transporter un bétail humain, mais pas entièrement. En effet, si la plupart des ponts ont été reconditionnés pour héberger, dans des conditions tout juste vivables, des prisonniers et des esclaves en grande quantité, afin qu'ils puissent être transportés de leur lieu de capture à leur lieu de vente pour un coût réduit, les anciennes chambres froides sont toujours présentes, et servent à stocker les quelques 30% de pertes parmi la marchandise à chaque voyage. Ainsi, en plus d'esclaves, le vaisseau propose une quantité non négligeable de nourriture riche en protéines à la vente.
			
			
			]])
		end)
	end)

	addGMFunction("Flotte Rodrigo PJ", function()
		onGMClick(function(x, y)
			local OrgueilPJ = PlayerSpaceship():setFaction("Chaos"):setTemplate("ZR1 Dauntless"):setCallSign("RB01"):setPosition(x, y):setRadarSignatureInfo(0.2, 0.7, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setDescriptions("", [[Croiseur Léger Dauntless "Orgueil Légitime"]], [[Le Croiseur Léger Dauntless "Orgueil Légitime" est un ancien vaisseau de la Marine Impériale, qui a cessé toute activité il y a plus de deux siècles, après avoir subit de très lourds dommages durant une bataille oubliée depuis. Alors que la Marine Impériale hésitait entre le réparer entièrement ou simplement récupérer les éléments exploitables pour coustruire un tout nouveau vaisseau, un obscur Libre-Marchand proposa de le racheter a un prix très intéressant, permettant à la Marine de financer la suasi-totalité d'un nouveau Croiseur Léger. Sommairement remis en état, il évolua un peu dans les secteurs voisins avant d'être capturé par des pirates. Il changea ensuite de nombreuses fois de mains, chaque propriétaire poursuivant peu à peu les réparations avant de se le faire prendre à son tour.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA1 Vaisseau Esclavagiste Soulcage"):setCallSign("RB02"):setPosition(x+5000,y):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(OrgueilPJ,500,5000):setDescriptions("", [[Vaisseau Esclavagiste Soulcage "Pourvoyeur d'Agonie"]], [[Le Vaisseau Esclavagiste Soulcage "Pourvoyeur d'Agonie" est un ancien vaisseau de fret reconverti pour transporter un bétail humain. Chaque pont a été reconditionné pour héberger, dans des conditions tout juste vivables, des prisonniers et des esclaves en grande quantité, afin qu'ils puissent être transportés de leur lieu de capture à leur lieu de vente pour un coût réduit. Si on en croit les rumeurs, le taux de perte parmi la marchandise y est d'environ 20%, un chiffre dans la moyenne des vaisseaux de ce type.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA1 Vaisseau Esclavagiste Soulcage"):setCallSign("RB03"):setPosition(x,y+5000):setRadarSignatureInfo(0.2, 0.8, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(OrgueilPJ,500,5000):setDescriptions("", [[Vaisseau Esclavagiste Soulcage "Dispensateur des Dons"]], [[Le Vaisseau Esclavagiste Soulcage "Dispensateur des Dons" est un ancien vaisseau de fret Impérial que son générateur de champ Geller Bellecane 90.r défectueux a rendu trop dangereux à utiliser. Racheté par un armateur privé, il a disparu avant d'être repéré à nouveau au sein de la flotte de Memnon Sakhell, reconverti pour transporter un bétail humain. Si chaque pont a été reconditionné pour héberger, dans des conditions tout juste vivables, des prisonniers et des esclaves en grande quantité, afin qu'ils puissent être transportés de leur lieu de capture à leur lieu de vente pour un coût réduit, on y dénombre un taux relativement faible de décès, à peine 10%. Cependant, il se murmure qu'une partie des individus transportés présentent d'étranges mutations.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA1 Vaisseau Esclavagiste Soulcage"):setCallSign("RB04"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(OrgueilPJ,500,5000):setDescriptions("", [[Vaisseau Esclavagiste Soulcage "Passeur des Morts"]], [[Le Vaisseau Esclavagiste Soulcage "Passeur des Morts" est un ancien vaisseau de fret Impérial spécialisé dans le transport de vivres. Disparu de la circulation avant d'être repéré à nouveau au sein de la flotte de Memnon Sakhell, il a été partiellement reconverti pour transporter un bétail humain, mais pas entièrement. En effet, si la plupart des ponts ont été reconditionnés pour héberger, dans des conditions tout juste vivables, des prisonniers et des esclaves en grande quantité, afin qu'ils puissent être transportés de leur lieu de capture à leur lieu de vente pour un coût réduit, les anciennes chambres froides sont toujours présentes, et servent à stocker les quelques 30% de pertes parmi la marchandise à chaque voyage. Ainsi, en plus d'esclaves, le vaisseau propose une quantité non négligeable de nourriture riche en protéines à la vente.
			
			
			]])
		end)
	end)
	
	addGMFunction("Flotte Hagor 1", function()
		onGMClick(function(x, y)
			local Voie = CpuShip():setFaction("Chaos"):setTemplate("ZT1 Croiseur de Combat Overlord"):setCallSign("HP11"):setPosition(x, y):setRadarSignatureInfo(0.3, 0.8, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 18):setCustomWeaponStorageMax("Torpille", 18):setDescriptions("", [[Croiseur de Combat Overlord "Voie Sanglante"]], [[Le Croiseur de Combat Overlord "Voie Sanglante" est en fait le Croiseur de même classe "Magna Verita" qui a été renommé par l'équipage. Anciennement sous le commandement du Capitaine Imperial Memnon Sakhell, il  a disparu après avoir émis un signal de détresse il y a une vingtaine d'années. Il a désormais rejoint la flotte séparatiste et se retrouve régulièrement en fer de lance des combats spatiaux.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP6 Corvette Wolfpack"):setCallSign("HP12"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(Voie,500,5000):setDescriptions("", [[Corvette Wolfpack "Lame Sanglante"]], [[La Corvette Wolfpack "Lame Sanglante" fait partie d'un trio incluant les corvettes "Lame Sinistre" et "Lame Souillée", aussi appelée "Trio des Lames". Il est tristement connu dans le secteur pour ses actions meurtrières, mais également pour avoir été détruit à plusieurs reprises, pour réapparaitre quelques années plus tard. Constamment aux mains de pirates ou de séparatistes, nul ne sait si il y a un lien entre les différentes apparitions du trio, ou si les noms des vaisseaux sont simplement repris d'un équipage à l'autre pour la terrifiante réputation qui les accompagne.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP6 Corvette Wolfpack"):setCallSign("HP14"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(Voie,500,5000):setDescriptions("", [[Corvette Wolfpack "Lame Sinistre"]], [[La Corvette Wolfpack "Lame Sinistre" fait partie d'un trio incluant les corvettes "Lame Sanglante" et "Lame Souillée", aussi appelée "Trio des Lames". Il est tristement connu dans le secteur pour ses actions meurtrières, mais également pour avoir été détruit à plusieurs reprises, pour réapparaitre quelques années plus tard. Constamment aux mains de pirates ou de séparatistes, nul ne sait si il y a un lien entre les différentes apparitions du trio, ou si les noms des vaisseaux sont simplement repris d'un équipage à l'autre pour la terrifiante réputation qui les accompagne.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP6 Corvette Wolfpack"):setCallSign("HP14"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(Voie,500,5000):setDescriptions("", [[Corvette Wolfpack "Lame Souillée"]], [[La Corvette Wolfpack "Lame Souillée" fait partie d'un trio incluant les corvettes "Lame Sinistre" et "Lame Sanglante", aussi appelée "Trio des Lames". Il est tristement connu dans le secteur pour ses actions meurtrières, mais également pour avoir été détruit à plusieurs reprises, pour réapparaitre quelques années plus tard. Constamment aux mains de pirates ou de séparatistes, nul ne sait si il y a un lien entre les différentes apparitions du trio, ou si les noms des vaisseaux sont simplement repris d'un équipage à l'autre pour la terrifiante réputation qui les accompagne.

			
			]])
		end)
	end)

	addGMFunction("Flotte Hagor 1 PJ", function()
		onGMClick(function(x, y)
			local VoiePJ = PlayerSpaceship():setFaction("Chaos"):setTemplate("ZT1 Overlord"):setCallSign("HP11"):setPosition(x, y):setRadarSignatureInfo(0.3, 0.8, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 18):setCustomWeaponStorageMax("Torpille", 18):setDescriptions("", [[Croiseur de Combat Overlord "Voie Sanglante"]], [[Le Croiseur de Combat Overlord "Voie Sanglante" est en fait le Croiseur de même classe "Magna Verita" qui a été renommé par l'équipage. Anciennement sous le commandement du Capitaine Imperial Memnon Sakhell, il  a disparu après avoir émis un signal de détresse il y a une vingtaine d'années. Il a désormais rejoint la flotte séparatiste et se retrouve régulièrement en fer de lance des combats spatiaux.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP6 Corvette Wolfpack"):setCallSign("HP12"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(VoiePJ,500,5000):setDescriptions("", [[Corvette Wolfpack "Lame Sanglante"]], [[La Corvette Wolfpack "Lame Sanglante" fait partie d'un trio incluant les corvettes "Lame Sinistre" et "Lame Souillée", aussi appelée "Trio des Lames". Il est tristement connu dans le secteur pour ses actions meurtrières, mais également pour avoir été détruit à plusieurs reprises, pour réapparaitre quelques années plus tard. Constamment aux mains de pirates ou de séparatistes, nul ne sait si il y a un lien entre les différentes apparitions du trio, ou si les noms des vaisseaux sont simplement repris d'un équipage à l'autre pour la terrifiante réputation qui les accompagne.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP6 Corvette Wolfpack"):setCallSign("HP13"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(VoiePJ,500,5000):setDescriptions("", [[Corvette Wolfpack "Lame Sinistre"]], [[La Corvette Wolfpack "Lame Sinistre" fait partie d'un trio incluant les corvettes "Lame Sanglante" et "Lame Souillée", aussi appelée "Trio des Lames". Il est tristement connu dans le secteur pour ses actions meurtrières, mais également pour avoir été détruit à plusieurs reprises, pour réapparaitre quelques années plus tard. Constamment aux mains de pirates ou de séparatistes, nul ne sait si il y a un lien entre les différentes apparitions du trio, ou si les noms des vaisseaux sont simplement repris d'un équipage à l'autre pour la terrifiante réputation qui les accompagne.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP6 Corvette Wolfpack"):setCallSign("HP14"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK1", 200):setCustomWeaponStorageMax("MCANMK1", 200):orderDefendTarget(VoiePJ,500,5000):setDescriptions("", [[Corvette Wolfpack "Lame Souillée"]], [[La Corvette Wolfpack "Lame Souillée" fait partie d'un trio incluant les corvettes "Lame Sinistre" et "Lame Sanglante", aussi appelée "Trio des Lames". Il est tristement connu dans le secteur pour ses actions meurtrières, mais également pour avoir été détruit à plusieurs reprises, pour réapparaitre quelques années plus tard. Constamment aux mains de pirates ou de séparatistes, nul ne sait si il y a un lien entre les différentes apparitions du trio, ou si les noms des vaisseaux sont simplement repris d'un équipage à l'autre pour la terrifiante réputation qui les accompagne.

			
			]])
		end)
	end)
	
	addGMFunction("Flotte Hagor 2", function()
		onGMClick(function(x, y)
			local Avalanche = CpuShip():setFaction("Chaos"):setTemplate("ZR4 Croiseur Leger Endurance"):setCallSign("HP21"):setPosition(x, y):setRadarSignatureInfo(0.2, 0.7, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setDescriptions("", [[Croiseur Leger Endurance "L'Avalanche"]], [[Le Croiseur Leger Endurance "L'Avalanche" est connu pour ses tactiques de martellement qui ont eu raison de plusieurs stations spatiales dans le sous-secteur, surchargeant les boucliers de prejectiles innombrables et de puissantes torpilles pour n'en laisser que des ruines fumantes à la dérive.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZQ1 Fregate Sword"):setCallSign("HP22"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2, 1):setScanned(false):setScannedByFaction("Chaos",true):orderDefendTarget(Avalanche,500,5000):setDescriptions("", [[Frégate Sword "L'Incinérateur"]], [[La Frégate Sword "L'Incinérateur" est connue pour avoir pris en embuscade d'immombrables convois, en binome avec la Frégate Sword "L'Oblitérateur". Surgissant de derrière une nébuleuse ou une lune, les deux frégates ont pour habitude de fondre sur le vaisseau de tête pour disperser les formations, puis de donner la chasse au reste du convoi.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZQ1 Fregate Sword"):setCallSign("HP23"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2, 1):setScanned(false):setScannedByFaction("Chaos",true):orderDefendTarget(Avalanche,500,5000):setDescriptions("", [[Frégate Sword "L'Oblitérateur"]], [[La Frégate Sword "L'Oblitérateur" est connue pour avoir pris en embuscade d'immombrables convois, en binome avec la Frégate Sword "L'Incinérateur". Surgissant de derrière une nébuleuse ou une lune, les deux frégates ont pour habitude de fondre sur le vaisseau de tête pour disperser les formations, puis de donner la chasse au reste du convoi.

			
			]])
		end)
	end)

	addGMFunction("Flotte Hagor 2 PJ", function()
		onGMClick(function(x, y)
			local AvalanchePJ = PlayerSpaceship():setFaction("Chaos"):setTemplate("ZR4 Endurance"):setCallSign("HP21"):setPosition(x, y):setRadarSignatureInfo(0.3, 0.8, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setDescriptions("", [[Croiseur Leger Endurance "L'Avalanche"]], [[Le Croiseur Leger Endurance "L'Avalanche" est connu pour ses tactiques de martellement qui ont eu raison de plusieurs stations spatiales dans le sous-secteur, surchargeant les boucliers de prejectiles innombrables et de puissantes torpilles pour n'en laisser que des ruines fumantes à la dérive.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZQ1 Fregate Sword"):setCallSign("HP22"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2, 1):setScanned(false):setScannedByFaction("Chaos",true):orderDefendTarget(AvalanchePJ,500,5000):setDescriptions("", [[Frégate Sword "L'Incinérateur"]], [[La Frégate Sword "L'Incinérateur" est connue pour avoir pris en embuscade d'immombrables convois, en binome avec la Frégate Sword "L'Oblitérateur". Surgissant de derrière une nébuleuse ou une lune, les deux frégates ont pour habitude de fondre sur le vaisseau de tête pour disperser les formations, puis de donner la chasse au reste du convoi.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZQ1 Fregate Sword"):setCallSign("HP23"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2, 1):setScanned(false):setScannedByFaction("Chaos",true):orderDefendTarget(AvalanchePJ,500,5000):setDescriptions("", [[Frégate Sword "L'Oblitérateur"]], [[La Frégate Sword "L'Oblitérateur" est connue pour avoir pris en embuscade d'immombrables convois, en binome avec la Frégate Sword "L'Incinérateur". Surgissant de derrière une nébuleuse ou une lune, les deux frégates ont pour habitude de fondre sur le vaisseau de tête pour disperser les formations, puis de donner la chasse au reste du convoi.

			
			]])
		end)
	end)
	
	addGMFunction("Flotte Vera", function()
		onGMClick(function(x, y)
			local Ombre = CpuShip():setFaction("Chaos"):setTemplate("ZQ4 Fregate Firestorm"):setCallSign("VJ01"):setPosition(x, y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setDescriptions("", [[Frégate Firestorm "Ombre Rouge"]], [[La Frégate Firestorm "Ombre Rouge" est un vaisseau pirate qui fait trembler les Capitaines Chartistes depuis de nombreuses années par les embuscades qu'elle tend aux convois. Apparaissant fréquemment seule, elle attire généralement les navires d'escorte des convois à porté de tir de ses alliés dissimulés, avant de fondre sur les navires marchands pour les arraisonner. Les abordages effectués par l'équipage sont toujours sanglants, la cruauté étant une sorte de signature employée par la Capitaine.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA2 Escorteur Infidel"):setCallSign("VJ02"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(Ombre,500,5000):setDescriptions("", [[Escorteur Infidel "Ultime Lueur"]], [[L'Escorteur Infidel "Ultime Lueur" a été impliqué dans plusieurs actes de piraterie dans le système Misthos. Ses salves de torpilles ont forcé plus d'une fois des vaisseaux à se rendre pour ne pas être détruits.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA2 Escorteur Infidel"):setCallSign("VJ03"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(Ombre,500,5000):setDescriptions("", [[Escorteur Infidel "Noir Retour"]], [[L'Escorteur Infidel "Noir Retour" a été signalé dans plusieurs incident entrainant la perte de vaisseaux de commerce entre les Systèmes Tarkus et Gisperion. Alors que certains le voient comme un simple navite pirate, d'autres se demandent si il ne s'agit pas d'un vaisseau mercenaire jouant des deux côtés d'une guerre économique.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA2 Escorteur Infidel"):setCallSign("VJ04"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(Ombre,500,5000):setDescriptions("", [[Escorteur Infidel "Premier Sang"]], [[L'Escorteur Infidel "Premier Sang" est responsable de plusieurs attaques isolées sur les voies commerciales d'Ultra Semptor. Les vaisseaux de pélerins semblent être sa cible favorite.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP4 Escorteur Havoc"):setCallSign("VJ05"):setPosition(x-5000,y):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(Ombre,500,5000):setDescriptions("", [[Corvette Marchande Havoc "Honnète Rétribution"]], [[La Corvette Marchande Havoc "Honnète Rétribution" a beau être armée plus raisonnablement que les lourds transports de la Marine Marchande, c'est surtout sa vitesse qui lui permet d'assurer la récurité de sa cargaison.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP4 Escorteur Havoc"):setCallSign("VJ06"):setPosition(x,y-5000):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(Ombre,500,5000):setDescriptions("", [[Corvette Marchande Havoc "Geyser Sanglant"]], [[La Corvette Marchande Havoc "Geyser Sanglant" est un vaisseau de transport rapide et bien armé, mais peu résistant. Si elle est en mesure d'intimider des attaquants, nottament à l'aide de ses torpilles, elle risque d'être rapidement surclassée en cas d'affrontement prolongé.
			
			
			]])
		end)
	end)

	addGMFunction("Flotte Vera PJ", function()
		onGMClick(function(x, y)
			local OmbrePJ = PlayerSpaceship():setFaction("Chaos"):setTemplate("ZQ4 Firestorm"):setCallSign("VJ01"):setPosition(x, y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setDescriptions("", [[Frégate Firestorm "Ombre Rouge"]], [[La Frégate Firestorm "Ombre Rouge" est un vaisseau pirate qui fait trembler les Capitaines Chartistes depuis de nombreuses années par les embuscades qu'elle tend aux convois. Apparaissant fréquemment seule, elle attire généralement les navires d'escorte des convois à porté de tir de ses alliés dissimulés, avant de fondre sur les navires marchands pour les arraisonner. Les abordages effectués par l'équipage sont toujours sanglants, la cruauté étant une sorte de signature employée par la Capitaine.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA2 Escorteur Infidel"):setCallSign("VJ02"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(OmbrePJ,500,5000):setDescriptions("",[[Escorteur Infidel "Ultime Lueur"]], [[L'Escorteur Infidel "Ultime Lueur" a été impliqué dans plusieurs actes de piraterie dans le système Misthos. Ses salves de torpilles ont forcé plus d'une fois des vaisseaux à se rendre pour ne pas être détruits.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA2 Escorteur Infidel"):setCallSign("VJ03"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(OmbrePJ,500,5000):setDescriptions("", [[Escorteur Infidel "Noir Retour"]], [[L'Escorteur Infidel "Noir Retour" a été signalé dans plusieurs incident entrainant la perte de vaisseaux de commerce entre les Systèmes Tarkus et Gisperion. Alors que certains le voient comme un simple navite pirate, d'autres se demandent si il ne s'agit pas d'un vaisseau mercenaire jouant des deux côtés d'une guerre économique.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA2 Escorteur Infidel"):setCallSign("VJ04"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(OmbrePJ,500,5000):setDescriptions("", [[Escorteur Infidel "Premier Sang"]], [[L'Escorteur Infidel "Premier Sang" est responsable de plusieurs attaques isolées sur les voies commerciales d'Ultra Semptor. Les vaisseaux de pélerins semblent être sa cible favorite.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP4 Escorteur Havoc"):setCallSign("VJ05"):setPosition(x-5000,y):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(OmbrePJ,500,5000):setDescriptions("", [[Corvette Marchande Havoc "Honnète Rétribution"]], [[La Corvette Marchande Havoc "Honnète Rétribution" a beau être armée plus raisonnablement que les lourds transports de la Marine Marchande, c'est surtout sa vitesse qui lui permet d'assurer la récurité de sa cargaison.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP4 Escorteur Havoc"):setCallSign("VJ06"):setPosition(x,y-5000):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(OmbrePJ,500,5000):setDescriptions("", [[Corvette Marchande Havoc "Geyser Sanglant"]], [[La Corvette Marchande Havoc "Geyser Sanglant" est un vaisseau de transport rapide et bien armé, mais peu résistant. Si elle est en mesure d'intimider des attaquants, nottament à l'aide de ses torpilles, elle risque d'être rapidement surclassée en cas d'affrontement prolongé.
			
			
			]])
		end)
	end)
	
	addGMFunction("Flotte Manuel", function()
		onGMClick(function(x, y)
			local Marteau = CpuShip():setFaction("Chaos"):setTemplate("AA7 Croiseur Slaughter"):setCallSign("MD01"):setPosition(x, y):setRadarSignatureInfo(0.25, 0.8, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setDescriptions("", [[Croiseur Slaughter "Marteau Souillé"]], [[Le Croiseur Slaughter "Marteau Souillé" est un modèle qui n'est plus produit par l'Impérium, et dont la majorité se sont d'ailleurs rebellés. Bénéficiant de la vitesse offerte par ses bobines de moteurs Archéotechnologiques Scartix, ce vaisseau peut approcher rapidement de ses cibles avant de les noyer sous une pluie d'obus de Macrocanons.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP8 Escorteur Viper"):setCallSign("MD02"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Marteau,500,5000):setDescriptions("", [[Escorteur Viper "Martelleur Sanglant"]], [[L'Escorteur Viper "Martelleur Sanglant" s'est fait remarquer lors de la Bataille de Mérinita pour ses torpillages nombreux et meurtriers. Certaines torpilles auraient touché certains de ses alliés.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP8 Escorteur Viper"):setCallSign("MD03"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Marteau,500,5000):setDescriptions("", [[Escorteur Viper "Broyeur d'Etoiles"]], [[L'Escorteur Viper "Broyeur d'Etoiles" s'est fait remarquer lors de la Bataille de Mérinita pour ses torpillages nombreux et meurtriers. Certaines torpilles auraient touché certains de ses alliés.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP7 Escorteur Cobra"):setCallSign("MD04"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(Marteau,500,5000):setDescriptions("", [[Escorteur Cobra "Lance Impie"]], [[L'Escorteur Cobra "Lance Impie" utilise ses torpilles avec parcimonie, ciblant en priorité les vaisseaux déjà engagés dans le combat. En effet, disposant de peu de torpilles et d'une lance légère, il a souvent besoin du concours d'autres bâtiments pour abattre les vaisseaux militaires.
			
			
			]])
		end)
	end)

	addGMFunction("Flotte Manuel PJ", function()
		onGMClick(function(x, y)
			local MarteauPJ = PlayerSpaceship():setFaction("Chaos"):setTemplate("AA7 Slaughter"):setCallSign("MD01"):setPosition(x, y):setRadarSignatureInfo(0.25, 0.8, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setDescriptions("", [[Croiseur Slaughter "Marteau Souillé"]], [[Le Croiseur Slaughter "Marteau Souillé" est un modèle qui n'est plus produit par l'Impérium, et dont la majorité se sont d'ailleurs rebellés. Bénéficiant de la vitesse offerte par ses bobines de moteurs Archéotechnologiques Scartix, ce vaisseau peut approcher rapidement de ses cibles avant de les noyer sous une pluie d'obus de Macrocanons.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP8 Escorteur Viper"):setCallSign("MD02"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(MarteauPJ,500,5000):setDescriptions("", [[Escorteur Viper "Martelleur Sanglant"]], [[L'Escorteur Viper "Martelleur Sanglant" s'est fait remarquer lors de la Bataille de Mérinita pour ses torpillages nombreux et meurtriers. Certaines torpilles auraient touché certains de ses alliés.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP8 Escorteur Viper"):setCallSign("MD03"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(MarteauPJ,500,5000):setDescriptions("", [[Escorteur Viper "Broyeur d'Etoiles"]], [[L'Escorteur Viper "Broyeur d'Etoiles" s'est fait remarquer lors de la Bataille de Mérinita pour ses torpillages nombreux et meurtriers. Certaines torpilles auraient touché certains de ses alliés.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP7 Escorteur Cobra"):setCallSign("MD04"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(MarteauPJ,500,5000):setDescriptions("", [[Escorteur Cobra "Lance Impie"]], [[L'Escorteur Cobra "Lance Impie" utilise ses torpilles avec parcimonie, ciblant en priorité les vaisseaux déjà engagés dans le combat. En effet, disposant de peu de torpilles et d'une lance légère, il a souvent besoin du concours d'autres bâtiments pour abattre les vaisseaux militaires.
			
			
			]])
		end)
	end)
	
	addGMFunction("Flotte Esteban", function()
		onGMClick(function(x, y)
			local Griffe = CpuShip():setFaction("Chaos"):setTemplate("AA6 Croiseur Devastator"):setCallSign("ED01"):setPosition(x, y):setRadarSignatureInfo(0.25, 0.8, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Chasseurs", 60):setCustomWeaponStorageMax("Chasseurs", 60):setCustomWeaponStorage("MCANMK3", 200):setCustomWeaponStorageMax("MCANMK3", 200):setDescriptions("", [[Croiseur Dévastator "Griffe Sanglante"]], [[Le Croiseur Dévastator "Griffe Sanglante" est un vaisseau polyvalent qui ne s'expose que rarement, préférant généralement soutenir sa flotille avec ses nuées de chasseurs et ses autocanons. Il est également équipé de vaisseaux de débarquement planétaire et d'équipes d'assaut conséquentes, qui le rendent redoutable lors des blocus planétaires et des abordages.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP1 Escorteur Meritech Shrike"):setCallSign("ED02"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):orderDefendTarget(Griffe,500,5000):setDescriptions("",[[Escorteur Meritech Shrike "Bassesse Méritée"]] , [[L'Escorteur Meritech Shrike "Bassesse Méritée" est un vaisseau tristement célèbre pour avoir été conçu pour le pillage et la piraterie. Il excelle dans les opérations de harcèlement grâce à ses deux lances sidérales, l'une sous la proue et l'autre en tourelle.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP1 Escorteur Meritech Shrike"):setCallSign("ED03"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):orderDefendTarget(Griffe,500,5000):setDescriptions("", [[Escorteur Meritech Shrike "Jour Noir"]], [[L'Escorteur Meritech Shrike "Bassesse Méritée" est un vaisseau tristement célèbre pour avoir été conçu pour le pillage et la piraterie. Il excelle dans les opérations de harcèlement grâce à ses deux lances sidérales, l'une sous la proue et l'autre en tourelle.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP8 Escorteur Viper"):setCallSign("ED04"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Griffe,500,5000):setDescriptions("", [[Escorteur Viper "Lance Ténébreuse"]], [[L'Escorteur Viper "Lance Ténébreuse" est un vaisseau lance-torpilles qui est généralement déployé en 2e ligne lors des batailles, afin de cibler les vaisseaux de gros tonnage une fois ceux-ci enlisés dans les affrontements avec les autres Escorteurs, tout en restant hors de porté des ripostes.
			
			
			]])
		end)
	end)

	addGMFunction("Flotte Esteban PJ", function()
		onGMClick(function(x, y)
			local GriffePJ = PlayerSpaceship():setFaction("Chaos"):setTemplate("AA6 Devastator"):setCallSign("ED01"):setPosition(x, y):setRadarSignatureInfo(0.25, 0.8, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Chasseurs", 60):setCustomWeaponStorageMax("Chasseurs", 60):setCustomWeaponStorage("MCANMK3", 200):setCustomWeaponStorageMax("MCANMK3", 200):setDescriptions("", [[Croiseur Dévastator "Griffe Sanglante"]], [[Le Croiseur Dévastator "Griffe Sanglante" est un vaisseau polyvalent qui ne s'expose que rarement, préférant généralement soutenir sa flotille avec ses nuées de chasseurs et ses autocanons. Il est également équipé de vaisseaux de débarquement planétaire et d'équipes d'assaut conséquentes, qui le rendent redoutable lors des blocus planétaires et des abordages.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP1 Escorteur Meritech Shrike"):setCallSign("ED02"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):orderDefendTarget(GriffePJ,500,5000):setDescriptions("",[[Escorteur Meritech Shrike "Bassesse Méritée"]] , [[L'Escorteur Meritech Shrike "Bassesse Méritée" est un vaisseau tristement célèbre pour avoir été conçu pour le pillage et la piraterie. Il excelle dans les opérations de harcèlement grâce à ses deux lances sidérales, l'une sous la proue et l'autre en tourelle.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP1 Escorteur Meritech Shrike"):setCallSign("ED03"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):orderDefendTarget(GriffePJ,500,5000):setDescriptions("", [[Escorteur Meritech Shrike "Jour Noir"]], [[L'Escorteur Meritech Shrike "Bassesse Méritée" est un vaisseau tristement célèbre pour avoir été conçu pour le pillage et la piraterie. Il excelle dans les opérations de harcèlement grâce à ses deux lances sidérales, l'une sous la proue et l'autre en tourelle.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZP8 Escorteur Viper"):setCallSign("ED04"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(GriffePJ,500,5000):setDescriptions("", [[Escorteur Viper "Lance Ténébreuse"]], [[L'Escorteur Viper "Lance Ténébreuse" est un vaisseau lance-torpilles qui est généralement déployé en 2e ligne lors des batailles, afin de cibler les vaisseaux de gros tonnage une fois ceux-ci enlisés dans les affrontements avec les autres Escorteurs, tout en restant hors de porté des ripostes.
			
			
			]])
		end)
	end)
	
	addGMFunction("Flotte Ivan", function()
		onGMClick(function(x, y)
			local Douce = CpuShip():setFaction("Chaos"):setTemplate("AA5 Vaisseau d'Assaut Planétaire Hellbringer"):setCallSign("IA01"):setPosition(x, y):setRadarSignatureInfo(0.2, 0.7, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Chasseurs", 30):setCustomWeaponStorageMax("Chasseurs", 30):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setDescriptions("", [[Vaisseau d'Assaut Planétaire Hellbringer "Douce Délivrance"]], [[Le Vaisseau d'Assaut Planétaire Hellbringer "Douce Délivrance" est équipé d'armes trés variées, incluant macrocanons, vaisseaux d'assaut, bombardiers et lance sidérale, mais son atout principal reste son très nombreux équipage. Quand ce vaisseau arrive en orbite d'un monde, il peut déployer une capacité de bombardement et de débarquement redoutable. Le "Douce Délivrance" menait l'assaut planétaire sur Mérinita VI.
		
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA5 Vaisseau d'Assaut Planétaire Hellbringer"):setCallSign("IA02"):setPosition(x+5000,y):setRadarSignatureInfo(0.2, 0.7, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Chasseurs", 30):setCustomWeaponStorageMax("Chasseurs", 30):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):orderDefendTarget(Douce,500,5000):setDescriptions("", [[Vaisseau d'Assaut Planétaire Hellbringer "Porteur de Mort"]], [[Le Vaisseau d'Assaut Planétaire Hellbringer "Porteur de Mort" est équipé d'armes trés variées, incluant macrocanons, vaisseaux d'assaut, bombardiers et lance sidérale, mais son atout principal reste son très nombreux équipage. Quand ce vaisseau arrive en orbite d'un monde, il peut déployer une capacité de bombardement et de débarquement redoutable. Le "Porteur de Mort" a participé à l'assaut planétaire sur Mérinita VI.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA5 Vaisseau d'Assaut Planétaire Hellbringer"):setCallSign("IA03"):setPosition(x,y+5000):setRadarSignatureInfo(0.2, 0.7, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Chasseurs", 30):setCustomWeaponStorageMax("Chasseurs", 30):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):orderDefendTarget(Douce,500,5000):setDescriptions("", [[Vaisseau d'Assaut Planétaire Hellbringer "Dernier Messager"]], [[Le Vaisseau d'Assaut Planétaire Hellbringer "Dernier Messager" est équipé d'armes trés variées, incluant macrocanons, vaisseaux d'assaut, bombardiers et lance sidérale, mais son atout principal reste son très nombreux équipage. Quand ce vaisseau arrive en orbite d'un monde, il peut déployer une capacité de bombardement et de débarquement redoutable. Le "Dernier Messager" a participé à l'assaut planétaire sur Mérinita VI.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA3 Destroyer Iconoclast"):setCallSign("IA04"):setPosition(x-5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Douce,500,5000):setDescriptions("",[[Destroyer Iconoclast "Fléau Sombre"]], [[Le Destroyer Iconoclast "Fléau Sombre" est un modèle classique prisé des pirates et maraudeurs en tous genres pour ses puissants tirs de proue. Il semble assigné à l'escorte des Vaisseaux d'Assaut Planétaires Hellbringer et ne s'éloigne que rarement.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA3 Destroyer Iconoclast"):setCallSign("IA05"):setPosition(x,y-5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Douce,500,5000):setDescriptions("", [[Destroyer Iconoclast "Fléau Rouge"]], [[Le Destroyer Iconoclast "Fléau Rouge" est un modèle classique prisé des pirates et maraudeurs en tous genres pour ses puissants tirs de proue. Il semble assigné à l'escorte des Vaisseaux d'Assaut Planétaires Hellbringer et ne s'éloigne que rarement.
			
			
			]])
		end)
	end)

	addGMFunction("Flotte Ivan PJ", function()
		onGMClick(function(x, y)
			local DoucePJ = PlayerSpaceship():setFaction("Chaos"):setTemplate("AA5 Hellbringer"):setCallSign("IA01"):setPosition(x, y):setRadarSignatureInfo(0.2, 0.7, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Chasseurs", 30):setCustomWeaponStorageMax("Chasseurs", 30):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setDescriptions("", [[Vaisseau d'Assaut Planétaire Hellbringer "Douce Délivrance"]], [[Le Vaisseau d'Assaut Planétaire Hellbringer "Douce Délivrance" est équipé d'armes trés variées, incluant macrocanons, vaisseaux d'assaut, bombardiers et lance sidérale, mais son atout principal reste son très nombreux équipage. Quand ce vaisseau arrive en orbite d'un monde, il peut déployer une capacité de bombardement et de débarquement redoutable. Le "Douce Délivrance" menait l'assaut planétaire sur Mérinita VI.
		
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA5 Vaisseau d'Assaut Planétaire Hellbringer"):setCallSign("IA02"):setPosition(x+5000,y):setRadarSignatureInfo(0.2, 0.7, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Chasseurs", 30):setCustomWeaponStorageMax("Chasseurs", 30):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):orderDefendTarget(DoucePJ,500,5000):setDescriptions("", [[Vaisseau d'Assaut Planétaire Hellbringer "Porteur de Mort"]], [[Le Vaisseau d'Assaut Planétaire Hellbringer "Porteur de Mort" est équipé d'armes trés variées, incluant macrocanons, vaisseaux d'assaut, bombardiers et lance sidérale, mais son atout principal reste son très nombreux équipage. Quand ce vaisseau arrive en orbite d'un monde, il peut déployer une capacité de bombardement et de débarquement redoutable. Le "Porteur de Mort" a participé à l'assaut planétaire sur Mérinita VI.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA5 Vaisseau d'Assaut Planétaire Hellbringer"):setCallSign("IA03"):setPosition(x,y+5000):setRadarSignatureInfo(0.2, 0.7, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Chasseurs", 30):setCustomWeaponStorageMax("Chasseurs", 30):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):orderDefendTarget(DoucePJ,500,5000):setDescriptions("", [[Vaisseau d'Assaut Planétaire Hellbringer "Dernier Messager"]], [[Le Vaisseau d'Assaut Planétaire Hellbringer "Dernier Messager" est équipé d'armes trés variées, incluant macrocanons, vaisseaux d'assaut, bombardiers et lance sidérale, mais son atout principal reste son très nombreux équipage. Quand ce vaisseau arrive en orbite d'un monde, il peut déployer une capacité de bombardement et de débarquement redoutable. Le "Dernier Messager" a participé à l'assaut planétaire sur Mérinita VI.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA3 Destroyer Iconoclast"):setCallSign("IA04"):setPosition(x-5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(DoucePJ,500,5000):setDescriptions("", [[Destroyer Iconoclast "Fléau Sombre"]], [[Le Destroyer Iconoclast "Fléau Sombre" est un modèle classique prisé des pirates et maraudeurs en tous genres pour ses puissants tirs de proue. Il semble assigné à l'escorte des Vaisseaux d'Assaut Planétaires Hellbringer et ne s'éloigne que rarement.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA3 Destroyer Iconoclast"):setCallSign("IA05"):setPosition(x,y-5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(DoucePJ,500,5000):setDescriptions("", [[Destroyer Iconoclast "Fléau Rouge"]], [[Le Destroyer Iconoclast "Fléau Rouge" est un modèle classique prisé des pirates et maraudeurs en tous genres pour ses puissants tirs de proue. Il semble assigné à l'escorte des Vaisseaux d'Assaut Planétaires Hellbringer et ne s'éloigne que rarement.
			
			
			]])
		end)
	end)
	
	addGMFunction("Flotte Isabella", function()
		onGMClick(function(x, y)
			local Liberateur = CpuShip():setFaction("Chaos"):setTemplate("ZW4 Coursier Stellaire Orion"):setCallSign("TAR11"):setPosition(x, y):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setDescriptions("", [[Coursier Stellaire Orion "Libérateur Céleste"]], [[Le Coursier Stellaire Orion "Libérateur Céleste" est un vaisseau de transport rapide spécialisé dans la livraison de petites cargaisons de grande valeur, ainsi que dans le contournement des patrouilles ennemies. Bien que fragile, il compte sur sa vitesse pour distancer les navires plus lourds, et sur ses armes pour dissuader les plus rapides, préférant ainsi voyager seul que se joindre aux convois marchands habituels.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZW3 Navire Loki"):setCallSign("GIS22"):setPosition(x+5000,y):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Liberateur,500,5000):setDescriptions("", [[Navire Marchand Vagabond "Volonté du Peuple"]], [[Le Navire Marchand Vagabond "Volonté du Peuple" est un navire marchand surarmé par la Marine Impériale et destiné à tendre des pièges aux pirates. La tactique la plus classique de ce type de vaisseau est de se rendre à la vue d'un pirate, puis d'ouvrir le feu quand celui-ci tente de l'arraisonner. Il est malheureusement très lent et ne peux tenir un combat soutenu.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZW3 Navire Loki"):setCallSign("ULT33"):setPosition(x,y+5000):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Liberateur,500,5000):setDescriptions("", [[Navire Marchand Vagabond "Mort du Tyran"]], [[Le Navire Marchand Vagabond "Mort du Tyran" est un navire marchand surarmé par la Marine Impériale et destiné à tendre des pièges aux pirates. La tactique la plus classique de ce type de vaisseau est de se rendre à la vue d'un pirate, puis d'ouvrir le feu quand celui-ci tente de l'arraisonner. Il est malheureusement très lent et ne peux tenir un combat soutenu.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZQ4 Fregate Firestorm"):setCallSign("FRA44"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Liberateur,500,5000):setDescriptions("", [[Fregate Firestorm "Jour de Gloire"]], [[La Fregate Firestorm "Jour de Gloire" est un modèle classique armée de lances sidérales, spécialisée dans les opérations de harcellement en meute.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZQ4 Fregate Firestorm"):setCallSign("LAS55"):setPosition(x-5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Liberateur,500,5000):setDescriptions("", [[Fregate Firestorm "Etendard Sanglant"]], [[La Fregate Firestorm "Etendard Sanglant" est un modèle classique armée de lances sidérales, spécialisée dans les opérations de harcellement en meute.
			
			
			]])
		end)
	end)

	addGMFunction("Flotte Isabella PJ", function()
		onGMClick(function(x, y)
			local LiberateurPJ = PlayerSpaceship():setFaction("Chaos"):setTemplate("ZW4 Orion"):setCallSign("TAR11"):setPosition(x, y):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setDescriptions("", [[Coursier Stellaire Orion "Libérateur Céleste"]], [[Le Coursier Stellaire Orion "Libérateur Céleste" est un vaisseau de transport rapide spécialisé dans la livraison de petites cargaisons de grande valeur, ainsi que dans le contournement des patrouilles ennemies. Bien que fragile, il compte sur sa vitesse pour distancer les navires plus lourds, et sur ses armes pour dissuader les plus rapides, préférant ainsi voyager seul que se joindre aux convois marchands habituels.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZW3 Navire Loki"):setCallSign("GIS22"):setPosition(x+5000,y):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1, 1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(LiberateurPJ,500,5000):setDescriptions("", [[Navire Marchand Vagabond "Volonté du Peuple"]], [[Le Navire Marchand Vagabond "Volonté du Peuple" est un navire marchand surarmé par la Marine Impériale et destiné à tendre des pièges aux pirates. La tactique la plus classique de ce type de vaisseau est de se rendre à la vue d'un pirate, puis d'ouvrir le feu quand celui-ci tente de l'arraisonner. Il est malheureusement très lent et ne peux tenir un combat soutenu.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZW3 Navire Loki"):setCallSign("ULT33"):setPosition(x,y+5000):setRadarSignatureInfo(0.2, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(LiberateurPJ,500,5000):setDescriptions("", [[Navire Marchand Vagabond "Mort du Tyran"]], [[Le Navire Marchand Vagabond "Mort du Tyran" est un navire marchand surarmé par la Marine Impériale et destiné à tendre des pièges aux pirates. La tactique la plus classique de ce type de vaisseau est de se rendre à la vue d'un pirate, puis d'ouvrir le feu quand celui-ci tente de l'arraisonner. Il est malheureusement très lent et ne peux tenir un combat soutenu.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZQ4 Fregate Firestorm"):setCallSign("FRA44"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(LiberateurPJ,500,5000):setDescriptions("", [[Fregate Firestorm "Jour de Gloire"]], [[La Fregate Firestorm "Jour de Gloire" est un modèle classique armée de lances sidérales, spécialisée dans les opérations de harcellement en meute.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("ZQ4 Fregate Firestorm"):setCallSign("LAS55"):setPosition(x-5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(LiberateurPJ,500,5000):setDescriptions("", [[Fregate Firestorm "Etendard Sanglant"]], [[La Fregate Firestorm "Etendard Sanglant" est un modèle classique armée de lances sidérales, spécialisée dans les opérations de harcellement en meute.
			
			
			]])
		end)
	end)
	
	addGMFunction("Flotte Eduardo", function()
		onGMClick(function(x, y)
			local Messager = CpuShip():setFaction("Chaos"):setTemplate("AA7 Croiseur Slaughter"):setCallSign("EJ01"):setPosition(x, y):setRadarSignatureInfo(0.25, 0.9, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setDescriptions("", [[Croiseur Slaughter "Messager des Abysses"]], [[Le Croiseur Slaughter "Messager des Abysses" est un modèle qui n'est plus produit par l'Impérium, et dont la majorité se sont d'ailleurs rebellés. Bénéficiant de la vitesse offerte par ses bobines de moteurs Archéotechnologiques Scartix, ce vaisseau peut approcher rapidement de ses cibles avant de les noyer sous une pluie d'obus de Macrocanons. Cependant, le plus troublant est sans doute que ce vaisseau a été signalé à de nombreux endroits dans le sous-secteur, sans que la Marine Impériale ne parvienne à l'intercepter.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA2 Escorteur Infidel"):setCallSign("EJ02"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(Messager,500,5000):setDescriptions("", [[Escorteur Infidel "Sang Offert"]], [[L'Escorteur Infidel "Sang Offert" a été impliqué dans plusieurs actes de piraterie dans tout le sous-secteur. Ses salves de torpilles ont forcé plus d'une fois des vaisseaux à se rendre pour ne pas être détruits, et il semble que les prisonniers fasse partie de son butin favori.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA3 Destroyer Iconoclast"):setCallSign("EJ03"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Messager,500,5000):setDescriptions("", [[Destroyer Iconoclast "Révélation Divine"]], [[Le Destroyer Iconoclast "Révélation Divine" est un modèle classique prisé des pirates et maraudeurs en tous genres pour ses puissants tirs de proue. Il a été signalé opérant en de nombreux endroits du sous-secteur.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA3 Destroyer Iconoclast"):setCallSign("EJ04"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(Messager,500,5000):setDescriptions("", [[Destroyer Iconoclast "Béatification Finale"]], [[Le Destroyer Iconoclast "Béatification Finale" est un modèle classique prisé des pirates et maraudeurs en tous genres pour ses puissants tirs de proue. Il a été signalé opérant en de nombreux endroits du sous-secteur.
			
			
			]])
		end)
	end)

	addGMFunction("Flotte Eduardo PJ", function()
		onGMClick(function(x, y)
			local MessagerPJ = PlayerSpaceship():setFaction("Chaos"):setTemplate("AA7 Slaughter"):setCallSign("EJ01"):setPosition(x, y):setRadarSignatureInfo(0.25, 0.9, 0.4):setScanningParameters(2,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setDescriptions("", [[Croiseur Slaughter "Messager des Abysses"]], [[Le Croiseur Slaughter "Messager des Abysses" est un modèle qui n'est plus produit par l'Impérium, et dont la majorité se sont d'ailleurs rebellés. Bénéficiant de la vitesse offerte par ses bobines de moteurs Archéotechnologiques Scartix, ce vaisseau peut approcher rapidement de ses cibles avant de les noyer sous une pluie d'obus de Macrocanons. Cependant, le plus troublant est sans doute que ce vaisseau a été signalé à de nombreux endroits dans le sous-secteur, sans que la Marine Impériale ne parvienne à l'intercepter.

			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA2 Escorteur Infidel"):setCallSign("EJ02"):setPosition(x+5000,y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):orderDefendTarget(MessagerPJ,500,5000):setDescriptions("", [[Escorteur Infidel "Sang Offert"]], [[L'Escorteur Infidel "Sang Offert" a été impliqué dans plusieurs actes de piraterie dans tout le sous-secteur. Ses salves de torpilles ont forcé plus d'une fois des vaisseaux à se rendre pour ne pas être détruits, et il semble que les prisonniers fasse partie de son butin favori.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA3 Destroyer Iconoclast"):setCallSign("EJ03"):setPosition(x,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(MessagerPJ,500,5000):setDescriptions("", [[Destroyer Iconoclast "Révélation Divine"]], [[Le Destroyer Iconoclast "Révélation Divine" est un modèle classique prisé des pirates et maraudeurs en tous genres pour ses puissants tirs de proue. Il a été signalé opérant en de nombreux endroits du sous-secteur.
			
			
			]])
			CpuShip():setFaction("Chaos"):setTemplate("AA3 Destroyer Iconoclast"):setCallSign("EJ04"):setPosition(x+5000,y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1,1):setScanned(false):setScannedByFaction("Chaos",true):setCustomWeaponStorage("Torpille", 12):setCustomWeaponStorageMax("Torpille", 12):orderDefendTarget(MessagerPJ,500,5000):setDescriptions("", [[Destroyer Iconoclast "Béatification Finale"]], [[Le Destroyer Iconoclast "Béatification Finale" est un modèle classique prisé des pirates et maraudeurs en tous genres pour ses puissants tirs de proue. Il a été signalé opérant en de nombreux endroits du sous-secteur.
			
			
			]])
		end)
	end)

	addGMFunction("Arche Xonerak", function()
		onGMClick(function(x, y)
			local Expansio = CpuShip():setFaction("Neutre"):setTemplate("ZV5 Arche Mechanicus"):setCallSign("%M46N4%"):setPosition(x, y):setRadarSignatureInfo(0.6, 0.9, 0.5):setScanningParameters(3,2):setScanned(false):setScannedByFaction("Neutre",true):setCustomWeaponStorage("Canon Nova", 6):setCustomWeaponStorageMax("Canon Nova", 6):setCustomWeaponStorage("MCANMK4", 200):setCustomWeaponStorageMax("MCANMK4", 200):setDescriptions("", [[Arche Mechanicus "Magna Expansio Martis". Les signaux d'identification sont complexes et instables, même pour un vaisseau de cette classe.]], [[L'Arche Mechanicus "Magna Expansio Martis" est de conception très particulière, même pour une Arche Mechanicus. En effet, une analyse poussée de la structure révèle qu'elle est en fait principalement constituée des carcasses de trois vaisseaux : Autour de la structure du Cuirassé Explorator "Martis Superbia" se trouvent le Croiseur Lunar "Expansio Imperatoris", ainsi que le Croiseur Ambition "Magna Vigilantia". Contre toute attente, les trois vaisseaux semblent fonctionner comme un seul bâtiment, ce qui suggère un important travail d'ingénierie spatiale digne des plus grands esprits du Basilikon Astra, la cabale de l'Adeptus Mechanicus chargée de la conception et de l'entretien des vaisseaux.

			
			]])
		end)
	end)

	addGMFunction("Arche Xonerak PJ", function()
		onGMClick(function(x, y)
			local ExpansioPJ = PlayerSpaceship():setFaction("Neutre"):setTemplate("ZV5 Arche"):setCallSign("%M46N4%"):setPosition(x, y):setRadarSignatureInfo(0.6, 0.9, 0.5):setScanningParameters(3,2):setScanned(false):setScannedByFaction("Neutre",true):setCustomWeaponStorage("Canon Nova", 6):setCustomWeaponStorageMax("Canon Nova", 6):setCustomWeaponStorage("MCANMK4", 200):setCustomWeaponStorageMax("MCANMK4", 200):setDescriptions("", [[Arche Mechanicus "Magna Expansio Martis". Les signaux d'identification sont complexes et instables, même pour un vaisseau de cette classe.]], [[L'Arche Mechanicus "Magna Expansio Martis" est de conception très particulière, même pour une Arche Mechanicus. En effet, une analyse poussée de la structure révèle qu'elle est en fait principalement constituée des carcasses de trois vaisseaux : Autour de la structure du Cuirassé Explorator "Martis Superbia" se trouvent le Croiseur Lunar "Expansio Imperatoris", ainsi que le Croiseur Ambition "Magna Vigilantia". Contre toute attente, les trois vaisseaux semblent fonctionner comme un seul bâtiment, ce qui suggère un important travail d'ingénierie spatiale digne des plus grands esprits du Basilikon Astra, la cabale de l'Adeptus Mechanicus chargée de la conception et de l'entretien des vaisseaux.

			
			]])
		end)
	end)
	
	addGMFunction("Vaisseau Amonvyn", function()
		onGMClick(function(x, y)
			local Merkhain = CpuShip():setFaction("Eldar"):setTemplate("ZX2 Fregate Hellebore"):setCallSign(""):setPosition(x, y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(3,3):setScanned(false):setScannedByFaction("Eldar",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):setAutoCoolant(true):commandSetAutoRepair(true):setMaxCoolant(30):setDescriptions("", [[Frégate Eldar Hellebore "Merkhain"]], [[La Frégate Eldar "Hellebore" est un mélange fatal de vitesse, de maniabilité et de puissance de frappe. Incarnant la philosophie guerrière Eldar, elle excelle dans les embuscades, dispersant les flottes à l'aide de ses torpilles et détruisant les escorteurs de ses canons de proue avant même d'être détectée, puis disparait dans le vide. Ce vaisseau en particulier, le "Merkhain", a été repéré aux abords de Merinita en 762M41, durant l'invasion du système par le Chaos. Cependant, aucun rapport de mentionne ses activités, ni même si il s'est battu.

			
			]])
		end)
	end)

	addGMFunction("Vaisseau Amonvyn PJ", function()
		onGMClick(function(x, y)
			local MerkhainPJ = PlayerSpaceship():setFaction("Eldar"):setTemplate("ZX2 Hellebore"):setCallSign(""):setPosition(x, y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(3,3):setScanned(false):setScannedByFaction("Eldar",true):setCustomWeaponStorage("Torpille", 6):setCustomWeaponStorageMax("Torpille", 6):setSystemHeatRate(Cloaking,0):setAutoCoolant(true):commandSetAutoRepair(true):setMaxCoolant(30):setDescriptions([[""]], [[Frégate Eldar Hellebore "Merkhain"]], [[La Frégate Eldar "Hellebore" est un mélange fatal de vitesse, de maniabilité et de puissance de frappe. Incarnant la philosophie guerrière Eldar, elle excelle dans les embuscades, dispersant les flottes à l'aide de ses torpilles et détruisant les escorteurs de ses canons de proue avant même d'être détectée, puis disparait dans le vide. Ce vaisseau en particulier, le "Merkhain", a été repéré aux abords de Merinita en 762M41, durant l'invasion du système par le Chaos. Cependant, aucun rapport de mentionne ses activités, ni même si il s'est battu.

			
			]])
		end)
	end)
	
	addGMFunction("Flotte Libre-Marchand", function()
		onGMClick(function(x, y)
			local DefiancePJ = PlayerSpaceship():setFaction("Défiance"):setCallSign("ANOM01"):setTemplate("ZY9 Grand Croiseur"):setPosition(x, y):setRadarSignatureInfo(0.4, 0.9, 0.5):setScanningParameters(3, 1):setTypeName("Grand Croiseur Répulsive"):setCustomWeaponStorage("MCANMK3X", 600):setCustomWeaponStorageMax("MCANMK3X", 600):setCustomWeaponStorage("Torpille", 18):setCustomWeaponStorageMax("Torpille", 18):setScanned(false):setScannedByFaction("Défiance",true):setDescriptions("",[[Grand Croiseur Repulsive "Défiance"
	
	]],[[Le Grand Croiseur de Classe Repulsive Défiance appartient au Seigneur-Capitaine Vargas Anomtarkus, Libre-Marchand du sous-secteur d'Argos, depuis peu. On raconte que c'est lors d'une expédition en dehors des frontières de l'Imperium que le Capitaine a retrouvé ce vaisseau appartennant à sa famille et perdu depuis plus de 4 siècles. Equipé de nombreux macrocanons et de tourelles laser, il est polyvalent, mais trop lent pour rattraper les vaisseaux de plus petit tonnage.
	
	
	]])

			local ProdestPJ = PlayerSpaceship():setFaction("Défiance"):setCallSign("DEF02"):setTemplate("ZQ1 Sword"):setPosition(x+5000, y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2, 1):setTypeName("Fregate Sword"):setScanned(false):setScannedByFaction("Défiance",true):setDescriptions("",[[Frégate Sword "Prodest Primum"
	
	
	]],[[La Frégate Sword "Prodest Primum" (Le profit avant tout) est enregistrée comme frégate marchande issue de l'Amas de Tvasos. Récemment mise hors combat dans le système Misthos, l'épave fut récupérée et remise en état sur Fractarius, avant que le vaisseau ne passe sous le commandement du Libre-Marchand Vargas Anomtarkus, un accord toujours en attente de validation par la forteresse segmentaire de Kar Duniash, mais appliqué de fait.
	
	
	]])

			local BouclierPJ = PlayerSpaceship():setFaction("Défiance"):setCallSign("DEF01"):setTemplate("ZP7 Cobra"):setPosition(x, y+5000):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(1, 1):setTypeName("Escorteur Cobra"):setAutoCoolant(true):commandSetAutoRepair(true):setScanned(false):setScannedByFaction("Défiance",true):setDescriptions("",[[Escorteur Cobra "Bouclier Vertueux"
	
	
	]],[[L'Escorteur Cobra "Bouclier Vertueux" est un des rares rescapés de Merinita. Initialement rattaché à la Marine Impériale, il fut happé hors de la bataille par la retraite du Défiance à travers le Warp. Il semblerait qu'il présente désormais des codes d'affiliations au Libre-Marchand Vargas Anomtarkus, et serve dans sa flotille.
	
	
	]])
		end)
	end)
	
	addGMFunction("Flotte Explorator", function()
		onGMClick(function(x, y)
			local GambitPJ = PlayerSpaceship():setFaction("Gambit Metallicus"):setCallSign("FRA-LAS-01"):setTemplate("ZY8 Gambit"):setPosition(x, y):setRadarSignatureInfo(0.3, 0.8, 0.4):setScanningParameters(2, 1):setTypeName("Croiseur de Combat Lunar"):setCustomWeaponStorage("Canon Nova", 6):setCustomWeaponStorageMax("Canon Nova", 6):setCustomWeaponStorage("MCANMK2X", 200):setCustomWeaponStorageMax("MCANMK2X", 200):setScanned(false):setScannedByFaction("Gambit Metallicus",true):setDescriptions("",[[Croiseur Lunar "Gambit Metallicus"
	
	
	]],[[Affrété à l'origine par le Prime Hermeticon Andra-7, le Gambit Metallicus est un Croiseur Lunar modifié dont les lance torpilles traditionnels ont été remplacés par un redoutable canon Nova. Base d'opération de la Cellule Zeta, le premier équipage Explorator commun aux Mondes-Forges de Lascarois et Fractarius, il a été réparé plusieurs fois ces dernières années.
	
	
	]])

			local QuaesitorPJ = PlayerSpaceship():setFaction("Gambit Metallicus"):setCallSign("FRA-LAS-02"):setTemplate("ZQ2 Tempest"):setPosition(x+5000, y):setRadarSignatureInfo(0.1, 0.7, 0.3):setScanningParameters(2, 1):setTypeName("Fregate d'attaque Tempest"):setScanned(false):setScannedByFaction("Gambit Metallicus",true):setDescriptions("",[[Frégate d'attaque Tempest "Quaesitor Scientiae"
	
	
	]],[[Comme son nom le laisse supposer, la Frégate d'Attaque Tempest "Quaesitor Scientiae" (Chercheur de COnnaissances) n'a pas été conçue dans l'Amas Tarkusien. Faisant à l'origine partie des renforts appelés pour la bataille de Merinita, cette Frégate n'était cependant pas présente lors de la bataille. Désormais, elle présente les codes d'asservissement du Gambit Metallicus et semble faire cause commune avec son équipage.
	
	
	]])
		end)
	end)
	
	addGMFunction("Flotte Marine", function()
		onGMClick(function(x, y)
			local CelestinePJ = PlayerSpaceship():setFaction("Esperance de Sainte Célestine"):setCallSign("KAR45"):setTemplate("ZY5 Esperance"):setPosition(x, y):setRadarSignatureInfo(0.4, 0.9, 0.5):setScanningParameters(2, 1):setTypeName("Croiseur de Combat Chalice"):setCustomWeaponStorage("MCANMK2", 200):setCustomWeaponStorageMax("MCANMK2", 200):setCustomWeaponStorage("Torpille", 18):setCustomWeaponStorageMax("Torpille", 18):setSystemHeatRate("reactor", 0.062):setSystemHeatRate("beamweapons", 0.062):setSystemHeatRate("missilesystem", 0.062):setSystemHeatRate("maneuver", 0.062):setSystemHeatRate("impulse", 0.062):setSystemHeatRate("jumpdrive", 0.062):setSystemHeatRate("frontshield", 0.062):setSystemHeatRate("drones", 0.062):setScanned(false):setScannedByFaction("Esperance de Sainte Célestine",true):setDescriptions("",[[Croiseur de Combat Chalice "Esperance de Sainte Célestine"
	
	]],[[L'Esperance de Sainte Celestine est un Croiseur de Combat de Classe Chalice récemment arrivé dans le sous-secteur d'Argos afin de répondre à une demande de renforts. Parvenant à s'extraire du système de Merinita après la défaite Impériale, l'équipage parvint a radouber suffisamment le vaisseau pour éliminer plusieurs vagues d'attaquants avant de mener une opération audacieuse dans le territoire récemment conquis par l'ennemi afin de piéger le portail Warp s'y trouvant et ainsi le priver de renforts.
	
	
	]])
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
