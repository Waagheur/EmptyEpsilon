--[[Fichier de templates pour les vaisseaux PJs pour De Verve et D'Acier]]


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function Defiance()

--Définition du vaisseau PNJ
function DefiancePNJ()


function DefianceCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("ZY9 Defiance"):setLocaleName(_("ship", "Grand Croiseur Repulsive")):setClass(_("class", "Grand Croiseur"), _("subclass", "Repulsive")):setModel("Rogue_Trader_Cruiser")
template:setDescription(_([[Le Grand Croiseur de Classe Repulsive Défiance appartient au Seigneur-Capitaine Vargas Anomtarkus, Libre-Marchand du sous-secteur d'Argos, depuis peu. On raconte que c'est lors d'une expédition en dehors des frontières de l'Imperium que le Capitaine a retrouvé ce vaisseau appartennant à sa famille et perdu depuis plus de 4 siècles. Equipé de nombreux macrocanons et de tourelles laser, il est polyvalent, mais trop lent pour rattraper les vaisseaux de plus petit tonnage.]]))
template:setSecret(true)
--template:setScale(375)
template:setRadarTrace("tug.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.021)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(850)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(125, 5.28, 2.4, 15.625, 5.28)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")
--Dockage autorisé
template:setCanDock(true)
template:setExternalDockClasses(_("class","Transport"),_("class","Escorteur"),_("class","Fregate"),_("class","Croiseur Leger"),_("class","Croiseur"),_("class","Croiseur de Combat"))

end

DefianceCoque()

function DefianceTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.33, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle Bâbord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

--Tourelle Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(3, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.1)

end

DefianceTourelles()

function DefianceMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(7, 30)

--Lance-Torpille
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 30)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")

--Macrocanons Bâbords 1
--Direction (Index,Direction)
template:setTubeDirection(1, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanons Bâbords 2
--Direction (Index,Direction)
template:setTubeDirection(2, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Macrocanons Bâbords 3
--Direction (Index,Direction)
template:setTubeDirection(3, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Macrocanons Tribords 1
--Direction (Index,Direction)
template:setTubeDirection(4,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(4, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(4, "small")

--Macrocanons Tribords 2
--Direction (Index,Direction)
template:setTubeDirection(5,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(5, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(5, "small")

--Macrocanons Tribords 3
--Direction (Index,Direction)
template:setTubeDirection(6,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(6, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(6, "small")

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 18)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Torpille",1,2)

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK3X", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK3X", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK3X", 600)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK3X", 1, 4)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Torpille")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK3X")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK3X")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK3X")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK3X")
template:setWeaponTubeExclusiveForCustom(5,"MCANMK3X")
template:setWeaponTubeExclusiveForCustom(6,"MCANMK3X")

end

DefianceMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
DefiancePNJ()

--Création du vaisseau PJ
function DefiancePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("ZY9 Grand Croiseur"):setLocaleName(_("playerShip", "Defiance")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(30000):setShortRangeRadarRange(12000)


function DefianceTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.33, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle Bâbord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

--Tourelle Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(3, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(3, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(3, 0.1)
end

DefianceTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
DefiancePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
Defiance()

--Création du vaisseau
function GambitMetallicus()

--Définition du vaisseau PNJ
function GambitMetallicusPNJ()

function GambitMetallicusCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("ZY8 Gambit Metallicus"):setLocaleName(_("ship", "Gambit Metallicus")):setClass(_("class", "Croiseur"), _("subclass", "Lunar")):setModel("Adeptus_Mechanicus_cruiser")
template:setDescription(_([[Affrété par le Prime Hermeticon Andra-7, le Gambit Metallicus est un Croiseur Lunar modifié dont les lance torpilles traditionnels ont été remplacés par un redoutable canon Nova.]]))
template:setSecret(true)
--template:setScale(250)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(700)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(125, 5.6, 2.5, 15.625, 5.6)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")
--Dockage autorisé
template:setCanDock(true)
template:setExternalDockClasses(_("class","Transport"),_("class","Escorteur"),_("class","Fregate"),_("class","Croiseur Leger"))

end

GambitMetallicusCoque()

function GambitMetallicusTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Bâbord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

GambitMetallicusTourelles()

function GambitMetallicusMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(5, 30)

--Canon Nova
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 60)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "large")

--Macrocanons Bâbords 1
--Direction (Index,Direction)
template:setTubeDirection(1, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanons Bâbords 2
--Direction (Index,Direction)
template:setTubeDirection(2, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Macrocanons Tribords 1
--Direction (Index,Direction)
template:setTubeDirection(3,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Macrocanons Tribords 2
--Direction (Index,Direction)
template:setTubeDirection(4,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(4, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(4, "small")

--Définition du canon nova
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Canon Nova", 1, 6400.0, "Kinetic", 10)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Canon Nova", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Canon Nova", 6)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Canon Nova",1,1)

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK2X", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK2X", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK2X", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK2X", 1, 3)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Canon Nova")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2X")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK2X")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK2X")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK2X")

end

GambitMetallicusMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
GambitMetallicusPNJ()

--Création du vaisseau PJ
function GambitMetallicusPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("ZY8 Gambit"):setLocaleName(_("playerShip", "Gambit Metallicus")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(30000):setShortRangeRadarRange(12000)

function GambitMetallicusTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Bâbord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)
end

GambitMetallicusTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
GambitMetallicusPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
GambitMetallicus()

--Création du vaisseau
function CelestisVeritas()

--Définition du vaisseau PNJ
function CelestisVeritasPNJ()

function CelestisVeritasCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("ZY7 Celestis Veritas"):setLocaleName(_("ship", "Celestis Veritas")):setClass(_("class", "Croiseur"), _("subclass", "Lunar")):setModel("Navy_Cruiser")
template:setDescription(_([[Le croiseur Celestis Veritas est un croiseur de classe Lunar. De conception robuste, il a été produit localement par le Monde-Forge de Lascarius et modifié en emplaçant les lance torpilles traditionnels par un redoutable canon Nova afin de servir de croiseur d'artillerie.]]))
template:setSecret(true)
--template:setScale(250)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(700)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(125, 5.6, 2.5, 15.625, 5.6)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")
--Dockage autorisé
template:setCanDock(true)
template:setExternalDockClasses(_("class","Transport"),_("class","Escorteur"),_("class","Fregate"),_("class","Croiseur Leger"))

end

CelestisVeritasCoque()

function CelestisVeritasTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Bâbord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

CelestisVeritasTourelles()

function CelestisVeritasMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(5, 30)

--Canon Nova
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 60)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "large")

--Macrocanons Bâbords 1
--Direction (Index,Direction)
template:setTubeDirection(1, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanons Bâbords 2
--Direction (Index,Direction)
template:setTubeDirection(2, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Macrocanons Tribords 1
--Direction (Index,Direction)
template:setTubeDirection(3,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Macrocanons Tribords 2
--Direction (Index,Direction)
template:setTubeDirection(4,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(4, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(4, "small")

--Définition du canon nova
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Canon Nova", 1, 6400.0, "Kinetic", 10)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Canon Nova", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Canon Nova", 6)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Canon Nova",1,1)

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK2X", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK2X", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK2X", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK2X", 1, 3)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Canon Nova")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2X")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK2X")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK2X")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK2X")

end

CelestisVeritasMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CelestisVeritasPNJ()

--Création du vaisseau PJ
function CelestisVeritasPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("ZY7 Celestis"):setLocaleName(_("playerShip", "Celestis Veritas")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(30000):setShortRangeRadarRange(12000)

function CelestisVeritasTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Bâbord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)
end

CelestisVeritasTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CelestisVeritasPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
--CelestisVeritas()

--Création du vaisseau
function MartyrdeSainteElana()

--Définition du vaisseau PNJ
function MartyrdeSainteElanaPNJ()

function MartyrdeSainteElanaCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("ZY6 Martyr de Sainte Elana"):setLocaleName(_("ship", "Martyr de Sainte Elana")):setClass(_("class", "Croiseur"), _("subclass", "Gothic")):setModel("Navy_Cruiser")
template:setDescription(_([[Le Martyr de Sainte Elana, du nom d'une martyr de l'Imperium, est un Croiseur de classe Gothic construit sur Kar Duniash. Equipé de plusieurs lances sidérales et d'un lance-torpille de proue, il n'est pas à prendre à la légère et devient redoutable à courte porté..]]))
--template:setScale(250)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.024)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(700)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(125, 5.6, 2.5, 15.625, 5.6)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")
--Dockage autorisé
template:setCanDock(true)
template:setExternalDockClasses(_("class","Transport"),_("class","Escorteur"),_("class","Fregate"),_("class","Croiseur Leger"))

end

MartyrdeSainteElanaCoque()

function MartyrdeSainteElanaTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Bâbord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle Bâbord 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(3, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.1)

--Tourelle Tribord 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(4, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(4, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(4, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(4, 0.1)

end

MartyrdeSainteElanaTourelles()

function MartyrdeSainteElanaMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(1, 30)

--Lance-Torpille
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 30)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 12)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Torpille",1,2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Torpille")

end

MartyrdeSainteElanaMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
MartyrdeSainteElanaPNJ()

--Création du vaisseau PJ
function MartyrdeSainteElanaPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("ZY6 Martyr"):setLocaleName(_("playerShip", "Martyr de Sainte Elana")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(30000):setShortRangeRadarRange(12000)

function MartyrdeSainteElanaTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Bâbord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle Bâbord 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(3, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(3, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(3, 0.1)

--Tourelle Tribord 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(4, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(4, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(4, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(4, 0.1)

end

MartyrdeSainteElanaTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
MartyrdeSainteElanaPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
--MartyrdeSainteElana()

--Création du vaisseau
function EsperancedeSainteCelestine()

--Définition du vaisseau PNJ
function EsperancedeSainteCelestinePNJ()

function EsperancedeSainteCelestineCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("ZY5 Esperance de Sainte Celestine"):setLocaleName(_("ship", "Esperance de Sainte Celestine")):setClass(_("class", "Croiseur de Combat"), _("subclass", "Chalice")):setModel("Navy_Battleship")
template:setDescription(_([[L'Esperance de Sainte Celestine est un Croiseur de Combat de Classe Chalice récemment arrivé dans le sous-secteur d'Argos afin de répondre à une demande de renforts. La classe Chalice était une tentative audacieuse, mais pas entièrement réussie, de développer davantage le concept du croiseur de combat dans le secteur Calixis. La théorie semblait bonne : un croiseur lourd rapide, avec une armure légère et des armes puissantes qui pouvaient distancer et déjouer tout ce qu’il ne pouvait pas détruire immédiatement. Pendant les sombres années de la croisade angevine, les propagandistes impériaux ont fait grand cas des nouveaux « super-croiseurs » fabriqués localement, qui avaient pour mission de repousser les nombreux xénos et hérétiques s'opposant aux forces Impériales. Même s’ils ne sont entrés en service qu’à la fin de la croisade, les espoirs pour ces navires étaient immenses. Les premiers capitaines de la classe Calice ont été salués comme des aventuriers glamour et flamboyants dans les bobines de vox sans fin et les jeux de données. Malheureusement, ces navires n’ont pas répondu aux attentes. Deux des premiers cuirassés de classe Chalice ont été détruits lors d’un engagement avec des forces xénos inconnues dans l’abîme de Hazeroth, et d’autres ont été perdus au cours d'accidents ou d'engagements au cours des prochains millénaires. Cependant, ces navires restent admirés parmi le grand public impérial, qui croit que ces navires sont le noyau de fer de la Flotte de Guerre Calixis. Cependant, ces navires élégants et beaux, bien que rapides et bien armés, ont une mâchoire de verre, et une tendance déconcertante à subir des ruptures de leurs conduites de plasma lors d’assauts soutenus.]]))
--template:setScale(255)
template:setRadarTrace("battleship.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.019)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(700)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(150, 5.6, 3.4, 18.75, 5.6)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")
--Dockage autorisé
template:setCanDock(true)
template:setExternalDockClasses(_("class","Transport"),_("class","Escorteur"),_("class","Fregate"),_("class","Croiseur Leger"))

end

EsperancedeSainteCelestineCoque()

function EsperancedeSainteCelestineTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.0125)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.125)

--Tourelle Bâbord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.125)

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(3, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.125)

end

EsperancedeSainteCelestineTourelles()

function EsperancedeSainteCelestineMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(5, 30)

--Lance-Torpilles
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 60)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")

--Macrocanons Bâbords 1
--Direction (Index,Direction)
template:setTubeDirection(1, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanons Bâbords 2
--Direction (Index,Direction)
template:setTubeDirection(2, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Macrocanons Tribords 1
--Direction (Index,Direction)
template:setTubeDirection(3,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Macrocanons Tribords 2
--Direction (Index,Direction)
template:setTubeDirection(4,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(4, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(4, "small")

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 18)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Torpille",1,2)

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK2", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK2", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK2", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK2", 1, 3)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Torpille")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK2")

end

EsperancedeSainteCelestineMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
EsperancedeSainteCelestinePNJ()

--Création du vaisseau PJ
function EsperancedeSainteCelestinePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("ZY5 Esperance"):setLocaleName(_("playerShip", "Esperance de Sainte Celestine")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(30000):setShortRangeRadarRange(12000)

function EsperancedeSainteCelestineTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.0125)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.125)

--Tourelle Bâbord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.125)

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(3, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(3, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(3, 0.125)

end

EsperancedeSainteCelestineTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
EsperancedeSainteCelestinePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
EsperancedeSainteCelestine()



-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -