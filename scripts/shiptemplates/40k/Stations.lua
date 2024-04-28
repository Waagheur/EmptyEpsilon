--[[Fichier de templates permettant la création des Stations.]]

--[[Le terme station spatiale recouvre un grand nombre d’installations orbitales pouvant aller des chantiers navals militaires ou commerciaux,
aux bases de recherche de l’Adeptus Mechanicus, en passant par des quartiers généraux de la Flotte, voire des habitations civiles.
Les plus grandes peuvent accueillir plusieurs vaisseaux de ligne militaires, tandis que les plus petites ne peuvent héberger qu’un croiseur ou un escadron d’escorteurs à la fois.
La plupart des ports sont contrôlés par la Flotte Impériale ou l’Adeptus Mechanicus,
bien que certains mondes soient responsables de leurs propres stations suite à un ancien accord.
Les stations spatiales sont imposantes, bien armées, et peuvent généralement assurer leur propre défense contre de petites flottes de pillards
en supportant le gros des combats autour de leur système.
Lors d’une guerre, le contrôle des stations capables de réparer et de réarmer des vaisseaux de guerre est d’une importance capitale,
et celles-ci deviennent rapidement le point de concentration de nombreuses offensives.]]

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création de la Station
function DockSpatial()

--Définition du vaisseau PNJ
function DockSpatialPNJ()

function DockSpatialCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Dock Spatial"):setLocaleName(_("ship", "Dock Spatial")):setClass(_("class", "Station"), _("subclass", "Dock")):setModel("Navy_Station")
template:setDescription(_([[Dock Spatial de grande taille.]]))
--template:setScale(3000)
template:setRadarTrace("hugestation.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.025)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(5000)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(500)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(3.6)
--Energie
template:setEnergyStorage(5000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(100, 5, 50, 100, 5)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Recharge les vaisseaux dockés en énergie
template:setSharesEnergyWithDocked(false)
--Répare les vaisseaux dockés
template:setRepairDocked(false)
--Recharge en missiles les vaisseaux dockés
template:setRestocksMissilesDocked(false)
--Dockage autorisé
template:setCanDock(false)
template:setLongRangeRadarRange(24000):setShortRangeRadarRange(24000)

end

DockSpatialCoque()

function DockSpatialTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 10000, 0.01, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 360, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
--template:setBeamWeaponTurret(1, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 360, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
--template:setBeamWeaponTurret(2, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.05)

--Tourelle Dorsale 3
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
--template:setBeamWeapon(3, 360, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(3, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 40)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.1)

--Tourelle Dorsale 4
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(4, 360, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
--template:setBeamWeaponTurret(4, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(4, 40)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(4, 0.1)

end

DockSpatialTourelles()

end

--Appel de la fonction créant le vaisseau PNJ
DockSpatialPNJ()

end

--Appel de la fonction créant la station PNJ
DockSpatial()

--Création de la Station
function StationWayfarer()

--Définition du vaisseau PNJ
function StationWayfarerPNJ()

function StationWayfarerCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Station Wayfarer"):setLocaleName(_("ship", "Station Wayfarer")):setClass(_("class", "Station"), _("subclass", "Wayfarer")):setModel("space_station_3")
template:setDescription(_([[Un modèle de petites stations spatiales conçues pour pouvoir fonctionner en autarcie quasi-complète à la frontière. Privées de contacts réguliers avec l'Imperium, beaucoup d'entre elles ont évolué en communautés commerciales indépendantes ou en dépôts de ravitaillement en carburant.]]))
--template:setScale(250)
template:setRadarTrace("mediumstation.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.015)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(3.6)
--Energie
template:setEnergyStorage(2000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(100, 5, 50, 100, 5)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Recharge les vaisseaux dockés en énergie
template:setSharesEnergyWithDocked(false)
--Répare les vaisseaux dockés
template:setRepairDocked(false)
--Recharge en missiles les vaisseaux dockés
template:setRestocksMissilesDocked(false)
--Dockage autorisé
template:setCanDock(false)
template:setLongRangeRadarRange(24000):setShortRangeRadarRange(24000)

end

StationWayfarerCoque()

function StationWayfarerTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 10000, 0.1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 360, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
--template:setBeamWeaponTurret(1, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 360, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
--template:setBeamWeaponTurret(2, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.05)

--Tourelle Dorsale 3
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 360, 0, 10000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
--template:setBeamWeaponTurret(3, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 40)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.1)

end

StationWayfarerTourelles()

end

--Appel de la fonction créant le vaisseau PNJ
StationWayfarerPNJ()

end

--Appel de la fonction créant la station PNJ
StationWayfarer()

--Création de la Station
function StationRelais()

--Définition du vaisseau PNJ
function StationRelaisPNJ()

function StationRelaisCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Station Relais"):setLocaleName(_("ship", "Station Relais")):setClass(_("class", "Station"), _("subclass", "Relais")):setModel("space_station_4")
template:setDescription(_([[Les station Relai sont de petites stations spatiales à la fonction très importante, car elles aident à la navigation en émettant un signal local, reconnaissable par les vaisseaux de la zone. Elles enregistrent également le passage des vaisseaux, en recevant et en relayant toutes les informations relatives à leur taille, leur trajectoire et leur signal d’immatriculation. En cas d’urgence, elles peuvent servir de radeau de sauvetage spatial et permettre à l’équipage d’un vaisseau en perdition de survivre jusqu’à ce qu’il soit possible de le secourir. Ces stations-balises possèdent ordinairement un petit équipage, mais certaines sont entièrement automatisées.]]))
--template:setScale(300)
template:setRadarTrace("smallstation.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.01)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(100)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(200)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(0, 5, 50, 0, 5)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Recharge les vaisseaux dockés en énergie
template:setSharesEnergyWithDocked(false)
--Répare les vaisseaux dockés
template:setRepairDocked(false)
--Recharge en missiles les vaisseaux dockés
template:setRestocksMissilesDocked(false)
--Dockage autorisé
template:setCanDock(false)
template:setLongRangeRadarRange(24000):setShortRangeRadarRange(24000)

end

StationRelaisCoque()

end

--Appel de la fonction créant le vaisseau PNJ
StationRelaisPNJ()

end

--Appel de la fonction créant la station PNJ
StationRelais()

--Création de la Station
function StationDefenseArcheotech()

--Définition du vaisseau PNJ
function StationDefenseArcheotechPNJ()

function StationDefenseArcheotechCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Station de Defense Archeotech"):setLocaleName(_("ship", "Station de Defense Archeotech")):setClass(_("class", "Station"), _("subclass", "Defense")):setModel("small_frigate_3")
template:setDescription(_([[Certaines stations de défenses de la région sont incroyablement anciennes, mais elles demeurent redoutables.]]))
template:setSecret(true)
--template:setScale(200)
template:setRadarTrace("")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.01)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(100)
--Energie
template:setEnergyStorage(200)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(0, 5, 0, 0, 5)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Recharge les vaisseaux dockés en énergie
template:setSharesEnergyWithDocked(false)
--Répare les vaisseaux dockés
template:setRepairDocked(false)
--Recharge en missiles les vaisseaux dockés
template:setRestocksMissilesDocked(false)
--Dockage autorisé
template:setCanDock(false)
template:setLongRangeRadarRange(24000):setShortRangeRadarRange(24000)

end

StationDefenseArcheotechCoque()

function StationDefenseArcheotechTourelles()

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 1, 0, 20000, 10, 20)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.05)

end

StationDefenseArcheotechTourelles()

end

--Appel de la fonction créant le vaisseau PNJ
StationDefenseArcheotechPNJ()

end

--Appel de la fonction créant la station PNJ
StationDefenseArcheotech()

--Création de la Station
function StationDefenseMacrocanon()

--Définition du vaisseau PNJ
function StationDefenseMacrocanonPNJ()

function StationDefenseMacrocanonCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Station de Defense a Macrocanon"):setLocaleName(_("ship", "Station de Defense a Macrocanon")):setClass(_("class", "Station"), _("subclass", "Defense")):setModel("small_frigate_3")
template:setDescription(_([[Les station de défense à Macrocanon sont un classique de la défense orbitale. Bien que relativement faibles, elles peuvent maintenir, avec un équipage minimum, un feu suffisamment nourri pour décourager tout vaisseau d'une classe inférieure aux croiseurs. Elles demandent cependant a être correctement approvisionnées en munitions.]]))
--template:setScale(200)
template:setRadarTrace("exuari_5.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.01)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(100)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(200)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(0, 5, 0, 0, 5)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Recharge les vaisseaux dockés en énergie
template:setSharesEnergyWithDocked(false)
--Répare les vaisseaux dockés
template:setRepairDocked(false)
--Recharge en missiles les vaisseaux dockés
template:setRestocksMissilesDocked(false)
--Dockage autorisé
template:setCanDock(false)
template:setLongRangeRadarRange(24000):setShortRangeRadarRange(24000)

end

StationDefenseMacrocanonCoque()

function StationDefenseMacrocanonMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(1, 6)

--Macrocanons
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK0", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK0", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK0", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK0", 1, 1)

end

StationDefenseMacrocanonMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
StationDefenseMacrocanonPNJ()

end

--Appel de la fonction créant la station PNJ
StationDefenseMacrocanon()

--Création de la Station
function StationDefenseLance()

--Définition du vaisseau PNJ
function StationDefenseLancePNJ()

function StationDefenseLanceCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Station de Defense a Lance Siderale"):setLocaleName(_("ship", "Station de Defense a Lance Siderale")):setClass(_("class", "Station"), _("subclass", "Defense")):setModel("small_frigate_3")
template:setDescription(_([[Les station de défense à Lance Sidérale est une version supérieure, bien que plus fragile et coûteuse, de son homologue à Macrocanon. La station à Lance peut déployer un feu plus concentré suffisant pour endommager les boucliers et attaquer le blindage des Croiseurs, et ce sans ravitailler grâce au réacteur alimentant leurs armes. Cependant, elles nécessitent un entretien constant et ont besoin d'un soutien pour déployer toute leur efficacité, ce qui fait qu'on ne les retrouve généralement qu'au milieu des stations à Macrocanon, les deux modèles combinant feu nourri et puissance d'impact forte.]]))
--template:setScale(200)
template:setRadarTrace("exuari_5.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.01)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(100)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(200)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(0, 5, 0, 0, 5)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Recharge les vaisseaux dockés en énergie
template:setSharesEnergyWithDocked(false)
--Répare les vaisseaux dockés
template:setRepairDocked(false)
--Recharge en missiles les vaisseaux dockés
template:setRestocksMissilesDocked(false)
--Dockage autorisé
template:setCanDock(false)
template:setLongRangeRadarRange(24000):setShortRangeRadarRange(24000)

end

StationDefenseLanceCoque()

function StationDefenseLanceTourelles()

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 1, 0, 15000, 10, 20)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.05)

end

StationDefenseLanceTourelles()

end

--Appel de la fonction créant le vaisseau PNJ
StationDefenseLancePNJ()

end

--Appel de la fonction créant la station PNJ
StationDefenseLance()
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -