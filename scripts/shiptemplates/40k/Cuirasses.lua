--[[Fichier de templates permettant la création des Cuirassés.]]

--[[Les Cuirassés sont d’énormes vaisseaux, avec une quantité colossale d’armes et de puissants boucliers,
servant généralement de vaisseau amiral à la flotte, bien que ce ne soit pas toujours le cas.
Bien que très puissants, les Cuirassés sont très lents à manœuvrer et ne peuvent pas réagir rapidement face à des ennemis qui changent rapidement de trajectoire.
Les Cuirassés Impériaux peuvent avoir des équipages allant de 25 000 à 3 000 000 ou plus, incluant un grand nombre de combattants de la marine impériale
pour se défendre contre les abordages ennemis.
Les Cuirassés peuvent mesurer jusqu’à 8 kilomètres de la proue à la poupe et peser des milliards de tonnes.
Parce qu’ils représentent une telle dépense de ressources et nécessitent une structure technique assez avancée,
ils ne sont généralement construits que dans les plus grands chantiers navals situés au-dessus des grands Mondes-Forges de l’Adeptus Mechanicus.
Ces navires sont des biens précieux et sont soigneusement entretenus, généralement utilisés uniquement dans les grandes flottes.]]

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function CuirasseEmperor()

--Définition du vaisseau PNJ
function CuirasseEmperorPNJ()

function CuirasseEmperorCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Cuirasse Emperor"):setLocaleName(_("ship", "Cuirasse Emperor")):setClass(_("class", "Cuirasse"), _("subclass", "Emperor")):setModel("Eternal_Crusader_Battlebarge")
template:setDescription(_([[Les Cuirassés de Classe Emperor comptent parmi les plus vieux vaisseaux de la Flotte. Embarquant un nombre considérable d'appareils d'attaque, ils se placent généralement en retrait des combats pour servir de porte-chasseur, laissant les autres vaisseaux engager directement l'ennemi.]]))
--template:setScale(485)
template:setRadarTrace("dread.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.012)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(1200)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(3.6)
--Energie
template:setEnergyStorage(2000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(75, 2.4, 1.3, 9.375, 2.4)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CuirasseEmperorCoque()

function CuirasseEmperorTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.2, 1)
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

end

CuirasseEmperorTourelles()

function CuirasseEmperorMissiles()
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

--Macrocanons Bâbords
--Direction (Index,Direction)
template:setTubeDirection(1, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanons Tribords
--Direction (Index,Direction)
template:setTubeDirection(2,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Hangars Bâbords 1
--Direction (Index,Direction)
template:setTubeDirection(3, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Hangars Bâbords 2
--Direction (Index,Direction)
template:setTubeDirection(4, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(4, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(4, "small")

--Hangars Tribords 1
--Direction (Index,Direction)
template:setTubeDirection(5,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(5, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(5, "small")

--Hangars Tribords 2
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
template:setCustomWeapon("HVLI", "MCANMK4", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK4", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK4", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK4", 3, 4)

--Définition des chasseurs
--Définition des chasseurs (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Chasseurs", 0.5, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Chasseurs", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Chasseurs", 120)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Chasseurs",1,2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Torpille")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(3,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(4,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(5,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(6,"Chasseurs")

end

CuirasseEmperorMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CuirasseEmperorPNJ()

--Création du vaisseau PJ
function CuirasseEmperorPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Emperor"):setLocaleName(_("playerShip", "Cuirasse Emperor")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(3.6)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(105000):setShortRangeRadarRange(42000)

function CuirasseEmperorTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.2, 1)
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

end

CuirasseEmperorTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CuirasseEmperorPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CuirasseEmperor()

--Création du vaisseau
function CuirasseRetribution()

--Définition du vaisseau PNJ
function CuirasseRetributionPNJ()

function CuirasseRetributionCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Cuirasse Retribution"):setLocaleName(_("ship", "Cuirasse Retribution")):setClass(_("class", "Cuirasse"), _("subclass", "Retribution")):setModel("Eternal_Crusader_Battlebarge")
template:setDescription(_([[La proue blindée traditionnelle et leurs moteurs à plasma multi-tubes désignent les plus anciens Cuirassés de classe Retribution comme étant issus des forges de Mars. Très lourdement armés, ils apportent au combat un feu particulièrement nourri redouté à juste titre par les ennemis de l'Imperium.]]))
--template:setScale(485)
template:setRadarTrace("dread.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.016)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(1100)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(3.6)
--Energie
template:setEnergyStorage(2000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(100, 3.2, 2.3, 12.5, 3.2)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CuirasseRetributionCoque()

function CuirasseRetributionTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.25, 1)
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

end

CuirasseRetributionTourelles()

function CuirasseRetributionMissiles()
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
template:setCustomWeapon("HVLI", "MCANMK4", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK4", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK4", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK4", 3, 4)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Torpille")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(5,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(6,"MCANMK4")

end

CuirasseRetributionMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CuirasseRetributionPNJ()

--Création du vaisseau PJ
function CuirasseRetributionPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Retribution"):setLocaleName(_("playerShip", "Cuirasse Retribution")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(3.6)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(75000):setShortRangeRadarRange(30000)

function CuirasseRetributionTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.25, 1)
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

end

CuirasseRetributionTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CuirasseRetributionPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CuirasseRetribution()

--Création du vaisseau
function CuirasseApocalypse()

--Définition du vaisseau PNJ
function CuirasseApocalypsePNJ()

function CuirasseApocalypseCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Cuirasse Apocalypse"):setLocaleName(_("ship", "Cuirasse Apocalypse")):setClass(_("class", "Cuirasse"), _("subclass", "Apocalypse")):setModel("Eternal_Crusader_Battlebarge")
template:setDescription(_([[La classe Apocalypse est un ancien modèle, apparemment précurseur des Cuirassés de Classe Retribution en service depuis des millénaires. La technologie avancée requise pour la construction des nombreuses pièces d’artillerie navale que comprennent les Cuirassés Apocalypse a depuis longtemps été perdue, les rares exemplaires de ce type de vaisseau ne pourront donc jamais être remplacés et la perte d’un seul de ces cuirassés serait un rude coup porté à l’arsenal impérial. Les stratèges impériaux ont émis l’hypothèse qu’ils ont été conçus pour contrer le nombre croissant de raids en provenance de l’Œil de la Terreur. Dans cette optique, l’Apocalypse a fait plus d’une fois la démonstration de son efficacité. Le nombre effrayant de pièces d’artillerie navale qui ornent leurs flancs caractérise les cuirassés de Classe Apocalypse. Ces batteries sont capables d’atteindre des cibles à plus longue portée que des navires plus récents par un procédé augmentant la capacité de stockage des relais de puissance. Toutefois, ce système est notoirement peu fiable lorsque trop sollicité, et des relais défectueux peuvent drainer l’énergie des moteurs principaux du vaisseau, ralentissant le Cuirassé Apocalypse en pleine bataille. C’est la raison pour laquelle tous les Cuirassés Apocalypse existants se concentrent sur des cibles à portée moyenne. La plupart des flottes de Segmentum ont au moins quelques exemplaires de cuirassés Apocalypse opérationnels, bien que leur nombre diminue continuellement.]]))
--template:setScale(485)
template:setRadarTrace("dread.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.016)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(1200)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(3.6)
--Energie
template:setEnergyStorage(2000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(75, 2.4, 1.3, 9.375, 2.4)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CuirasseApocalypseCoque()

function CuirasseApocalypseTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.2, 1)
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

--Tourelle Bâbord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

--Tourelle Bâbord 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(3, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.1)

--Tourelle Bâbord 3
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(4, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(4, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(4, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(4, 0.1)

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(5, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(5, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(5, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(5, 0.1)

--Tourelle Tribord 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(6, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(6, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(6, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(6, 0.1)

--Tourelle Tribord 3
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(7, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(7, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(7, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(7, 0.1)

end

CuirasseApocalypseTourelles()

function CuirasseApocalypseMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(1, 60)

--Canon Nova
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 60)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "large")

--Définition du canon nova
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Canon Nova", 1, 6400.0, "Kinetic", 10)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Canon Nova", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Canon Nova", 6)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Canon Nova",1,1)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Canon Nova")

end

CuirasseApocalypseMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CuirasseApocalypsePNJ()

--Création du vaisseau PJ
function CuirasseApocalypsePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Apocalypse"):setLocaleName(_("playerShip", "Cuirasse Apocalypse")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(3.6)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(75000):setShortRangeRadarRange(30000)

function CuirasseApocalypseTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.2, 1)
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

--Tourelle Bâbord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

--Tourelle Bâbord 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(3, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(3, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(3, 0.1)

--Tourelle Bâbord 3
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(4, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(4, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(4, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(4, 0.1)

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(5, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(5, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(5, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(5, 0.1)

--Tourelle Tribord 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(6, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(6, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(6, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(6, 0.1)

--Tourelle Tribord 3
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(7, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(7, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(7, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(7, 0.1)

end

CuirasseApocalypseTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CuirasseApocalypsePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CuirasseApocalypse()

--Création du vaisseau
function CuirasseOberon()

--Définition du vaisseau PNJ
function CuirasseOberonPNJ()

function CuirasseOberonCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Cuirasse Oberon"):setLocaleName(_("ship", "Cuirasse Oberon")):setClass(_("class", "Cuirasse"), _("subclass", "Oberon")):setModel("Eternal_Crusader_Battlebarge")
template:setDescription(_([[Les Cuirassés de Classe Oberon sont une variante ancienne et très rare de la classe Emperor et ont été peu à peu retirés du service actif en raison de l’efficacité jamais démentie de leur illustre prédécesseur. L’Oberon procède d’une tentative de concevoir un Cuirassé capable en théorie de traiter toute menace sans avoir recours à des escorteurs. Bien qu’il n’ait pas la même capacité à saturer l’espace d’appareils d’attaque qu’un Emperor, l’Oberon possède la puissance de feu à longue portée de son glorieux ancêtre, grâce à l’ajout notable de deux pièces d’artillerie navales de grande puissance de chaque côté de sa coque. Utilisé le plus souvent avec peu ou pas d’escorteurs pour les patrouilles en territoire dangereux, l’Oberon est taillé pour ce rôle. Grâce à des systèmes de détection à longue portée performants, son capitaine peut en effet évaluer la gravité d’une menace éventuelle et décider de la réponse appropriée avant même que l’ennemi ne décèle la présence du Cuirassé. Au combat, l’Oberon n’a ni la même capacité à porter des coups décisifs à l’adversaire que le Retribution ou l’Apocalypse, ni la possibilité de déployer autant d’appareils d’attaque qu’un Cuirassé de Classe Emperor, mais il a néanmoins prouvé qu’il était à même de vaincre n’importe quel type de vaisseau.]]))
--template:setScale(510)
template:setRadarTrace("dread.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.012)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(1200)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(3.6)
--Energie
template:setEnergyStorage(2000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(75, 2.4, 1.6, 9.375, 2.4)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CuirasseOberonCoque()

function CuirasseOberonTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.2, 1)
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

--Tourelle Lourde Bâbord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 270, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.15)

--Tourelle Lourde Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 1, 90, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(3, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.15)

--Tourelle Bâbord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(4, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(4, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(4, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(4, 0.1)

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(5, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(5, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(5, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(5, 0.1)

end

CuirasseOberonTourelles()

function CuirasseOberonMissiles()
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
template:setCustomWeapon("HVLI", "MCANMK3", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK3", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK3", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK3", 1, 4)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Torpille")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(5,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(6,"MCANMK3")

end

CuirasseOberonMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CuirasseOberonPNJ()

--Création du vaisseau PJ
function CuirasseOberonPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Oberon"):setLocaleName(_("playerShip", "Cuirasse Oberon")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(3.6)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(105000):setShortRangeRadarRange(42000)

function CuirasseOberonTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.2, 1)
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

--Tourelle Lourde Bâbord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 270, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.15)

--Tourelle Lourde Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(3, 1, 90, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(3, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(3, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(3, 0.15)

--Tourelle Bâbord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(4, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(4, 90, 270, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(4, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(4, 0.1)

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(5, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(5, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(5, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(5, 0.1)


end

CuirasseOberonTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CuirasseOberonPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CuirasseOberon()

--Création du vaisseau
function ArcheMechanicus()

--Définition du vaisseau PNJ
function ArcheMechanicusPNJ()

function ArcheMechanicusCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Arche Mechanicus"):setLocaleName(_("ship", "Arche Mechanicus")):setClass(_("class", "Cuirasse"), _("subclass", "Arche Mechanicus")):setModel("Adeptus_Mechanicus_Battleship")
template:setDescription(_([[Une Arche Mechanicus est une relique sans prix de l'Adeptus Mechanicu, un vaisseau antique normalement destiné à évoluer de manière autonome sur le chemin de la Quête du Savoir. Ces vaisseaux, tous uniques en leur genre, sont généralement classés comme des cuirassés, bien que leur rôle soit bien différent et qu'ils ne voient que rarement le champ de bataille. En effet, même quand ils accompagnent une croisade, ils sont trop précieux pour participer aux combats et ne s'aventurent sur le champ de bataille que lorsque l'ennemi a été vaincu, pour récupérer les épaves et les débris spatiaux qui serviront de matière première pour combler les pertes Impériales.]]))
--template:setScale(850)
template:setRadarTrace("dread.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.025)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(1600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(200)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(6)
--Energie
template:setEnergyStorage(4000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(50, 0.8, 1, 6.25, 0.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

ArcheMechanicusCoque()

function ArcheMechanicusTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.2, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.15)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.15)

--Tourelle Babord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 1, 270, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(3, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.15)

--Tourelle Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(4, 1, 90, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(4, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(4, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(4, 0.15)

end

ArcheMechanicusTourelles()

function ArcheMechanicusMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(3, 60)

--Canon Nova
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 60)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "large")

--Macrocanons Bâbords
--Direction (Index,Direction)
template:setTubeDirection(1, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanons Tribords
--Direction (Index,Direction)
template:setTubeDirection(2,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Définition des torpilles

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
template:setCustomWeapon("HVLI", "MCANMK4", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK4", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK4", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK4", 3, 4)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Canon Nova")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK4")


end

ArcheMechanicusMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
ArcheMechanicusPNJ()

--Création du vaisseau PJ
function ArcheMechanicusPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Arche"):setLocaleName(_("playerShip", "Arche Mechanicus")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(6)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(105000):setShortRangeRadarRange(42000)

function ArcheMechanicusTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.2, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.15)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.15)

--Tourelle Babord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 1, 270, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(3, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.15)

--Tourelle Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(4, 1, 90, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(4, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(4, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(4, 0.15)

end

ArcheMechanicusTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
ArcheMechanicusPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
ArcheMechanicus()
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -