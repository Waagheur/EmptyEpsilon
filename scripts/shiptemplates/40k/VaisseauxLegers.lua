--[[                  Vaisseaux légers
Rappel des catégories : 
Vaisseau léger : 1 à 3 places ; aucun moteur Warp ou Jump possible ; shipTemplates_VaisseauxLegers.lua ;
Frégate : 4 à 9 places ; shipTemplates_Fregates.lua ;
Destroyer : 10 à 50 places ; shipTemplates_Escorteurs.lua ;
Croiseur Léger : 50 à 100 places ; shipTemplates_CroiseursLegers.lua ;
Croiseur : 100 à 250 places ; shipTemplates_Croiseurs.lua ;
Cuirassé : 250 à 500 places ; shipTemplates_Cuirasse.lua ;
Porte-Vaisseaux : plus de 500 places; shipTemplates_Capitaux.lua ;
Drones et Créatures : N.C ; shipTemplates_Autres.lua ;
Stations;

Les Vaisseaux légers réunissent deux types de vaisseaux.
- Le chasseur, souvent petit, ultra-maniable et dispose d'une force de frappe certes non négligeable mais plus faible que sur d'autres types de vaisseaux. Assez fragile il se fait abattre rapidement.
- Le bombardier, est plus lourdement armé et mieux défendu que les chasseurs, il a pour objectifs les vaisseaux moyens.
----------------------------------------------------------]]

function couleur(template,name,model)
	for _, color in ipairs({"Blue", "Green", "Grey", "Red", "White", "Yellow"}) do
		variation = template:copy(name .. " " .. color):setModel(model .. color):setSecret(true)
	end
end

function PZ(template,name,model)
	for _, color in ipairs({"-IMP-","-CHAOS-","-ELDAR-","-TAU-","-TRADE-","-MECH-"}) do
		variation = template:copy(name .. " " .. color):setModel(model .. color):setSecret(true)
	end
end


--[[Chasseur]]
template = ShipTemplate():setName("Chasseur"):setClass("Chasseur","Patrouille"):setModel("dark_fighter_6")
template:setRadarTrace("adv_striker.png")
template:setDescription([[On trouve ce chasseur de base dans de nombreux coins de la galaxie. Il est facile de trouver des pieces de rechange, non seulement parce qu'ils sont produites en grand nombre, mais aussi parce qu'ils subissent des pertes elevees au combat.]])
template:setHull(45)
template:setShields(0)
template:setSpeed(150, 20, 25)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 150, 1, 1500.0, 1.5, 1.5)
template:setBeam(1, 150, -1, 1500.0, 1.5, 1.5)
--MGAA Skyreaper simple pour les chasseur/petit vaisseau ( homing trés rapide ) 
template:setCustomWeapon("Homing", "SKY1", 0.6, 400.0, "Kinetic", -1)
template:setCustomWeaponColor("SKY1", 255, 204, 0)
template:setCustomWeaponStorage("SKY1", 6)
template:setDefaultAI('fighter')
--       Tubes
template:setTubes(1, 12.0)
template:setTubeDirection(0, 0)
template:setTubeSize(0, "small")
template:setCanDock(true)
template:setCanHack(false)
--template:setScanProbeCount(1)--template:setMaxScanProbeCount(0)
template:setSystemDamageHullThreshold(0.5)
--[[Chasseur Corsair]]
variation = template:copy("Chasseur Corsair")
variation:setLocaleName("Chasseur Corsair")
variation:setModel("Eldar_Corsair_Fighter")
variation:setDescription([[Ce chasseur Eldar est rapide tout en possedant une grande puissance de feu, il ne faut surtout pas le sous estimer.]])
variation:setHull(55)
variation:setShields(35)
variation:setSpeed(240, 32, 35)
--MGAA Skyreaper ( homing trés rapide ) fregrate et plus
variation:setCustomWeapon("Homing", "SKYR", 0.5, 500.0, "Kinetic", -1)
variation:setCustomWeaponMultiple("SKYR",1,3)
variation:setCustomWeaponColor("SKYR", 29, 57, 84)
variation:setCustomWeaponStorage("SKYR", 10)



--[[Chasseur Mk2]]
variation = template:copy("Chasseur Mk2"):setType("playership")
variation:setLocaleName("Chasseur Mk2")
variation:setDescription([[On trouve ce chasseur de base dans de nombreux coins de la galaxie. Il est facile de trouver des pieces de rechange, non seulement parce qu'ils sont produites en grand nombre, mais aussi parce qu'ils subissent des pertes elevees au combat.]])
--MGAA Skyreaper simple pour les chasseur/petit vaisseau ( homing trés rapide ) 
--variation:setCustomWeapon("Homing", "SKY1", 0.25, 1000.0, "Kinetic", -1)
--variation:setCustomWeaponColor("SKY1", 255, 204, 0)
--variation:setCustomWeaponStorage("SKY1", 6)
--MGAA Skyreaper ( homing trés rapide ) fregrate et plus
variation:setCustomWeapon("Homing", "SKYR", 0.5, 500.0, "Kinetic", -1)
variation:setCustomWeaponMultiple("SKYR",1,3)
variation:setCustomWeaponColor("SKYR", 255, 204, 0)
variation:setCustomWeaponStorage("SKYR", 10)

-- PJ
variation:setCombatManeuver(300, 150)
variation:setEnergyStorage(500)
variation:setRepairCrewCount(2)
variation:addRoomSystem(4,0,3,1,"RearShield")
variation:addRoomSystem(3,1,3,1,"MissileSystem")
variation:addRoomSystem(0,1,1,1,"Beamweapons")
variation:addRoomSystem(1,1,1,3,"Reactor")
variation:addRoomSystem(2,2,3,1,"Warp")
variation:addRoomSystem(5,2,4,1,"JumpDrive")
variation:addRoomSystem(0,3,1,1,"Impulse")
variation:addRoomSystem(3,3,3,1,"Maneuver")
variation:addRoomSystem(4,4,3,1,"FrontShield")
variation:addDoor(1,1,false)
variation:addDoor(1,3,false)
variation:addDoor(2,2,false)
variation:addDoor(5,2,false)
variation:addDoor(4,3,true)
variation:addDoor(5,2,true)
variation:addDoor(4,1,true)
variation:addDoor(5,4,true)
variation:setShortRangeRadarRange(7500)
variation:setCanDock(true)
variation:setCanDock(true)
variation:setCanHack(false)
--variation:setScanProbeCount(1)--variation:setMaxScanProbeCount(0)

--[[Intercepteur]]
template = ShipTemplate():setName("Intercepteur"):setClass("Chasseur", "Intercepteur"):setModel("WespeScoutGrey")
template:setRadarTrace("fighter.png")
template:setDescription([[On trouve cet Intercepteur dans de nombreux coins de la galaxie. Il est facile de trouver des pieces de rechange, non seulement parce qu'ils sont produites en grand nombre, mais aussi parce qu'ils subissent des pertes elevees au combat.]])
template:setHull(50)
template:setShields(20)
template:setSpeed(190, 22, 25, 100, 22)
template:setDefaultAI('fighter')
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 150, 1, 1500.0, 1.5, 2)
template:setBeam(1, 150, -1, 1500.0, 1.5, 2)
template:setTubes(1, 12.0)
template:setTubeSize(0, "small")
template:setTubeDirection(0, 0)
template:setSystemDamageHullThreshold(0.5)
--MGAA Skyreaper simple pour les chasseur/petit vaisseau ( homing trés rapide ) 
template:setCustomWeapon("Homing", "SKYR", 0.6, 1000.0, "Kinetic", 25)
template:setCustomWeaponMultiple("SKYR",1,3)
template:setCustomWeaponColor("SKYR", 255, 204, 0)
template:setCustomWeaponStorage("SKYR", 10)
template:setCanDock(true)
template:setCanHack(false)
--template:setScanProbeCount(1)--template:setMaxScanProbeCount(0)
template:setDockClasses("Drone")

--[[Intercepteur Imperial Fury]]
variation = template:copy("Intercepteur Imperial Fury")
variation:setLocaleName("Intercepteur Imperial Fury")
variation:setModel("WespeScoutGreen")
variation:setDescription([[Comme tous les appareils d'attaque a bord des vaisseaux de la Flotte Imperiale, le Chasseur Intercepteur Fury est en fait une appellation regroupant une grande diversite d'engins spatiaux issus d'usines de differents mondes.
Malgre cette diversite, les chasseurs Intercepteur Fury partagent les memes caracteristiques principales : un equipage reduit, une grande puissance de feu direct ainsi que de puissants moteurs et propulseurs leur donnant une grande vitesse et manœuvrabilite.]])
variation:setCustomWeapon("Homing", "SKY1", 0.25, 1000.0, "Kinetic", -1)
variation:setCustomWeaponColor("SKY1", 255, 204, 0)
variation:setCustomWeaponStorage("SKY1", 4)

--[[Chasseur Fury]]
variation = variation:copy("Intercepteur Fury"):setType("playership")
variation:setLocaleName("Intercepteur Fury")
variation:setModel("WespeScoutBlue")
variation:setDescription([[Comme tous les appareils d'attaque a bord des vaisseaux de la Flotte Imperiale, le Chasseur Intercepteur Fury est en fait une appellation regroupant une grande diversite d'engins spatiaux issus d'usines de differents mondes.
Malgre cette diversite, les chasseurs Intercepteur Fury partagent les memes caracteristiques principales : un equipage reduit, une grande puissance de feu direct ainsi que de puissants moteurs et propulseurs leur donnant une grande vitesse et manœuvrabilite.]])
-- PJ

variation:setCustomWeapon("Homing", "SKYR", 0.5, 500.0, "Kinetic", -1)
variation:setCustomWeaponMultiple("SKYR",1,3)
variation:setCustomWeaponColor("SKYR", 255, 204, 0)
variation:setCustomWeaponStorage("SKYR", 6)
variation:setCustomWeapon("Homing", "SEEK", 3, 600.0, "Kinetic", -1)
variation:setCustomWeaponColor("SEEK", 255, 204, 0)
variation:setCustomWeaponStorage("SEEK", 3)

variation:setCombatManeuver(600, 300)
variation:setEnergyStorage(400)
variation:setRepairCrewCount(1)
variation:addRoomSystem(3, 0, 1, 1, "Maneuver");
variation:addRoomSystem(1, 0, 2, 1, "BeamWeapons");
variation:addRoomSystem(0, 1, 1, 2, "RearShield");
variation:addRoomSystem(1, 1, 2, 2, "Reactor");
variation:addRoomSystem(3, 1, 2, 1, "Warp");
variation:addRoomSystem(3, 2, 2, 1, "JumpDrive");
variation:addRoomSystem(5, 1, 1, 2, "FrontShield");
variation:addRoomSystem(1, 3, 2, 1, "MissileSystem");
variation:addRoomSystem(3, 3, 1, 1, "Impulse");
variation:addDoor(2, 1, true);
variation:addDoor(3, 1, true);
variation:addDoor(1, 1, false);
variation:addDoor(3, 1, false);
variation:addDoor(3, 2, false);
variation:addDoor(3, 3, true);
variation:addDoor(2, 3, true);
variation:addDoor(5, 1, false);
variation:addDoor(5, 2, false);
variation:setShortRangeRadarRange(7500)


--[[Bombardier du Chaos Doomfire]]
template = ShipTemplate():setName("Bombardier du Chaos Doomfire"):setClass("Chasseur", "Bombardier"):setModel("AdlerLongRangeScoutRed")
template:setRadarTrace("cruiser.png")
template:setDescription([[Plus lourd et moins rapide que le chasseur Swiftdeath, le bombardier Doomfire n'en est pas moins un appareil d'attaque craint par toutes les classes de vaisseaux, depuis le plus petit escorteur jusqu'au massifs vaisseaux de ligne.]])
template:setHull(80)
template:setShields(40)
template:setSpeed(140, 20, 15, 80, 10)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, 0, 2000.0, 7.0, 25)
--                                Arc, Dir, Rotate speed
template:setSystemDamageHullThreshold(0.5)
--       Tubes
template:setTubes(2, 12.0)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 1)
template:setTubeSize(0,"Small")
template:setTubeSize(1,"Small")
template:setDefaultAI('fighter')
template:setCanDock(true)
template:setCanHack(false)
--template:setScanProbeCount(4)
--template:setMaxScanProbeCount(4)

--TG Seeker ( homing) 
--template:setCustomWeapon("Homing", "SEEK", 4, 400.0, "Kinetic", -1)
--template:setCustomWeaponColor("SEEK", 255, 204, 0)
--template:setCustomWeaponMultiple("SEEK",1,2)
--template:setCustomWeaponStorage("SEEK", 12)
-- Autocanon : (rafale longue , degat faible)
--template:setCustomWeapon("HVLI", "AC", 3, 1200.0, "Kinetic", -1)
--template:setCustomWeaponMultiple("AC",2,2)
--template:setCustomWeaponColor("AC", 255, 51, 0)
--template:setCustomWeaponStorage("AC", 8)
--TG fusionmelta ( Nuke homing) 
template:setCustomWeapon("Nuke", "MELT", 2, 300.0, "Kinetic", -1)
template:setCustomWeaponColor("MELT", 204, 0, 0)
--template:setCustomWeaponMultiple("MELT",1,2)
template:setCustomWeaponStorage("MELT", 12)

--[[Bombardier Imperial Starhawk]]
variation = template:copy("Bombardier Imperial Starhawk")
variation:setLocaleName("Bombardier Imperial Starhawk")
variation:setModel("AdlerLongRangeScoutGreen")
variation:setDescription([[Comme tous les appareils d'attaque a bord des vaisseaux de la Flotte Imperiale, le Bombardier Starhawk est en fait une appellation regroupant une grande diversite d'engins spatiaux issus d'usines de differents mondes.]])
variation:setShields(40)
variation:setCanHack(false)
variation:setCanDock(true)
variation:setTubeDirection(0, 0)
variation:setTubeDirection(1, 1)
variation:setTubeSize(0,"Small")
variation:setTubeSize(1,"Small")

--[[Bombardier Starhawk]]
variation = template:copy("Bombardier Starhawk"):setType("playership")
variation:setLocaleName("Bombardier Starhawk")
variation:setModel("AdlerLongRangeScoutBlue")
variation:setDescription([[Comme tous les appareils d'attaque a bord des vaisseaux de la Flotte Imperiale, le Bombardier Starhawk est en fait une appellation regroupant une grande diversite d'engins spatiaux issus d'usines de differents mondes.]])
variation:setHull(120)
variation:setShields(40)

variation:setTubeDirection(0, 0)
variation:setTubeDirection(1, 1)
variation:setTubeSize(0,"Small")
variation:setTubeSize(1,"Small")

variation:registerSquadronComposition("TestSq", 5, 15, "Chasseur Mk2", "Chasseur", "Chasseur","Chasseur")
variation:registerSquadronComposition("TestSq2", 5, 15, "Chasseur Mk2", "Chasseur", "Chasseur","Chasseur")
variation:registerSquadronComposition("TestSq3", 5, 15, "Chasseur Mk2", "Chasseur", "Chasseur","Chasseur")
variation:registerSquadronComposition("TestSq4", 5, 15, "Chasseur Mk2", "Chasseur", "Chasseur","Chasseur")

-- PJ
variation:setCombatManeuver(600, 350)
variation:setEnergyStorage(400)
variation:setRepairCrewCount(2)
variation:addRoomSystem(3, 0, 1, 1, "Maneuver");
variation:addRoomSystem(1, 0, 2, 1, "BeamWeapons");
variation:addRoomSystem(0, 1, 1, 2, "RearShield");
variation:addRoomSystem(1, 1, 2, 2, "Reactor");
variation:addRoomSystem(3, 1, 2, 1, "Warp");
variation:addRoomSystem(3, 2, 2, 1, "JumpDrive");
variation:addRoomSystem(5, 1, 1, 2, "FrontShield");
variation:addRoomSystem(1, 3, 2, 1, "MissileSystem");
variation:addRoomSystem(3, 3, 1, 1, "Impulse");
variation:addDoor(2, 1, true);
variation:addDoor(3, 1, true);
variation:addDoor(1, 1, false);
variation:addDoor(3, 1, false);
variation:addDoor(3, 2, false);
variation:addDoor(3, 3, true);
variation:addDoor(2, 3, true);
variation:addDoor(5, 1, false);
variation:addDoor(5, 2, false);
variation:setShortRangeRadarRange(7500)
variation:setDockClasses("Drone")

variation:setCanHack(false)
--variation:setScanProbeCount(1)--variation:setMaxScanProbeCount(0)

--[[Bombardier Corsair]]
template = ShipTemplate():setName("Bombardier Corsair"):setClass("Chasseur", "Bombardier"):setModel("Eldar_Corsair_Bomber")
template:setRadarTrace("cruiser.png")
template:setDescription([[Chasseur stellaire de classe bombardier. Construit pour des frappes chirurgicales, son objectif principal est de rejoindre la cible, la detruire et de repartir avant d'etre detruit.]])
template:setHull(70)
template:setShields(30)
template:setSpeed(210, 35, 20)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, 0, 2000.0, 7.0, 50)
--                           
template:setSystemDamageHullThreshold(0.5)
--       Tubes
template:setTubes(2, 12.0)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 1)
template:setTubeSize(0,"Small")
template:setTubeSize(1,"Small")
template:setDefaultAI('fighter')


-- Autocanon : (rafale longue , degat faible)
--template:setCustomWeapon("HVLI", "AC", 3, 1200.0, "Kinetic", -1)
--template:setCustomWeaponMultiple("AC",4,1)
--template:setCustomWeaponColor("AC", 255, 51, 0)
--template:setCustomWeaponStorage("AC", 20)
--TG fusionmelta ( Nuke homing) 
template:setCustomWeapon("Nuke", "MELT", 2, 300.0, "Kinetic", -1)
template:setCustomWeaponColor("MELT", 29, 57, 84)
template:setCustomWeaponStorage("MELT", 12)
template:setWeaponStorage("EMP", 10)

--[[Bombardier Corsair Eagle]]
--variation = template:copy("Bombardier Corsair Eagle")
--variation:setLocaleName("Bombardier Corsair Eagle")
--variation:setModel("Eldar_Corsair_Bomber")
--variation:setDescription([[Chasseur stellaire de classe bombardier. Construit pour des frappes chirurgicales, son objectif principal est de rejoindre la cible, la detruire et de repartir avant d'etre detruit.]])
-- PJ
--variation:setCombatManeuver(600, 0)
--variation:setEnergyStorage(400)
--variation:setRepairCrewCount(1)
--variation:addRoomSystem(3, 0, 1, 1, "Maneuver");
--variation:addRoomSystem(1, 0, 2, 1, "BeamWeapons");
--variation:addRoomSystem(0, 1, 1, 2, "RearShield");
--variation:addRoomSystem(1, 1, 2, 2, "Reactor");
--variation:addRoomSystem(3, 1, 2, 1, "Warp");
--variation:addRoomSystem(3, 2, 2, 1, "JumpDrive");
--variation:addRoomSystem(5, 1, 1, 2, "FrontShield");
--variation:addRoomSystem(1, 3, 2, 1, "MissileSystem");
--variation:addRoomSystem(3, 3, 1, 1, "Impulse");
--variation:addDoor(2, 1, true);
--variation:addDoor(3, 1, true);
--variation:addDoor(1, 1, false);
--variation:addDoor(3, 1, false);
--variation:addDoor(3, 2, false);
--variation:addDoor(3, 3, true);
--variation:addDoor(2, 3, true);
--variation:addDoor(5, 1, false);
--variation:addDoor(5, 2, false);


--[[Chasseur Lourd]]
template = ShipTemplate():setName("Chasseur Lourd"):setClass("Chasseur", "Combat"):setModel("small_frigate_3")
template:setRadarTrace("fighter.png")
template:setDescription([[Ce chasseur stellaire est l'un des mieux proteges en service actif, ses deux lanceurs peuvent donner un coup de poing. Son objectif est de voler, detruire sa cible et repartir ou etre detruit.]])
template:setHull(80)
template:setShields(60)
template:setSpeed(140, 20, 25, 80, 15)
template:setDefaultAI('fighter')
--Preset retirer preset ? redurie cool, reduire efficacité energetique 
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 90, 1, 1500.0, 1.5, 5)
template:setBeam(1, 90, -1, 1500.0, 1.5, 5)
template:setCanHack(false)
--template:setScanProbeCount(1)--template:setMaxScanProbeCount(0)

--       Tubes
template:setTubes(2, 12.0)
template:setTubeDirection(0, 1)
template:setTubeDirection(1, -1)
template:setTubeSize(0,"Small")
template:setTubeSize(1,"Small")
template:setDockClasses("Drone")
-- Autocanon : (rafale longue , degat faible)
template:setCustomWeapon("HVLI", "AC", 8, 1200.0, "Kinetic", 25)
template:setCustomWeaponMultiple("AC",4,1)
template:setCustomWeaponColor("AC", 255, 51, 0)
template:setCustomWeaponStorage("AC", 40)

--[[Chasseur Lourd Mk2]]
variation = template:copy("Chasseur Lourd Mk2"):setType("playership")
variation:setLocaleName("Chasseur Lourd Mk2")
variation:setJumpDrive(true)
variation:setHull(100)
variation:setShields(60)
variation:setSpeed(150, 20, 25, 80, 15)
variation:setTubes(2, 12.0)
--MGAA Flakburst (nuke faible dommage) 
variation:setShortRangeRadarRange(7500)

--variation:setCustomWeapon("Nuke", "FLAK", 2, 800.0, "Kinetic", -1)
--variation:setCustomWeaponColor("FLAK", 220, 87, 20)
--variation:setCustomWeaponStorage("FLAK", 2)

variation:setCanHack(false)
variation:setDockClasses("Drone")
--variation:setScanProbeCount(6)
--variation:setMaxScanProbeCount(6)

variation:setCustomWeapon("Nuke", "SEEK XS", 2, 400.0, "Kinetic", 15)
variation:setCustomWeaponColor("SEEK XS", 255, 204, 0)
variation:setCustomWeaponStorage("SEEK XS", 2)


variation:setCustomWeapon("Homing", "SKYMK2", 4, 600.0, "Kinetic", -1)
variation:setCustomWeaponColor("SKYMK2", 255, 204, 0)
variation:setCustomWeaponStorage("SKYMK2", 8)

--variation:setCustomWeapon("Homing", "SKYR", 0.5, 500.0, "Kinetic", -1)
--variation:setCustomWeaponMultiple("SKYR",1,3)
--variation:setCustomWeaponColor("SKYR", 255, 204, 0)
--variation:setCustomWeaponStorage("SKYR", 3)
--Rajouter missile guidé
--                  Arc, Dir, Range, CycleTime, Dmg

--								  Arc, Dir, Rotate speed
-- PJ
variation:setCombatManeuver(500, 350)
variation:setEnergyStorage(400)
variation:setRepairCrewCount(2)
variation:addRoomSystem(0,0,1,3,"RearShield")
variation:addRoomSystem(1,1,3,1,"MissileSystem")
variation:addRoomSystem(4,1,2,1,"Beamweapons")
variation:addRoomSystem(3,2,2,1,"Reactor")
variation:addRoomSystem(2,3,2,1,"Warp")
variation:addRoomSystem(4,3,5,1,"JumpDrive")
variation:addRoomSystem(0,4,1,3,"Impulse")
variation:addRoomSystem(3,4,2,1,"Maneuver")
variation:addRoomSystem(1,5,3,1,"FrontShield")
variation:addRoom(4,5,2,1)
variation:addDoor(1,1,false)
variation:addDoor(1,5,false)
variation:addDoor(3,2,true)
variation:addDoor(4,2,true)
variation:addDoor(3,3,true)
variation:addDoor(4,3,true)
variation:addDoor(3,4,true)
variation:addDoor(4,4,true)
variation:addDoor(3,5,true)
variation:addDoor(4,5,true)




--[[Chasseur Lourd Mkx longue portée "inigo federation" ]]





--[[Chasseur Lourd Mkx longue portée "inigo federation" ]] 
template = ShipTemplate():setName("Chasseur Lourd MKX"):setClass("Experimental", "Combat"):setModel("small_frigate_3")
template:setRadarTrace("fighter.png")
template:setDescription([[ Chasseur lourd scapula lourdement modifiée par des technologies non impérial ]])
template:setHull(80)
template:setShields(200)
template:setSpeed(160, 20, 25, 80, 15)
template:setDefaultAI('fighter')
--Preset retirer preset ? redurie cool, reduire efficacité energetique 
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 90, 1, 1500.0, 1.5, 5)
template:setBeam(1, 90, -1, 1500.0, 1.5, 5)
template:setCanHack(false)
--template:setScanProbeCount(1)--template:setMaxScanProbeCount(0)

--       Tubes
template:setTubes(2, 12.0)
template:setTubeDirection(0, 1)
template:setTubeDirection(1, -1)
template:setTubeSize(0,"Small")
template:setTubeSize(1,"Small")
template:setDockClasses("Drone")
-- Autocanon : (rafale longue , degat faible)
template:setCustomWeapon("HVLI", "AC", 8, 1200.0, "Kinetic", 25)
template:setCustomWeaponMultiple("AC",4,1)
template:setCustomWeaponColor("AC", 255, 51, 0)
template:setCustomWeaponStorage("AC", 40)


template:setCustomWeapon("EMP", "MAGSEEK", 0.5, 400.0, "EMP", 30)
template:setCustomWeaponColor("MAGSEEK", 0, 204, 255)
template:setCustomWeaponStorage("MAGSEEK", 4)
template:setCustomWeaponMultiple("MAGSEEK",1,2)

--[[Chasseur Lourd MkX PJ ( federation) ]]

variation = template:copy("Chasseur Lourd MKX2"):setType("playership")
variation:setDescription([[Ce chasseur d'origine inconnu est basé sur le chasseur lourd imperial "SCAPULA" puis a été lourdement modifié, les capteurs indiquent des moteurs d'origine non standard ainsi qu'un moteur warp bien plus gourmand qu'un simple moteur de saut ]])

variation:setLocaleName("Chasseur Lourd MkX")
variation:setJumpDrive(true)
variation:setJumpDriveRange(5000.0, 1000000.0)
variation:setJumpDriveEnergy(0.1)
variation:setHull(100)
variation:setShields(120)
variation:setSpeed(150, 25, 25, 80, 15)
variation:setTubes(2, 12.0)
--MGAA Flakburst (nuke faible dommage) 
variation:setShortRangeRadarRange(7500)

--variation:setCustomWeapon("Nuke", "FLAK", 2, 800.0, "Kinetic", -1)
--variation:setCustomWeaponColor("FLAK", 220, 87, 20)
--variation:setCustomWeaponStorage("FLAK", 2)

variation:setCanHack(false)
variation:setDockClasses("Drone")
--variation:setScanProbeCount(6)
--variation:setMaxScanProbeCount(6)

variation:setCustomWeapon("Nuke", "SEEK XS", 2, 400.0, "Kinetic", 15)
variation:setCustomWeaponColor("SEEK XS", 255, 204, 0)
variation:setCustomWeaponStorage("SEEK XS", 2)


variation:setCustomWeapon("Homing", "SKYMK2", 4, 600.0, "Kinetic", -1)
variation:setCustomWeaponColor("SKYMK2", 255, 204, 0)
variation:setCustomWeaponStorage("SKYMK2", 4)


variation:setCustomWeapon("EMP", "MAGSEEK", 0.5, 400.0, "EMP", 30)
variation:setCustomWeaponColor("MAGSEEK", 0, 204, 255)
variation:setCustomWeaponStorage("MAGSEEK", 2)



--								  Arc, Dir, Rotate speed
-- PJ
variation:setCombatManeuver(500, 350)
variation:setEnergyStorage(400)
variation:setRepairCrewCount(2)
variation:addRoomSystem(0,0,1,3,"RearShield")
variation:addRoomSystem(1,1,3,1,"MissileSystem")
variation:addRoomSystem(4,1,2,1,"Beamweapons")
variation:addRoomSystem(3,2,2,1,"Reactor")
variation:addRoomSystem(2,3,2,1,"Warp")
variation:addRoomSystem(4,3,5,1,"JumpDrive")
variation:addRoomSystem(0,4,1,3,"Impulse")
variation:addRoomSystem(3,4,2,1,"Maneuver")
variation:addRoomSystem(1,5,3,1,"FrontShield")
variation:addRoom(4,5,2,1)
variation:addDoor(1,1,false)
variation:addDoor(1,5,false)
variation:addDoor(3,2,true)
variation:addDoor(4,2,true)
variation:addDoor(3,3,true)
variation:addDoor(4,3,true)
variation:addDoor(3,4,true)
variation:addDoor(4,4,true)
variation:addDoor(3,5,true)
variation:addDoor(4,5,true)


--[[Vaisseau d'abordage]]
template = ShipTemplate():setName("Vaisseau d'abordage"):setClass("Chasseur", "Abordage"):setModel("LindwurmFighterGrey")
template:setRadarTrace("fighter.png")
template:setDescription([[Un vaisseau simple qui a pour principal utilite d'aborder un autre et donner une chance de le capturer ou massacrer son equipage au choix.]])
template:setHull(65)
template:setShields(40)
template:setSpeed(140, 20, 25)
template:setDefaultAI('default')
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 100,0, 50.0, 1.0, 8)

--[[Vaisseau d'abordage Mk2]]
variation = template:copy("Vaisseau d'abordage Shark Mk2"):setType("playership")
variation:setLocaleName("Vaisseau d'abordage Shark Mk2")
variation:setModel("LindwurmFighterBlue")
-- PJ
variation:setCanHack(false)
--variation:setScanProbeCount(1)--variation:setMaxScanProbeCount(0)

variation:setShortRangeRadarRange(7500)


variation:setBeam(0, 120,0, 1500.0, 1.0, 4)
variation:setCombatManeuver(600, 0)
variation:setRepairCrewCount(1)
variation:addRoomSystem(3, 0, 1, 1, "Maneuver");
variation:addRoomSystem(1, 0, 2, 1, "BeamWeapons");
variation:addRoomSystem(0, 1, 1, 2, "RearShield");
variation:addRoomSystem(1, 1, 2, 2, "Reactor");
variation:addRoomSystem(3, 1, 2, 1, "Warp");
variation:addRoomSystem(3, 2, 2, 1, "JumpDrive");
variation:addRoomSystem(5, 1, 1, 2, "FrontShield");
variation:addRoomSystem(1, 3, 2, 1, "MissileSystem");
variation:addRoomSystem(3, 3, 1, 1, "Impulse");
variation:addDoor(2, 1, true);
variation:addDoor(3, 1, true);
variation:addDoor(1, 1, false);
variation:addDoor(3, 1, false);
variation:addDoor(3, 2, false);
variation:addDoor(3, 3, true);
variation:addDoor(2, 3, true);
variation:addDoor(5, 1, false);
variation:addDoor(5, 2, false);