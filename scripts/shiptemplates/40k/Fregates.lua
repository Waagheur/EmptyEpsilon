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

Les frégates sont à une taille au-dessus des chasseurs stellaires.
Ils ont généralement 2 sections de bouclier ou plus, mais rarement plus de 4.

Cette classe de navires n'est normalement pas équipée de commandes de saut ou de chaîne. Mais dans certains cas, les navires sont modifiés pour les inclure, ou pour certains rôles dans lesquels il est intégré.

Ils sont divisés en sous-classes différentes:
* Combat: frégates armées, axées sur le combat. Ceux-ci viennent dans différents rôles.
* Transport léger: Petits transports, comme transporter jusqu'à 50 soldats dans des conditions spartiates ou quelques diplomates dans le luxe. Selon le rôle peut avoir des armes.
* Support: Les types de support sont disponibles dans de nombreuses variantes. Ils sont simplement une coque de frégate équipée de tout ce qui était nécessaire. Tout, des couches de mines aux navires scientifiques.
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


--[[Frégate Imperial Sword]]
template = ShipTemplate():setName("Fregate Imperial Sword"):setClass("Fregate", "Combat"):setModel("Navy_Frigate")
template:setDescription([[Les fregates de classe Sword sont des vaisseaux dont la conception remonte a des milliers d'annee et qui servent la Flotte Imperiale depuis lors sans faillir.
Les nombreux conflits auxquels les fregates Sword prirent part permirent de valider l'ensemble des composantes de ce type de vaisseau.]])
template:setHull(700)
template:setShields(250, 250)
template:setSpeed(95, 12, 15)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 100, 90, 2000.0, 3, 9)
template:setBeam(1, 100,-90, 2000.0, 3, 9)
--                                Arc, Dir, Rotate speed
--       Tubes
template:setTubes(3, 12.0)

template:setCustomWeapon("HVLI", "MCANMK2", 3, 1500.0, "Kinetic", 25)
template:setCustomWeaponMultiple("MCANMK2",1,4)
template:setCustomWeaponColor("MCANMK2", 255, 150, 103)
template:setCustomWeaponStorage("MCANMK2", 120)


template:setCustomWeapon("Nuke", "SEEKMK2", 2, 200.0, "Kinetic", 60)
template:setCustomWeaponColor("SEEKMK2", 255, 204, 0)
template:setCustomWeaponStorage("SEEKMK2", 16)
template:setCustomWeaponMultiple("SEEKMK2",1,2)

template:setCustomWeapon("EMP", "MAGSEEK", 0.5, 200.0, "EMP", 60)
template:setCustomWeaponColor("MAGSEEK", 0, 204, 255)
template:setCustomWeaponStorage("MAGSEEK", 2)
template:setCustomWeaponMultiple("MAGSEEK",1,2)

--template:setCustomWeapon("HVLI", "MAGMCAN", 1, 1000.0, "EMP", 25)
--template:setCustomWeaponMultiple("MAGMCAN",1,3)
--template:setCustomWeaponColor("MAGMCAN", 51, 51, 255)
--template:setCustomWeaponStorage("MAGMCAN", 6)

template:setTubeDirection(0, 0):weaponTubeDisallowCustomMissile(0,"MCANMK2"):weaponTubeDisallowCustomMissile(0,"MAGMCAN")
template:setTubeSize(0, "small")
template:setTubeLoadTime(0, 45)



template:setTubeDirection(1, 90):weaponTubeDisallowCustomMissile(1,"SEEKMK2"):weaponTubeDisallowCustomMissile(1,"MAGSEEK")
template:setTubeDirection(2, -90):weaponTubeDisallowCustomMissile(2,"SEEKMK2"):weaponTubeDisallowCustomMissile(2,"MAGSEEK")
template:setShortRangeRadarRange(7500)




--Macro-canon : (rafale, non homing) 


--TG Seeker ( homing) 




-- Torpille EMP 


template:setDefaultAI('default')

--DockClasses
template:setDockClasses("Drone","Vaisseau leger")


--[[Frégate sword jouable]]
variation = template:copy("Fregate sword"):setType("playership"):setModel("Navy_Frigate")
variation:setLocaleName("Fregate sword")
variation:setHull(700)
variation:setShields(350, 350)
variation:setSpeed(95, 14, 12, 50, 10)

--                  Arc, Dir, Range, CycleTime, Dmg

variation:setCustomWeapon("EMP", "MAGSEEK", 2, 400.0, "EMP", 60)
variation:setCustomWeaponColor("MAGSEEK", 0, 204, 255)
variation:setCustomWeaponStorage("MAGSEEK", 6)
variation:setCustomWeaponMultiple("MAGSEEK",1,2)

variation:setCustomWeapon("HVLI", "MAGMCAN", 1, 1000.0, "EMP", 25)
variation:setCustomWeaponMultiple("MAGMCAN",1,3)
variation:setCustomWeaponColor("MAGMCAN", 51, 51, 255)
variation:setCustomWeaponStorage("MAGMCAN", 6)

variation:setTubeDirection(0, 0):weaponTubeDisallowCustomMissile(0,"MCANMK2"):weaponTubeDisallowCustomMissile(0,"MAGMCAN")
variation:setTubeSize(0, "small")
variation:setTubeLoadTime(0, 45)


variation:setTubeDirection(1, 90):weaponTubeDisallowCustomMissile(1,"SEEKMK2"):weaponTubeDisallowCustomMissile(1,"MAGSEEK")
variation:setTubeDirection(2, -90):weaponTubeDisallowCustomMissile(2,"SEEKMK2"):weaponTubeDisallowCustomMissile(2,"MAGSEEK")
variation:setShortRangeRadarRange(7500)
variation:setJumpDrive(true)
variation:setCanHack(false)

--Macro-canon : (rafale, non homing) 

-- disallow missile à rajouter ? )
variation:setCustomWeapon("HVLI", "MCANMK2", 3, 1500.0, "Kinetic", 25)
variation:setCustomWeaponMultiple("MCANMK2",1,4)
variation:setCustomWeaponColor("MCANMK2", 255, 150, 103)
--variation:setCustomWeaponStorage("MCANMK2", 120)
variation:setCustomWeaponStorage("MCANMK2", 900)

variation:setCustomWeapon("Nuke", "SEEKMK2", 2, 200.0, "Kinetic", 60)
variation:setCustomWeaponColor("SEEKMK2", 255, 204, 0)
variation:setCustomWeaponStorage("SEEKMK2", 16)
variation:setCustomWeaponMultiple("SEEKMK2",1,2)
--TG Seeker ( homing) 
-- Torpille EMP 

variation:setShortRangeRadarRange(7500)

--hangar
--ShipTemplate:setDocks(int launchers, int energy, int weapons, int thermic, int repair, int stock)

variation:addDrones("Chasseur Lourd Mk2",3)
variation:addDrones("Vaisseau d'abordage Shark Mk2",1)
variation:setDocks(3, 0, 0, 0, 3, 1)

-- PJ


variation:setCombatManeuver(500, 350)
variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);
variation:addRoomSystem(0, 3, 1, 2, "RearShield");
variation:addRoomSystem(1, 3, 2, 2, "Reactor");
variation:addRoomSystem(3, 3, 2, 2, "Warp");
variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
variation:addRoom(6, 3, 2, 1);
variation:addRoom(6, 4, 2, 1);
variation:addRoomSystem(8, 3, 1, 2, "FrontShield");
variation:addRoom(2, 5, 2, 1);
variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
variation:addRoomSystem(1, 7, 2, 1, "Impulse");
variation:addDoor(1, 1, true);
variation:addDoor(2, 2, true);
variation:addDoor(3, 3, true);
variation:addDoor(1, 3, false);
variation:addDoor(3, 4, false);
variation:addDoor(3, 5, true);
variation:addDoor(2, 6, true);
variation:addDoor(1, 7, true);
variation:addDoor(5, 3, false);
variation:addDoor(6, 3, false);
variation:addDoor(6, 4, false);
variation:addDoor(8, 3, false);
variation:addDoor(8, 4, false); 

