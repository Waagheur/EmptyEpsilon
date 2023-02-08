--[[                  Cuirassé
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

Le cuirassé est un vaisseau très lourdement blindé, disposant d'une puissance de feu énorme, essentiellement contre les unités lourdes.
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


--[[cuirasse Imperial Emperor]]
template = ShipTemplate():setName("cuirasse Imperial Emperor"):setClass("Cuirasse", "Alpha"):setModel("Navy_Battleship")
template:setRadarTrace("battleship.png")
template:setDescription([[Le cuirasse de classe Emperor est l'un des plus anciens modeles de vaisseaux en service au sein de la Flotte Imperiale.
A la fois vaisseau de ligne et veritable base de lancement pour des nuees d'appareils d'attaque, le cuirasse Emperor apportent la puissance de feu de ces nombreuses Batteries d'armes et le soutien de ses chasseurs Fury, de ses bombardiers Starhawk ou de ses appareils de debarquement Shark aux flottes imperiales au sein desquelles il est integre]])
template:setJumpDrive(true)
template:setJumpDrive(5000.0, 6000.0)
template:setHull(3500)
template:setShields(1500, 1500, 1500)
template:setSpeed(65, 9, 8)
template:setSystemDamageRatio(0.8)
template:setSystemDamageHullThreshold(0.70)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 90, 0, 100.0, 30.0, 10)
template:setBeam(1, 90, 90, 3000.0, 14.0, 35)
template:setBeam(2, 90, -90, 3000.0, 14.0, 35)
template:setBeam(3, 90, 90, 3000.0, 14.0, 35)
template:setBeam(4, 90, -90, 3000.0, 14.0, 35)
template:setBeam(5, 90, 90, 2000.0, 3, 9)
template:setBeam(6, 90,-90, 2000.0, 3, 9)
template:setBeam(7, 90, 90, 2000.0, 3, 9)
template:setBeam(8, 90,-90, 2000.0, 3, 9)

template:setBeamWeaponTurret(1, 100,  90, 5)
template:setBeamWeaponTurret(2, 100, -90, 5)
template:setBeamWeaponTurret(3, 150,  90, 5)
template:setBeamWeaponTurret(4, 150, -90, 5)
template:setBeamWeaponTurret(5, 150,  90, 5)
template:setBeamWeaponTurret(6, 150, -90, 5)
template:setBeamWeaponTurret(7, 150,  90, 5)
template:setBeamWeaponTurret(8, 150, -90, 5)
template:setSystemDamageRatio(0.8)
template:setSystemDamageHullThreshold(0.70)

--                              Arc, Dir, Rotate speed
--
--TG Seeker (homing) 
template:setCustomWeapon("Nuke", "SEEKMK2", 2, 200.0, "Kinetic", 60)
template:setCustomWeaponColor("SEEKMK2", 255, 204, 0)
template:setCustomWeaponStorage("SEEKMK2", 26)
template:setCustomWeaponMultiple("SEEKMK2",1,2)

--Macro-canon : (rafale, non homing) --:weaponTubeDisallowCustomMissile(1,"MCANMK3")
template:setCustomWeapon("HVLI", "MCANMK3", 4, 1500.0, "Kinetic", 25)
template:setCustomWeaponMultiple("MCANMK3",1,4)
template:setCustomWeaponColor("MCANMK3", 255, 150, 103)
template:setCustomWeaponStorage("MCANMK3", 120)
--       Tubes
template:setTubes(10, 12.0)
template:setTubeDirection(0, 90)
template:setTubeSize(0, "small")
template:setTubeDirection(1, -90)
template:setTubeSize(1, "small")
template:setTubeLoadTime(0, 45)
template:setTubeLoadTime(1, 45)
template:setTubeDirection(2, 90):weaponTubeDisallowCustomMissile(2,"SEEKMK2")
template:setTubeDirection(3, -90):weaponTubeDisallowCustomMissile(3,"SEEKMK2")
template:setTubeDirection(4, 90):weaponTubeDisallowCustomMissile(4,"SEEKMK2")
template:setTubeDirection(5, -90):weaponTubeDisallowCustomMissile(5,"SEEKMK2")
template:setTubeDirection(6, 90):weaponTubeDisallowCustomMissile(6,"SEEKMK2")
template:setTubeDirection(7, -90):weaponTubeDisallowCustomMissile(7,"SEEKMK2")
template:setTubeDirection(8, 90):weaponTubeDisallowCustomMissile(8,"SEEKMK2")
template:setTubeDirection(9, -90):weaponTubeDisallowCustomMissile(9,"SEEKMK2")
template:setTubeDirection(10, 0):setWeaponTubeExclusiveForCustom(10,'MCANMK3')
template:setTubeSize(10, "small")
template:setTubeLoadTime(10, 45)

--DockClasses
template:setDockClasses("Drone","Vaisseau leger","Fregate","Destroyer","Croiseur")
template:setDefaultAI('missilevolley')
template:setCanHack(false)



--[[Cuirassé du Chaos Despoiler]]
template = ShipTemplate():setName("Cuirasse du Chaos Despoiler"):setClass("Cuirasse", "Alpha"):setModel("Chaos_Heavy_Carrier")
template:setRadarTrace("battleship.png")
template:setDescription([[Le cuirasse de classe Despoiler fut cree dans le Segmentum Tempestus.Equipe de nombreux Ponts de lancement ainsi que de Batteries d'armes et de Pieces d'artillerie navale a longue portee, le Despoiler fut concu pour affronter tout type de menace.
Le developpement du Despoiler se revela un echec, ce dernier ne surclassant pas les autres classes de cuirasses employees dans la Flotte. De plus a l'insu de tous, les plans du Despoiler retrouves par le Mechanicum recelaient un defaut cache dans la conception des Boucliers Warp de ces vaisseaux, les rendant vulnerables aux influences du Chaos.]])
template:setJumpDrive(true)
template:setJumpDrive(5000.0, 6000.0)
template:setHull(3400)
template:setShields(1400, 1400, 1400)
template:setSpeed(65, 9, 8)
template:setSystemDamageRatio(0.8)
template:setSystemDamageHullThreshold(0.70)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 45, 0, 100.0, 30.0, 10)
template:setBeam(1, 90, 90, 4500.0, 14.0, 35)
template:setBeam(2, 90, -90, 4500.0, 14.0, 35)
template:setBeam(3, 90, 90, 4500.0, 14.0, 35)
template:setBeam(4, 90, -90, 4500.0, 14.0, 25)
template:setBeam(5, 90, 90, 3000.0, 3, 9)
template:setBeam(6, 90,-90, 3000.0, 3, 9)
template:setBeam(7, 90, 90, 3000.0, 3, 9)
template:setBeam(8, 90,-90, 3000.0, 3, 9)
--                              Arc, Dir, Rotate speed
template:setBeamWeaponTurret(1, 100,  90, 5)
template:setBeamWeaponTurret(2, 100, -90, 5)
template:setBeamWeaponTurret(3, 150,  90, 5)
template:setBeamWeaponTurret(4, 150, -90, 5)
template:setBeamWeaponTurret(5, 150,  90, 5)
template:setBeamWeaponTurret(6, 150, -90, 5)
template:setBeamWeaponTurret(7, 150,  90, 5)
template:setBeamWeaponTurret(8, 150, -90, 5)
template:setSystemDamageRatio(0.8)
template:setSystemDamageHullThreshold(0.70)
--       Tubes
template:setTubes(10, 12.0)
template:setTubeDirection(0, 90)
template:setTubeDirection(1, -90)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setTubeDirection(6, 90)
template:setTubeDirection(7, -90)
template:setTubeDirection(8, 90)
template:setTubeDirection(9, -90)
--TG Seeker (homing) 
template:setCustomWeapon("homing", "chaosM", 2, 1400.0, "Kinetic", 30)
template:setCustomWeaponColor("chaosM", 255, 51, 51)
template:setCustomWeaponStorage("chaosM", 36)
template:setCustomWeaponMultiple("chaosM",4,1)
--MGAA Skyreaper (homing trés rapide) fregrate et plus
template:setCustomWeapon("HVLI", "MCANMK3", 4, 1500.0, "Kinetic", 25)
template:setCustomWeaponMultiple("MCANMK3",1,4)
template:setCustomWeaponColor("MCANMK3", 255, 150, 103)
template:setCustomWeaponStorage("MCANMK3", 120)
--template:setDefaultAI('default')
template:setDefaultAI('missilevolley')
template:setCanHack(false)

--DockClasses
template:setDockClasses("Drone","Vaisseau leger","Fregate","Destroyer","Croiseur")


--[[Arche Mechanicus]]
--Armement à refaire 
template = ShipTemplate():setName("Arche Mechanicus"):setClass("Vaisseau-Mere", "Alpha"):setModel("Adeptus_Mechanicus_Battleship")
template:setRadarTrace("battleship.png")
template:setDescription([[Les Arches, comme beaucoup d'autre vaisseau du mechanicum, echappent a une reel classification vis-a-vis de leur tonnage meme si elles sont consideres comme des cuirasse. Elle sont dirige par un Explorateur Archimagos Venere. Ces Arche ont pour mission de suivre n'importe quelle piste qui pourrait les amener a des SCS.]])
template:setJumpDrive(true)
template:setJumpDrive(5000.0, 6000.0)
template:setHull(2500)
template:setShields(1000, 1000, 1000)
template:setSpeed(75, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 90, 0, 100.0, 30.0, 350)
template:setBeam(1, 90, 90, 2000.0, 14.0, 25)
template:setBeam(2, 90, -90, 2000.0, 14.0, 25)
template:setBeam(3, 90, 90, 2000.0, 14.0, 25)
template:setBeam(4, 90, -90, 2000.0, 14.0, 25)
template:setBeam(5, 90, 90, 2000.0, 3, 12)
template:setBeam(6, 90,-90, 2000.0, 3, 12)
template:setBeam(7, 90, 90, 2000.0, 3, 12)
template:setBeam(8, 90,-90, 2000.0, 3, 12)
template:setSystemDamageRatio(0.8)
template:setSystemDamageHullThreshold(0.70)

--       Tubes
template:setTubes(10, 12.0)
template:setTubeDirection(0, 1)
template:setTubeDirection(1, -1)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setTubeDirection(6, 90)
template:setTubeDirection(7, -90)
template:setTubeDirection(8, 90)
template:setTubeDirection(9, -90)
--TG Plasma-EM: (EMP, Homing)
template:setCustomWeapon("Homing", "EMP", 2, 300.0, "EMP", -1)
template:setCustomWeaponColor("EMP", 0, 153, 255)
template:setCustomWeaponStorage("EMP", 6)

--TG Seeker (homing) 
template:setCustomWeapon("Homing", "SEEK", 1.5, 600.0, "Kinetic", -1)
template:setCustomWeaponColor("SEEK", 255, 204, 0)
template:setCustomWeaponStorage("SEEK", 18)
--TG fusionmelta (Nuke homing) 
template:setCustomWeapon("Nuke", "MELT", 2, 300.0, "Kinetic", -1)
template:setCustomWeaponColor("MELT", 204, 0, 0)
template:setCustomWeaponStorage("MELT", 2)
--DockClasses
template:setDockClasses("Drone","Vaisseau leger","Fregate","Destroyer","Croiseur")
-- couleur(template,"Alpha","Mothership")


--[[Barge de Bataille]]
template = ShipTemplate():setName("Barge de Bataille"):setClass("Vaisseau-Mere", "Alpha"):setModel("Eternal_Crusader_Battlebarge")
template:setRadarTrace("battleship.png")
template:setDescription([[Les Barges de Bataille sont parmi les plus anciens vaisseaux en activite dans les flottes de l'Imperium. Leur premiere mise en service remonte a l'epoque de la Grande Croisade, concues dans le but de transporter les legions Astartes de l'Empereur parmi les etoiles.]])
template:setJumpDrive(true)
template:setJumpDrive(5000.0, 6000.0)
template:setHull(2400)
template:setShields(1000, 1000, 1000)
template:setSpeed(75, 6, 8)
template:setSystemDamageRatio(0.8)
template:setSystemDamageHullThreshold(0.70)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 10, 0, 100.0, 30.0, 0)
template:setBeam(1, 90, 90, 3000.0, 14.0, 35)
template:setBeam(2, 90, -90, 3000.0, 14.0, 35)
template:setBeam(3, 90, 90, 3000.0, 14.0, 35)
template:setBeam(4, 90, -90, 3000.0, 14.0, 35)
template:setBeam(5, 90, 90, 2000.0, 3, 9)
template:setBeam(6, 90,-90, 2000.0, 3, 9)
template:setBeam(7, 90, 90, 2000.0, 3, 9)
template:setBeam(8, 90,-90, 2000.0, 3, 9)
--                              Arc, Dir, Rotate speed
--       Tubes
template:setTubes(10, 12.0)
template:setTubeDirection(0, 1)
template:setTubeDirection(1, -1)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setTubeDirection(6, 90)
template:setTubeDirection(7, -90)
template:setTubeDirection(8, 90)
template:setTubeDirection(9, -90)
--TG Seeker (homing) 
template:setCustomWeapon("Homing", "SEEK", 1.5, 600.0, "Kinetic", -1)
template:setCustomWeaponColor("SEEK", 255, 204, 0)
template:setCustomWeaponStorage("SEEK", 32)
--MGAA Skyreaper (homing trés rapide) fregrate et plus
template:setCustomWeapon("Homing", "SKYR", 0.25, 1000.0, "Kinetic", -1)
template:setCustomWeaponMultiple("SKYR",3,1)
template:setCustomWeaponColor("SKYR", 255, 204, 0)
template:setCustomWeaponStorage("SKYR", 32)
--Macro-canon : (rafale, non homing) 
template:setCustomWeapon("HVLI", "MCANMK3", 4, 1500.0, "Kinetic", 25)
template:setCustomWeaponMultiple("MCANMK3",1,4)
template:setCustomWeaponColor("MCANMK3", 255, 150, 103)
template:setCustomWeaponStorage("MCANMK3", 120)

--TG fusionmelta (Nuke homing) 
template:setCustomWeapon("Nuke", "MELT", 2, 300.0, "Kinetic", -1)
template:setCustomWeaponColor("MELT", 204, 0, 0)
template:setCustomWeaponStorage("MELT", 3)
--DockClasses
template:setDockClasses("Drone","Vaisseau leger","Fregate","Destroyer","Croiseur")
template:setDefaultAI('default')

