--[[                  Croiseurs
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

Le croiseur est un puissant vaisseau d'attaque lourdement blindé et armé.
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


--[[Croiseur Impérial Gothic]]
template = ShipTemplate():setName("Croiseur Imperial Gothic"):setClass("Croiseur", "Combat"):setModel("Navy_Cruiser")
template:setRadarTrace("radar_battleship.png")
template:setDescription([[Les croiseurs de classe Gothic furent un type de vaisseaux tres repandus a travers l'ensemble de l'Imperium.
La puissance de feu des vaisseaux de ce type permet d'engager et de detruire des vaisseaux ennemis de toutes taille, faisant du croiseur Gothic un adversaire dangereux.
Toutefois, les premiers engagements de ce type de vaisseaux lors de la Guerre Gothique revelerent les lacunes des croiseurs Gothic, leur puissance de feu ne pouvant que difficilement rivaliser avec la mobilite de leurs adversaires.]])
template:setHull(1200)
template:setShields(400, 400)
template:setSpeed(85, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 10, 0, 100.0, 30.0, 200)
template:setBeam(1, 10, 90, 2000.0, 7.0, 50)
template:setBeam(2, 10, -90, 2000.0, 7.0, 50)
template:setBeam(3, 15, 90, 1500.0, 1.5, 12)
template:setBeam(4, 15,-90, 1500.0, 1.5, 12)
template:setBeam(5, 15, 90, 1500.0, 1.5, 12)
template:setBeam(6, 15,-90, 1500.0, 1.5, 12)
--                              Arc, Dir, Rotate speed
template:setBeamWeaponTurret(1, 100,  90, 5)
template:setBeamWeaponTurret(2, 100, -90, 5)
template:setBeamWeaponTurret(3, 150,  90, 5)
template:setBeamWeaponTurret(4, 150, -90, 5)
template:setBeamWeaponTurret(5, 150,  90, 5)
template:setBeamWeaponTurret(6, 150, -90, 5)
--       Tubes
template:setTubes(8, 12.0)
template:setTubeDirection(0, 1)
template:setTubeDirection(1, -1)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setTubeDirection(6, 90)
template:setTubeDirection(7, -90)
--MGAA Skyreaper (homing trés rapide) fregrate et plus
template:setCustomWeapon("Homing", "SKYR", 0.75, 1000.0, 3, "Kinetic")
template:setCustomWeaponColor("SKYR", 255, 204, 0)
template:setCustomWeaponStorage("SKYR", 12)
--Macro-canon : (rafale, non homing) 
template:setCustomWeapon("HVLI", "MCAN", 3, 1000.0, 3, "Kinetic")
template:setCustomWeaponColor("MCAN", 255, 150, 103)
template:setCustomWeaponStorage("MCAN", 32)
--TG Seeker (homing) 
template:setCustomWeapon("Homing", "SEEK", 2.5, 600.0, 1, "Kinetic")
template:setCustomWeaponColor("SEEK", 255, 204, 0)
template:setCustomWeaponStorage("SEEK", 14)
--MGAA Flakburst (nuke faible dommage) 
template:setCustomWeapon("Nuke", "FLAK", 0.5, 500.0, 1, "Kinetic")
template:setCustomWeaponColor("FLAK", 220, 87, 20)
template:setCustomWeaponStorage("FLAK", 3)
--TG fusionmelta (Nuke homing) 
template:setCustomWeapon("Nuke", "MELT", 2, 300.0, 1, "Kinetic")
template:setCustomWeaponColor("MELT", 204, 0, 0)
template:setCustomWeaponStorage("MELT", 1)
--DockClasses
template:setDockClasses("Drone","Vaisseau leger","Fregate")
template:setDefaultAI('missilevolley')

--[[Croiseur Gothic]]
variation = template:copy("Croiseur Gothic"):setType("playership")
variation:setLocaleName("Croiseur Gothic")
variation:setSpeed(85, 10, 12)
-- PJ
variation:setCombatManeuver(200, 150)
variation:setJumpDrive(true)
variation:setRepairCrewCount(2)
variation:addRoomSystem(0, 0, 1, 4, "RearShield")
variation:addRoom(1, 0, 1, 1)
variation:addRoomSystem(1, 1, 3, 2, "MissileSystem")
variation:addRoom(1, 3, 1, 1)
variation:addRoomSystem(2, 0, 2, 1, "Beamweapons")
variation:addRoomSystem(2, 3, 2, 1, "Maneuver")
variation:addRoomSystem(4, 0, 2, 1, "Warp")
variation:addRoomSystem(4, 3, 2, 1, "JumpDrive")
variation:addRoomSystem(5, 1, 1, 2, "Reactor")
variation:addRoom(6, 0, 1, 1)
variation:addRoomSystem(6, 1, 1, 2, "Impulse")
variation:addRoom(6, 3, 1, 1)
variation:addRoomSystem(7, 0, 1, 4, "FrontShield")
variation:addDoor(1, 0, false)
variation:addDoor(2, 0, false)
variation:addDoor(4, 0, false)
variation:addDoor(6, 0, false)
variation:addDoor(7, 0, false)
variation:addDoor(1, 1, true)
variation:addDoor(1, 3, true)
variation:addDoor(6, 1, true)
variation:addDoor(6, 2, false)
variation:addDoor(6, 3, true)
variation:addDoor(1, 3, false)
variation:addDoor(2, 3, false)
variation:addDoor(4, 3, false)
variation:addDoor(6, 3, false)
variation:addDoor(7, 3, false)


--[[Croiseur Inquisitoriale]]
template = ShipTemplate():setName("Croiseur Inquisitorial"):setClass("Croiseur", "Combat"):setModel("Inquisitorial_Cruiser")
template:setRadarTrace("radar_battleship.png")
template:setDescription([[Les croiseurs inquisitoires sont des navires de classe Croiseur utilises par l'Inquisition. Ces navires sont specialement construits pour l'Inquisition et utilisent une technologie et des armes disponibles uniquement pour les flottes de Mars elles-memes.
En consequence, ils sont plus rapides, mieux armes et mieux proteges que les navires de meme classe chez l'Imperium. Bien que quelques modeles standard soient utilises par l'Inquisition, ils sont tout aussi souvent concus a cet effet et optimises pour des roles specifiques.
Ces navires sont generalement utilises par les inquisiteurs en mission avant d'etre transferes, bien qu'il ne soit pas rare que des inquisiteurs aient des croiseurs permanents attaches a leurs noms. ]])
template:setHull(1500)
template:setShields(450, 450)
template:setSpeed(90, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 10, 0, 100.0, 30.0, 200)
template:setBeam(1, 10, 90, 2000.0, 7.0, 50)
template:setBeam(2, 10, -90, 2000.0, 7.0, 50)
template:setBeam(3, 15, 90, 1500.0, 1.5, 12)
template:setBeam(4, 15,-90, 1500.0, 1.5, 12)
template:setBeam(5, 15, 90, 1500.0, 1.5, 12)
template:setBeam(6, 15,-90, 1500.0, 1.5, 12)
--                              Arc, Dir, Rotate speed
template:setBeamWeaponTurret(1, 100,  90, 5)
template:setBeamWeaponTurret(2, 100, -90, 5)
template:setBeamWeaponTurret(3, 150,  90, 5)
template:setBeamWeaponTurret(4, 150, -90, 5)
template:setBeamWeaponTurret(5, 150,  90, 5)
template:setBeamWeaponTurret(6, 150, -90, 5)
--       Tubes
template:setTubes(8, 12.0)
template:setTubeDirection(0, 1)
template:setTubeDirection(1, -1)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setTubeDirection(6, 90)
template:setTubeDirection(7, -90)
--MGAA Skyreaper (homing trés rapide) fregrate et plus
template:setCustomWeapon("Homing", "SKYR", 0.75, 1000.0, 3, "Kinetic")
template:setCustomWeaponColor("SKYR", 255, 204, 0)
template:setCustomWeaponStorage("SKYR", 12)
--Macro-canon : (rafale, non homing) 
template:setCustomWeapon("HVLI", "MCAN", 3, 1000.0, 3, "Kinetic")
template:setCustomWeaponColor("MCAN", 255, 150, 103)
template:setCustomWeaponStorage("MCAN", 32)
--TG Seeker (homing) 
template:setCustomWeapon("Homing", "SEEK", 2.5, 600.0, 1, "Kinetic")
template:setCustomWeaponColor("SEEK", 255, 204, 0)
template:setCustomWeaponStorage("SEEK", 14)
--MGAA Flakburst (nuke faible dommage) 
template:setCustomWeapon("Nuke", "FLAK", 0.5, 500.0, 1, "Kinetic")
template:setCustomWeaponColor("FLAK", 220, 87, 20)
template:setCustomWeaponStorage("FLAK", 3)
--TG fusionmelta (Nuke homing) 
template:setCustomWeapon("Nuke", "MELT", 2, 300.0, 1, "Kinetic")
template:setCustomWeaponColor("MELT", 204, 0, 0)
template:setCustomWeaponStorage("MELT", 5)
--TG Plasma-EM: (EMP, Homing)
template:setCustomWeapon("Homing", "EMP", 2, 300.0, 1, "EMP")
template:setCustomWeaponColor("EMP", 0, 153, 255)
template:setCustomWeaponStorage("EMP", 6)
--DockClasses
template:setDefaultAI('missilevolley')
template:setDockClasses("Drone","Vaisseau leger","Fregate")


--[[Croiseur Corsair Shadow]]
template = ShipTemplate():setName("Croiseur Corsaire Shadow"):setClass("Croiseur", "Combat"):setModel("Eldar_Corsair_Cruiser")
template:setRadarTrace("radar_battleship.png")
template:setDescription([[Le Croiseur Shadow est un vaisseau de ligne des Flottes Eldars.
Le modele Shadow est le plus grand des vaisseaux qui composent generalement les flottes des Eldars. Comme beaucoup de vaisseaux Xenos, le Croiseur Shadow est souvent confondu avec d'autres classes de croiseur et de nombreuses attaques sont ainsi attribuees faussement a leurs cousins Eldars. ]])
template:setHull(1100)
template:setShields(250, 250)
template:setSpeed(105, 15, 15)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 20, 0, 3500.0, 40.0, 200)
template:setBeam(1, 45, 0, 2000.0, 7.0, 50)
template:setBeam(2, 45, 0, 2000.0, 7.0, 50)
template:setBeam(3, 90, 90, 1500.0, 1.5, 12)
template:setBeam(4, 90,-90, 1500.0, 1.5, 12)
template:setBeam(5, 90, 90, 1500.0, 1.5, 12)
template:setBeam(6, 90,-90, 1500.0, 1.5, 12)
--                              Arc, Dir, Rotate speed

--       Tubes
template:setTubes(8, 12.0)
template:setTubeDirection(0, 1)
template:setTubeDirection(1, -1)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setTubeDirection(6, 90)
template:setTubeDirection(7, -90)

template:setWeaponStorage("EMP", 5) -- degats bouclier 150

--TG Seeker (homing) 
template:setCustomWeapon("Homing", "SEEK", 2.5, 600.0, 1, "Kinetic")
template:setCustomWeaponColor("SEEK", 255, 204, 0)
template:setCustomWeaponStorage("SEEK", 18)
--MGAA Flakburst (nuke faible dommage) 
template:setCustomWeapon("Nuke", "FLAK", 0.5, 500.0, 1, "Kinetic")
template:setCustomWeaponColor("FLAK", 220, 87, 20)
template:setCustomWeaponStorage("FLAK", 3)


--DockClasses)
template:setDefaultAI('missilevolley')
template:setDockClasses("Drone","Vaisseau leger","Fregate")


--[[Croiseur du Chaos Carnage]]
template = ShipTemplate():setName("Croiseur du Chaos Carnage"):setClass("Croiseur", "Combat"):setModel("Chaos_Cruiser")
template:setRadarTrace("radar_battleship.png")
template:setDescription([[Le Croiseur Carnage fut developpe par la Flotte Obscura afin d'obtenir un vaisseau pouvant fournir des tirs de soutien a longue portee a d'autres croiseurs tout en restant a l'abris des ripostes.
Basee sur des nombreux emplacements de Batteries d'armes, la conception du Carnage se retrouva entravee par les difficultes d'approvisionnement en energie pour ces armes. Ces difficultes conduisirent a de profondes dissensions au sein des commandants de la Flotte au sujet de la pertinence de cette classe de navire. ]])
template:setHull(1200)
template:setShields(400, 400)
template:setSpeed(85, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 10, 0, 100.0, 30.0, 20)
template:setBeam(1, 90, 90, 2000.0, 7.0, 50)
template:setBeam(2, 90, -90, 2000.0, 7.0, 50)
template:setBeam(3, 90, 90, 1500.0, 1.5, 12)
template:setBeam(4, 90,-90, 1500.0, 1.5, 12)
template:setBeam(5, 90, 90, 1500.0, 1.5, 12)
template:setBeam(6, 90,-90, 1500.0, 1.5, 12)
--                              Arc, Dir, Rotate speed

--       Tubes
template:setTubes(8, 12.0)
template:setTubeDirection(0, 1)
template:setTubeDirection(1, -1)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setTubeDirection(6, 90)
template:setTubeDirection(7, -90)
--MGAA Skyreaper (homing trés rapide) fregrate et plus
template:setCustomWeapon("Homing", "SKYR", 0.75, 1000.0, 3, "Kinetic")
template:setCustomWeaponColor("SKYR", 255, 204, 0)
template:setCustomWeaponStorage("SKYR", 12)
--Macro-canon : (rafale, non homing) 
template:setCustomWeapon("HVLI", "MCAN", 3, 1000.0, 3, "Kinetic")
template:setCustomWeaponColor("MCAN", 255, 150, 103)
template:setCustomWeaponStorage("MCAN", 32)
--TG Seeker (homing) 
template:setCustomWeapon("Homing", "SEEK", 2.5, 600.0, 1, "Kinetic")
template:setCustomWeaponColor("SEEK", 255, 204, 0)
template:setCustomWeaponStorage("SEEK", 14)
--MGAA Flakburst (nuke faible dommage) 
template:setCustomWeapon("Nuke", "FLAK", 0.5, 500.0, 1, "Kinetic")
template:setCustomWeaponColor("FLAK", 220, 87, 20)
template:setCustomWeaponStorage("FLAK", 3)
--TG fusionmelta (Nuke homing) 
template:setCustomWeapon("Nuke", "MELT", 2, 300.0, 1, "Kinetic")
template:setCustomWeaponColor("MELT", 204, 0, 0)
template:setCustomWeaponStorage("MELT", 2)
--DockClasses
template:setDefaultAI('missilevolley')
template:setDockClasses("Drone","Vaisseau leger","Fregate")


--[[Croiseur Marchand Civil]]
template = ShipTemplate():setName("Croiseur Marchand Civil Graal"):setClass("Croiseur", "Marchand"):setModel("Civilian_Transport_Cruiser")
template:setRadarTrace("radar_transport.png")
template:setDescription([[Ces transporteurs sont generalement des vaisseaux civils issus de la Flotte Marchande. Malgre leur courage et leur volonte, ces vaisseaux ne sont pas equipes pour lutter contre des vaisseaux de guerre, ne disposant que d'un armement leger contre les attaques de pirates, manquant d'officiers experimentes et n'ayant pas la motorisation permettant de semer leurs adversaires.]])
template:setHull(1000)
template:setShields(400, 400)
template:setSpeed(80, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 10, 0, 100.0, 30.0, 10)
template:setBeam(1, 90, 90, 2000.0, 7.0, 50)
template:setBeam(2, 90, -90, 2000.0, 7.0, 50)
template:setBeam(3, 90, 90, 1500.0, 1.5, 12)
template:setBeam(4, 90,-90, 1500.0, 1.5, 12)
template:setBeam(5, 90, 90, 1500.0, 1.5, 12)
template:setBeam(6, 90,-90, 1500.0, 1.5, 12)
--                              Arc, Dir, Rotate speed

--       Tubes
template:setTubes(8, 12.0)
template:setTubeDirection(0, 1)
template:setTubeDirection(1, -1)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setTubeDirection(6, 90)
template:setTubeDirection(7, -90)
--MGAA Skyreaper (homing trés rapide) fregrate et plus
template:setCustomWeapon("Homing", "SKYR", 0.75, 1000.0, 3, "Kinetic")
template:setCustomWeaponColor("SKYR", 255, 204, 0)
template:setCustomWeaponStorage("SKYR", 12)
--Macro-canon : (rafale, non homing) 
template:setCustomWeapon("HVLI", "MCAN", 3, 1000.0, 3, "Kinetic")
template:setCustomWeaponColor("MCAN", 255, 150, 103)
template:setCustomWeaponStorage("MCAN", 20)
--DockClasses
template:setDockClasses("Drone","Vaisseau leger")

--[[Croiseur Marchand Rogue]]
variation = template:copy("Croiseur Marchand Rogue")
variation:setLocaleName("Croiseur Marchand Rogue")
variation:setClass("Croiseur", "Marchand","Rogue")
variation:setModel("Rogue_Trader_Cruiser")
variation:setDescription([[Ces transporteurs sont generalement des vaisseaux civils modifie issus de la Flotte Marchande. Malgre leur courage et leur volonte, ces vaisseaux ne sont pas equipes pour lutter contre des vaisseaux de guerre, ne disposant que d'un armement leger contre les attaques de pirates, manquant d'officiers experimentes et n'ayant pas la motorisation permettant de semer leurs adversaires.]])
variation:setHull(1400)
variation:setShields(500, 500)
variation:setSpeed(100, 25, 12)
--MGAA Skyreaper (homing trés rapide) fregrate et plus
variation:setCustomWeapon("Homing", "SKYR", 0.75, 1000.0, 3, "Kinetic")
variation:setCustomWeaponColor("SKYR", 255, 204, 0)
variation:setCustomWeaponStorage("SKYR", 10)
--Macro-canon : (rafale, non homing) 
variation:setCustomWeapon("HVLI", "MCAN", 3, 1000.0, 3, "Kinetic")
variation:setCustomWeaponColor("MCAN", 255, 150, 103)
variation:setCustomWeaponStorage("MCAN", 32)
--TG Seeker (homing) 
variation:setCustomWeapon("Homing", "SEEK", 2.5, 600.0, 1, "Kinetic")
variation:setCustomWeaponColor("SEEK", 255, 204, 0)
variation:setCustomWeaponStorage("SEEK", 24)
--MGAA Flakburst (nuke faible dommage) 
variation:setCustomWeapon("Nuke", "FLAK", 0.5, 500.0, 1, "Kinetic")
variation:setCustomWeaponColor("FLAK", 220, 87, 20)
variation:setCustomWeaponStorage("FLAK", 5)
--TG fusionmelta (Nuke homing) 
variation:setCustomWeapon("Nuke", "MELT", 2, 300.0, 1, "Kinetic")
variation:setCustomWeaponColor("MELT", 204, 0, 0)
variation:setCustomWeaponStorage("MELT", 3)

variation:setWeaponStorage("EMP", 5)

--[[Croiseur Marchand Il'porrui]]
template = ShipTemplate():setName("Croiseur Marchand Il'porrui"):setClass("Croiseur", "Marchand"):setModel("Tau_Merchant_Cruiser")
template:setRadarTrace("radar_transport.png")
template:setDescription([[Les Il'porruis servent souvent de transport pour des dignitaire de la Caste de l'Eau, desCommandeurs ou des Etheres. Malgre sa fonction, il est suffisamment bien arme pour se defendre contre des ennemis du meme gabarit que lui.
Les Il'porrui sont devenus communs dans l'Empire Tau et sont meme souvent utilises en dehors lors de missions diplomatiques. Ces navires font egalement d'excellents vaisseaux de commerce et sont de vrai betes de somme au sein de leur jeune empire. ]])
template:setHull(900)
template:setShields(600, 600)
template:setSpeed(80, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, 0, 4500.0, 30.0, 200)
template:setBeam(1, 120, 90, 2000.0, 7.0, 50)
template:setBeam(2, 120, -90, 2000.0, 7.0, 50)
template:setBeam(3, 120, 90, 1500.0, 1.5, 12)
template:setBeam(4, 120,-90, 1500.0, 1.5, 12)
template:setBeam(5, 120, 90, 1500.0, 1.5, 12)
template:setBeam(6, 120,-90, 1500.0, 1.5, 12)

--       Tubes
template:setTubes(8, 12.0)
template:setTubeDirection(0, 1)
template:setTubeDirection(1, -1)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, 90)
template:setTubeDirection(5, -90)
template:setTubeDirection(6, 90)
template:setTubeDirection(7, -90)
--TG Seeker (homing) 
template:setCustomWeapon("Homing", "SEEK", 2.5, 600.0, 1, "Kinetic")
template:setCustomWeaponColor("SEEK", 255, 204, 0)
template:setCustomWeaponStorage("SEEK", 18)
--TG fusionmelta (Nuke homing) 
template:setCustomWeapon("Nuke", "MELT", 2, 300.0, 1, "Kinetic")
template:setCustomWeaponColor("MELT", 204, 0, 0)
template:setCustomWeaponStorage("MELT", 3)

template:setWeaponStorage("EMP", 5)

--DockClasses
template:setDefaultAI('missilevolley')
template:setDockClasses("Drone","Vaisseau leger","Fregate")