--[[Frégate Imperial Firestorm]]





template = ShipTemplate():setName("Fregate Imperial Firestorm"):setClass("Fregate", "soutien"):setModel("Navy_Frigate")
template:setLocaleName("Fregate Imperial Firestorm")
template:setDescription([[La fregate de classe Firestorm est une variante recente de la Fregate Sword destine a associer la rapidite de manœuvre de l'escorteur a la puissance de feu superieure d'une Piece d'artillerie navale.
La fregate Sword fut donc modifiee pour pouvoir diriger une partie du flux laser du vaisseau vers le canon imposant monte sous sa proue.]])
template:setHull(700)
template:setShields(200, 200)
template:setSpeed(95, 12, 15)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(2,30, 0, 5000.0, 40.0, 200)
template:setBeam(0, 100, 90, 2000.0, 3, 9)
template:setBeam(1, 100,-90, 2000.0, 3, 9)
template:setTubes(2, 12.0)
template:setTubeDirection(0, 90)
template:setTubeDirection(1, -90)

template:setCustomWeapon("HVLI", "MCANMK2", 3, 1500.0, "Kinetic", 25)
template:setCustomWeaponMultiple("MCANMK2",1,4)
template:setCustomWeaponColor("MCANMK2", 255, 150, 103)
template:setCustomWeaponStorage("MCANMK2", 120)


--template:setCustomWeapon("HVLI", "MAGMCAN", 1, 1000.0, "EMP", 25)
--template:setCustomWeaponMultiple("MAGMCAN",1,3)
--template:setCustomWeaponColor("MAGMCAN", 51, 51, 255)
--template:setCustomWeaponStorage("MAGMCAN", 6)


template:setDefaultAI('default')
--[[Frégate Firestorm]]
variation = template:copy("Fregate Firestorm"):setType("playership")
variation:setLocaleName("Fregate Firestorm")
variation:setHull(700)
variation:setShields(350,350)
variation:setSpeed(95, 12, 15)
variation:setSpeed(95, 12, 12, 55, 10)
--                  Arc, Dir, Range, CycleTime, Dmg
variation:setBeam(2,10, 0, 5000.0, 40.0, 200)

variation:setCustomWeapon("HVLI", "MCANMK2", 3, 1500.0, "Kinetic", 25)
variation:setCustomWeaponMultiple("MCANMK2",1,4)
variation:setCustomWeaponColor("MCANMK2", 255, 150, 103)
--variation:setCustomWeaponStorage("MCANMK2", 120)
variation:setCustomWeaponStorage("MCANMK2", 900)

-- PJ
variation:setCombatManeuver(500, 350)
variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);
variation:addRoomSystem(0, 3, 1, 2, "RearShield");
variation:addRoomSystem(1, 3, 2, 2, "Reactor");
variation:addRoomSystem(3, 3, 2, 2, "Warp");
variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
variation:addRoom(6, 3, 2, 1);
variation:addRoom(6, 4, 2, 1);
variation:addRoomSystem(8, 3, 1, 2, "FrontShield");
variation:addRoom(2, 5, 2, 1);
variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
variation:addRoomSystem(1, 7, 2, 1, "Impulse");
variation:addDoor(1, 1, true);
variation:addDoor(2, 2, true);
variation:addDoor(3, 3, true);
variation:addDoor(1, 3, false);
variation:addDoor(3, 4, false);
variation:addDoor(3, 5, true);
variation:addDoor(2, 6, true);
variation:addDoor(1, 7, true);
variation:addDoor(5, 3, false);
variation:addDoor(6, 3, false);
variation:addDoor(6, 4, false);
variation:addDoor(8, 3, false);
variation:addDoor(8, 4, false); 
--Airlock doors
--variation:addDoor(2, 2, false);
--variation:addDoor(2, 5, false);
variation:setShortRangeRadarRange(7500)
variation:setJumpDrive(true)
variation:setCanHack(false)
variation:addDrones("Chasseur Lourd Mk2",3)
variation:addDrones("Vaisseau d'abordage Shark Mk2",1)
variation:setDocks(3, 0, 0, 0, 3, 1)






--[[Transport Leger Civil]]
template = ShipTemplate():setName("Transport Leger Civil"):setClass("Fregate", "Transport Leger"):setModel("Civilian_Transport_Ship")
template:setRadarTrace("tug.png")
template:setDescription([[Ce transport leger civil est fait de bric et de broc, souvent utilise par les marchands au portefeuille leger. Il est trés courant et utilisé par toutes les factions de la galaxie]])
template:setHull(600)
template:setShields(100, 100)
template:setSpeed(95, 10, 12)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 100, 90, 2000.0, 3, 9)
template:setBeam(1, 100, -90, 2000.0, 3, 9)
--       Tubes
template:setTubes(2, 12.0)
template:setTubeDirection(0, 90)
template:setTubeDirection(1, -90)
--Macro-canon : (rafale, non homing) 
template:setCustomWeapon("HVLI", "MCANMK2", 3, 1500.0, "Kinetic", 25)
template:setCustomWeaponMultiple("MCANMK2",1,4)
template:setCustomWeaponColor("MCANMK2", 255, 150, 103)
template:setCustomWeaponStorage("MCANMK2", 120)

template:setDefaultAI('evasion')

--DockClasses
template:setDockClasses("Drone")
