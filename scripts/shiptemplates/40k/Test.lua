--[[Fichier de templates pour tester les différentes classes de vaisseaux pour De Verve et D'Acier]]


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function EscorteurTEST()

--Définition du vaisseau PNJ
function EscorteurTESTPNJ()

function EscorteurTESTCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Escorteur TEST"):setLocaleName(_("ship", "Escorteur TEST")):setClass(_("class", "Escorteur"), _("subclass", "TEST")):setModel("Navy_Destroyer")
template:setDescription(_([[Vaisseau de test]]))
--template:setScale(100)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.015)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(300)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(250, 8.8, 7.6, 31.25, 8.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

EscorteurTESTCoque()

function EscorteurTESTTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

end

EscorteurTESTTourelles()

function EscorteurTESTMissiles()

--Nombre de tubes et temps de chargement
template:setTubes(1, 30)

--Définition des lance missiles
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 6)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Torpille",1,2)

--Sélection munition
template:setWeaponTubeExclusiveForCustom(0,"Torpille")

end

EscorteurTESTMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
EscorteurTESTPNJ()

--Création du vaisseau PJ
function EscorteurTESTPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Escorteur"):setLocaleName(_("playerShip", "Escorteur TEST")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(30000):setShortRangeRadarRange(12000)

function EscorteurTESTTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

end

EscorteurTESTTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
EscorteurTESTPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
EscorteurTEST()



-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -