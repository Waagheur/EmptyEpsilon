--[[                  Croiseurs legers
Rappel des catégories : 
Vaisseau leger : 1 à 3 places ; aucun moteur Warp ou Jump possible ; shipTemplates_VaisseauxLegers.lua ;
Frégate : 4 à 9 places ; shipTemplates_Fregates.lua ;
Destroyer : 10 à 50 places ; shipTemplates_Escorteurs.lua ;
Croiseur leger : 50 à 100 places ; shipTemplates_CroiseursLegers.lua ;
Croiseur : 100 à 250 places ; shipTemplates_Croiseurs.lua ;
Cuirassé : 250 à 500 places ; shipTemplates_Cuirasse.lua ;
Porte-Vaisseaux : plus de 500 places; shipTemplates_Capitaux.lua ;
Drones et Créatures : N.C ; shipTemplates_Autres.lua ;
Stations;

Le croiseur leger est un vaisseau d'attaque rapide qui sacrifie une partie de sa puissance au profit de la rapidité.
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


--[[Croiseur leger Dauntless]]
template = ShipTemplate():setName("Croiseur leger Dauntless"):setClass("Croiseur leger", "Combat"):setModel("Navy_Light_Cruiser"):setType("playership")

template:setRadarTrace("ktlitan_destroyer.png")
template:setDescription([[Le croiseur leger de classe Dauntless est le vaisseau emblematique de l'ensemble de la Flotte Imperiale, present dans tous les Segmentae Majoris.
Le Dauntless est un croiseur alliant la vitesse et la manoeuvrabilite d'une fregate a la puissance de feu superieure d'un croiseur.
Les vaisseaux de ce type sont reconnus et prises par tous les officiers de la Flotte car ils peuvent aussi bien patrouiller seuls sans soutien logistique pendant une longue duree que proteger les autres vaisseaux de lignes des escorteurs adverses.]])
template:setHull(1100)
template:setShields(400, 400)
template:setSpeed(90, 14, 12)
template:setSpeed(90, 14, 12, 45, 10)
template:setCombatManeuver(350, 250)

template:setLocaleName("Croiseur leger DauntlessMK2")


--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 10, 0, 10.0, 30.0, 10)
template:setBeam(1, 100, 90, 2000.0, 3, 9)
template:setBeam(2, 100,-90, 2000.0, 3, 9)
template:setBeam(3, 100, 90, 2000.0, 3, 9)
template:setBeam(4, 100,-90, 2000.0, 3, 9)
--                              Arc, Dir, Rotate speed


template:setCustomWeapon("HVLI", "MCANMK2", 3, 1500.0, "Kinetic", 25)
template:setCustomWeaponMultiple("MCANMK2",1,4)
template:setCustomWeaponColor("MCANMK2", 255, 150, 103)
template:setCustomWeaponStorage("MCANMK2", 120)

template:setCustomWeapon("Nuke", "SEEKMK2", 2, 200.0, "Kinetic", 60)
template:setCustomWeaponColor("SEEKMK2", 255, 204, 0)
template:setCustomWeaponStorage("SEEKMK2", 12)
template:setCustomWeaponMultiple("SEEKMK2",1,2)


--       Tubes
template:setTubes(5, 12.0)
template:setTubeDirection(0, 0):weaponTubeDisallowCustomMissile(0,"MCANMK2"):setWeaponTubeExclusiveForCustom(0,'SEEKMK2')
template:setTubeSize(0, "small")
template:setTubeLoadTime(0, 45)
template:setTubeLoadTime(5, 45)
template:setTubeDirection(1, 90)
template:setTubeDirection(2, -90)
template:setTubeDirection(3, 90)
template:setTubeDirection(4, -90)
template:setTubeDirection(5, 1):weaponTubeDisallowCustomMissile(5,"MCANMK2"):setWeaponTubeExclusiveForCustom(5,'SEEKMK2')
template:setTubeSize(5, "small")

--Macro-canon : (rafale, non homing) 


--TG Seeker (homing) 




--DockClasses
template:setDockClasses("Drone","Vaisseau leger")
template:setDefaultAI('default')

template:setCanHack(false)

-- PJ
template:setJumpDrive(true)
template:setCombatManeuver(250, 150)
template:setRepairCrewCount(8)
template:addRoom(1, 0, 6, 1)
template:addRoom(1, 5, 6, 1)
template:addRoomSystem(0, 1, 2, 2, "RearShield")
template:addRoomSystem(0, 3, 2, 2, "MissileSystem")
template:addRoomSystem(2, 1, 2, 2, "Beamweapons")
template:addRoomSystem(2, 3, 2, 2, "Reactor")
template:addRoomSystem(4, 1, 2, 2, "Warp")
template:addRoomSystem(4, 3, 2, 2, "JumpDrive")
template:addRoomSystem(6, 1, 2, 2, "Impulse")
template:addRoomSystem(6, 3, 2, 2, "Maneuver")
template:addRoomSystem(8, 2, 2, 2, "FrontShield")
template:addDoor(1, 1, true)
template:addDoor(3, 1, true)
template:addDoor(4, 1, true)
template:addDoor(6, 1, true)
template:addDoor(4, 3, true)
template:addDoor(5, 3, true)
template:addDoor(8, 2, false)
template:addDoor(8, 3, false)
template:addDoor(1, 5, true)
template:addDoor(2, 5, true)
template:addDoor(5, 5, true)
template:addDoor(6, 5, true)




--[[Croiseur leger Imperial Dauntless]]
template = ShipTemplate():setName("Croiseur leger Dauntless MK1"):setClass("Croiseur leger", "Combat"):setModel("Navy_Light_Cruiser")

template:setRadarTrace("ktlitan_destroyer.png")
template:setDescription([[Le croiseur leger de classe Dauntless est le vaisseau emblematique de l'ensemble de la Flotte Imperiale, present dans tous les Segmentae Majoris.
Le Dauntless est un croiseur alliant la vitesse et la manoeuvrabilite d'une fregate a la puissance de feu superieure d'un croiseur.
Les vaisseaux de ce type sont reconnus et prises par tous les officiers de la Flotte car ils peuvent aussi bien patrouiller seuls sans soutien logistique pendant une longue duree que proteger les autres vaisseaux de lignes des escorteurs adverses.]])
template:setHull(1100)
template:setShields(400, 400)
template:setSpeed(90, 10, 12)
--template:setReverseSpeed(40,10)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 10, 0, 10.0, 30.0, 150)
template:setBeam(1, 100, 90, 2000.0, 3, 9)
template:setBeam(2, 100,-90, 2000.0, 3, 9)
template:setBeam(3, 100, 90, 2000.0, 3, 9)
template:setBeam(4, 100,-90, 2000.0, 3, 9)
--                              Arc, Dir, Rotate speed

template:setCustomWeapon("HVLI", "MCANMK2", 3, 1500.0, "Kinetic", 25)
template:setCustomWeaponMultiple("MCANMK2",1,4)
template:setCustomWeaponColor("MCANMK2", 255, 150, 103)
template:setCustomWeaponStorage("MCANMK2", 120)

template:setCustomWeapon("Nuke", "SEEKMK2", 2, 200.0, "Kinetic", 60)
template:setCustomWeaponColor("SEEKMK2", 255, 204, 0)
template:setCustomWeaponStorage("SEEKMK2", 12)
template:setCustomWeaponMultiple("SEEKMK2",1,2)

--       Tubes
template:setTubes(5, 12.0)
template:setTubeDirection(0, 0):weaponTubeDisallowCustomMissile(0,"MCANMK2"):setWeaponTubeExclusiveForCustom(0,'SEEKMK2')
template:setTubeSize(0, "small")
template:setTubeLoadTime(0, 45)
template:setTubeLoadTime(5, 45)
template:setTubeDirection(1, 90)
template:setTubeDirection(2, -90)
template:setTubeDirection(3, 90)
template:setTubeDirection(4, -90)
template:setTubeDirection(5, 1):weaponTubeDisallowCustomMissile(5,"MCANMK2"):setWeaponTubeExclusiveForCustom(5,'SEEKMK2')
template:setTubeSize(5, "small")
template:setShortRangeRadarRange(7500)
--Macro-canon : (rafale, non homing) 


--TG Seeker (homing) 




--DockClasses
template:setDockClasses("Drone","Vaisseau leger")
template:setDefaultAI('default')
template:setCanHack(false)

--DockClasses
template:setDockClasses("Drone","Vaisseau leger")


--[[Croiseur leger Corsaire]]
template = ShipTemplate():setName("Croiseur leger Corsaire"):setClass("Croiseur leger", "Combat"):setModel("Eldar_Corsair_Light_Cruiser")
template:setRadarTrace("ktlitan_destroyer.png")
template:setDescription([[Le Croiseur leger Corsair est le plus grand des vaisseaux qui composent generalement les flottes des Eldars. Comme beaucoup de vaisseaux Xenos, le Croiseur leger Corsair est souvent confondu avec d'autres classes de croiseur et de nombreuses attaques sont ainsi attribuees faussement a leurs cousins Eldars.
Certains enregistrements pretent aux Croiseur leger Corsair des similitudes avec les classes Eclipse et Shadow alors que d'autres experts xenologues les considerent comme des amalgames de diverses classes. Les nombreux rapports contradictoires qui concernent le croiseur en font un appareil difficile a classer pour l'Imperium. Certains recits rapportent meme des combats entre vaisseaux Eldars, ce qui ajoute encore plus de confusion aux effort de categorisation imperiale.]])
template:setHull(700)
template:setShields(350, 250)
template:setSpeed(160, 25, 22)
--template:setReverseSpeed(40,10)
--                  Arc, Dir, Range, CycleTime, Dmg

template:setBeam(0, 10, 0, 4500.0, 30.0, 250)
template:setBeam(1, 45, 0, 4000.0, 14.0, 35)
template:setBeam(2, 45, 0, 4000.0, 14.0, 35)
template:setBeam(3, 90, 90, 3000.0, 3, 12)
template:setBeam(4, 90,-90, 3000.0, 3, 12)
--                              Arc, Dir, Rotate speed

--       Tubes
template:setTubes(5, 12.0)
template:setTubeDirection(0, 0):weaponTubeDisallowCustomMissile(0,"MCANMK2")
template:setTubeSize(0, "small")
template:setTubeDirection(1, 1):weaponTubeDisallowCustomMissile(1,"MCANMK2")
template:setTubeSize(1, "small")
template:setTubeDirection(2, -1):weaponTubeDisallowCustomMissile(2,"MCANMK2")
template:setTubeSize(2, "small")
template:setTubeLoadTime(0, 45)
template:setTubeLoadTime(1, 45)
template:setTubeLoadTime(2, 45)
template:setTubeDirection(3, 90)
template:setTubeDirection(4, -90)
--Macro-canon : (rafale, non homing) 
template:setCustomWeapon("HVLI", "MCANMK2", 3, 1500.0, "Kinetic", 25)
template:setCustomWeaponMultiple("MCANMK2",1,4)
template:setCustomWeaponColor("MCANMK2", 255, 150, 103)
template:setCustomWeaponStorage("MCANMK2", 120)
--TG Seeker (homing) 
template:setCustomWeapon("Homing", "SEEK", 1.5, 1200.0, "EMP", 3)
template:setCustomWeaponColor("SEEK", 0, 204, 204)
template:setCustomWeaponStorage("SEEK", 24)
template:setCustomWeaponMultiple("SEEK",2,2)
--MGAA Flakburst (nuke faible dommage) 
template:setCustomWeapon("Nuke", "SEEKMK2", 2, 200.0, "Kinetic", 60)
template:setCustomWeaponColor("SEEKMK2", 0, 204, 204)
template:setCustomWeaponStorage("SEEKMK2", 12)
template:setCustomWeaponMultiple("SEEKMK2",1,2)
template:setWeaponStorage("EMP", 10)

template:setDefaultAI('fighter')

--DockClasses
template:setDockClasses("Drone","Vaisseau leger","Fregate","destroyer")
template:setCanHack(false)


--[[Croiseur leger du chaos Hellbringer MkII]]
template = ShipTemplate():setName("Croiseur leger du chaos Hellbringer Mk2 "):setClass("Croiseur leger", "Combat"):setModel("Chaos_Light_Cruiser")
template:setRadarTrace("ktlitan_destroyer.png")
template:setDescription([[Le Croiseur Hellbringer est un vaisseau de ligne lèger caracterise par sa capacite a atteindre des vitesses importantes, rivalisant avec celles des escorteurs plus petits voire meme des vaisseaux Eldars.
Cette vitesse exceptionnelle pour un vaisseau de ce tonnage est obtenue grace a des moteurs utilisant des Bobines de Scartix, une Archeo-Technologie uniquement connue du Monde Forge de Sethelan.
Cette specificite se revela etre le point faible de la strategie imperiale de production de croiseur Hellbringer lorsque l'un d'entre eux, le Dutiful se rebella et bombarda les installations de Sethelan, provoquant la perte des plans des Bobines Scartix.]])
template:setHull(1200)
template:setShields(400, 400)
template:setSpeed(100, 12, 20, 50, 10)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30, 0, 4500.0, 30.0, 150)
template:setBeam(1, 100, 90, 4500.0, 14.0, 25)
template:setBeam(2, 100, -90, 4500.0, 14.0, 25)
template:setBeam(3, 100, 90, 3000.0, 3, 12)
template:setBeam(4, 100,-90, 3000.0, 3, 12)
--                              Arc, Dir, Rotate speed

--       Tubes
template:setTubes(4, 12.0)
template:setTubeDirection(0, 90)
template:setTubeDirection(1, -90)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
--MGAA Skyreaper (homing trés rapide) fregrate et plus
template:setCustomWeapon("HVLI", "MCANMK2", 3, 1500.0, "Kinetic", 25)
template:setCustomWeaponMultiple("MCANMK2",1,4)
template:setCustomWeaponColor("MCANMK2", 255, 150, 103)
template:setCustomWeaponStorage("MCANMK2", 120)

--DockClasses
template:setDockClasses("Drone","Vaisseau leger")
template:setDefaultAI('default')
template:setShortRangeRadarRange(7500)
template:setCanHack(false)
--[Croiseur leger Slaughter]]
variation = template:copy("Croiseur leger Hellbringer"):setType("playership")
variation:setLocaleName("Croiseur leger Hellbringer")




-- PJ

--variation:setWarpSpeed(500)
variation:setShields(400, 400)
variation:setCombatManeuver(400, 200)
variation:setJumpDrive(true)
variation:setRepairCrewCount(8)
variation:addRoom(1, 0, 6, 1)
variation:addRoom(1, 5, 6, 1)
variation:addRoomSystem(0, 1, 2, 2, "RearShield")
variation:addRoomSystem(0, 3, 2, 2, "MissileSystem")
variation:addRoomSystem(2, 1, 2, 2, "Beamweapons")
variation:addRoomSystem(2, 3, 2, 2, "Reactor")
variation:addRoomSystem(4, 1, 2, 2, "Warp")
variation:addRoomSystem(4, 3, 2, 2, "JumpDrive")
variation:addRoomSystem(6, 1, 2, 2, "Impulse")
variation:addRoomSystem(6, 3, 2, 2, "Maneuver")
variation:addRoomSystem(8, 2, 2, 2, "FrontShield")
variation:addDoor(1, 1, true)
variation:addDoor(3, 1, true)
variation:addDoor(4, 1, true)
variation:addDoor(6, 1, true)
variation:addDoor(4, 3, true)
variation:addDoor(5, 3, true)
variation:addDoor(8, 2, false)
variation:addDoor(8, 3, false)
variation:addDoor(1, 5, true)
variation:addDoor(2, 5, true)
variation:addDoor(5, 5, true)
variation:addDoor(6, 5, true)

variation:setShortRangeRadarRange(7500)
variation:setJumpDrive(true)
variation:setCanHack(false)
variation:addDrones("Chasseur Lourd Mk2",2)
variation:addDrones("Vaisseau d'abordage Shark Mk2",1)
variation:addDrones("Intercepteur Fury",6)
variation:addDrones("Bombardier Starhawk",2)
variation:setDocks(3, 0, 0, 0, 4, 4)