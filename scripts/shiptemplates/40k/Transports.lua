--[[Fichier de templates permettant la création des vaisseaux de transport]]

--[[Les vaisseaux de transport se spécialisent généralement soit dans le transport de voyageurs, soit le transport de biens.
Généralement de la taille d’une grande frégate ou d’un petit croiseur, mais parfois bien plus grands, ils se contentent généralement de trajets entres planètes d’importance
et d’assurer les liaisons trans-système à courte portée. Les Cargos, notamment, sont des vaisseaux de la taille d’un cuirassé dont les soutes sont tellement immenses
que le déchargement à lui seul peut prendre une année entière, et apporte la prospérité à une planète pour des décennies.
La plupart des transports, n’ayant pas les moyens de se payer les services d’un Navigator, naviguent à l’aide de cartes warp régulièrement mises à jour,
sur des routes warp connues et stables, et généralement assez lentement.]]


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function PelerinJericho()

--Définition du vaisseau PNJ
function PelerinJerichoPNJ()

function PelerinJerichoCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Vaisseau Pélerin Jericho"):setLocaleName(_("ship", "Vaisseau Pélerin Jericho")):setClass(_("class", "Transport"), _("subclass", "Jéricho")):setModel("Civilian_Transport_Ship")
template:setDescription(_([[Les gigantesques vaisseaux pèlerins Jericho sont des vaisseaux raffineurs reconvertis. Leurs immenses réservoirs sont transformés en centaines de compartiments pour passagers et un seul vaisseau peut accueillir à son bord plusieurs milliers de fidèles. La qualité de l’hébergement varie. Pour ceux qui ont des trônes, le voyage peut être relativement plaisant, mais la plupart doivent se contenter d’une couchette à fond de cale et de rations recyclées. Un Jericho peut également être réaménagé pour faire du transport de marchandises. Ces vaisseaux sont massifs, lents et peu maniables. La plupart sont équipés de quelques canons pour décourager les pirates, encore que ceux-ci préfèrent généralement s’attaquer à des cibles plus alléchantes.]]))
--template:setScale(112.5)
template:setRadarTrace("blockade.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.012)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(500)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(75, 2.4, 1.6, 9.375, 2.4)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
--template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

PelerinJerichoCoque()

function PelerinJerichoTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

end

PelerinJerichoTourelles()

function PelerinJerichoMissiles()
--Nombre de tubes et temps de chargement
template:setTubes(3, 6)

--Définition du macrocanon avant
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Définition du macrocanon bâbord
--Direction (Index,Direction)
template:setTubeDirection(1, 270)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Définition du macrocanon tribord
--Direction (Index,Direction)
template:setTubeDirection(2, 90)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK1", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK1", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK1", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK1", 1, 2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"MCANMK1")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK1")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK1")

end

PelerinJerichoMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
PelerinJerichoPNJ()

--Création du vaisseau PJ
function PelerinJerichoPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Pelerin"):setLocaleName(_("playerShip", "Vaisseau Pélerin Jericho")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(15000):setShortRangeRadarRange(6000)

function PelerinJerichoTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

end

PelerinJerichoTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
PelerinJerichoPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
PelerinJericho()

--Création du vaisseau
function MarchandVagabond()

--Définition du vaisseau PNJ
function MarchandVagabondPNJ()

function MarchandVagabondCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Vaisseau Marchand Vagabond"):setLocaleName(_("ship", "Vaisseau Marchand Vagabond")):setClass(_("class", "Transport"), _("subclass", "Vagabond")):setModel("Civilian_Transport_Ship")
template:setDescription(_([[Les Vagabond sont des petits vaisseaux marchands polyvalents, capables de transporter des cargaisons variées aussi bien que des passagers. Populaires auprès des Capitaines Chartistes les moins riches, ces bâtiments sobres et fiables sont capables d’accueillir quelques batteries pour assurer leur défense.]]))
--template:setScale(100)
template:setRadarTrace("adv_gunship.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.013)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(400)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(100, 3.2, 2.1, 12.5, 3.2)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
--template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("default")

end

MarchandVagabondCoque()

function MarchandVagabondTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 0, 1000, 1, 1)
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
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

end

MarchandVagabondTourelles()

function MarchandVagabondMissiles()
--Nombre de tubes et temps de chargement
template:setTubes(1, 6)

--Définition des lance missiles
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK1", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK1", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK1", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK1", 1, 2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"MCANMK1")

end

MarchandVagabondMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
MarchandVagabondPNJ()

--Création du vaisseau PJ
function MarchandVagabondPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Vagabond"):setLocaleName(_("playerShip", "Vaisseau Marchand Vagabond")):setType("playership")
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(30000):setShortRangeRadarRange(12000)

function MarchandVagabondTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 0, 1000, 1, 1)
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
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

end

MarchandVagabondTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
MarchandVagabondPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
MarchandVagabond()

--Création du vaisseau
function NavireLoki()

--Définition du vaisseau PNJ
function NavireLokiPNJ()

function NavireLokiCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Navire Loki"):setLocaleName(_("ship", "Navire Loki")):setClass(_("class", "Transport"), _("subclass", "Loki")):setModel("Civilian_Transport_Ship")
template:setDescription(_([[La classe Loki est en fait une classe « fourre-tout » de plusieurs types de transports différents qui ont été modifiés en tant que "Q-ships". Bien que la Marine ait le devoir sacré de protéger le commerce impérial, il y a trop de voies commerciales à défendre et trop peu de navires de guerre pour le faire. En outre, de nombreux maraudeurs pirates resteront loin des convois lourdement défendus, attendant des proies plus faibles. Les "Q-ships" offrent à l’Imperium un moyen de transformer les prédateurs en proie. Déguisés en marchands impuissants, ils embarquent en fait de puissantes macrobatteries et même des lances sidérales. Leur tactique préférée est de capituler à la première vue d’un pirate, feignant de se rendre sans se battre. Quand le Raider est assez proche, ils sortent leurs armes et leur tirent dessus à bout portant. Bien que cela permette souvent de vaincre leurs adversaires en une seule fois, la plupart des navires de la classe Loki restent aussi lents et lourds que les autres marchands, et peinent à tenir un combat soutenu.]]))
--template:setScale(100)
template:setRadarTrace("adv_gunship.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.013)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(400)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(100, 3.2, 3, 12.5, 3.2)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
--template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

NavireLokiCoque()

function NavireLokiTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 0, 1000, 1, 1)
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
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

end

NavireLokiTourelles()

function NavireLokiMissiles()
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
template:setCustomWeaponStorage("Torpille", 12)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Torpille",1,2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Torpille")

end

NavireLokiMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
NavireLokiPNJ()

--Création du vaisseau PJ
function NavireLokiPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Loki"):setLocaleName(_("playerShip", "Navire Loki")):setType("playership")
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(30000):setShortRangeRadarRange(12000)

function NavireLokiTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 0, 1000, 1, 1)
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
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

end

NavireLokiTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
NavireLokiPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
NavireLoki()

--Création du vaisseau
function CoursierOrion()

--Définition du vaisseau PNJ
function CoursierOrionPNJ()

function CoursierOrionCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Coursier Stellaire Orion"):setLocaleName(_("ship", "Coursier Stellaire Orion")):setClass(_("class", "Transport"), _("subclass", "Orion")):setModel("Civilian_Transport_Ship")
template:setDescription(_([[Les Orions sont quelque peu rares parmi les vaisseaux de l’Imperium, car il s'agit de vaisseaux de transport rapide (ou coursiers stellaires). Bien qu’ils soient conçus pour le fret, leurs forme allongée, leurs lignes épurées et leurs moteurs puissants sont moins optimisés pour le transport de fret que pour la vitesse. Les vaisseaux de la classe Orion sont construits pour transporter de petites cargaisons de grande valeur qui doivent atteindre leur destination rapidement ou en territoire hostile. Plutôt que de compter sur des escortes armées, les Orions voyagent seuls. Ils font confiance à leur rapidité pour leur permettre de distancer plupart des prédateurs, et comptent sur leurs armes pour repousser ceux assez rapide pour les suivre. Bien qu'ils engrangent de nombreux succès, les Orions ont un inconvénient majeur. Les cloisons internes redondantes et le blindage extérieur qui seraient normalement ajoutés aux navires plus classiques ont été abandonnés afin d’augmenter la vitesse et la capacité de fret. En conséquence, quelques coups bien placés peuvent facilement paralyser un Orion.]]))
--template:setScale(150)
template:setRadarTrace("adv_gunship.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.012)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(350)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(250, 8, 5.4, 31.25, 8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
--template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

CoursierOrionCoque()

function CoursierOrionTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 0, 1000, 1, 1)
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

--Tourelle de Carène
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

end

CoursierOrionTourelles()

function CoursierOrionMissiles()

end

CoursierOrionMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CoursierOrionPNJ()

--Création du vaisseau PJ
function CoursierOrionPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Orion"):setLocaleName(_("playerShip", "Coursier Stellaire Orion")):setType("playership")
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(30000):setShortRangeRadarRange(12000)

function CoursierOrionTourellesPJ()
--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle de Carène
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

end

CoursierOrionTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CoursierOrionPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CoursierOrion()

--Création du vaisseau
function TransportCarrack()

--Définition du vaisseau PNJ
function TransportCarrackPNJ()

function TransportCarrackCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Vaisseau Carrack"):setLocaleName(_("ship", "Vaisseau Carrack")):setClass(_("class", "Transport"), _("subclass", "Carrack")):setModel("Civilian_Transport_Ship")
template:setDescription(_([[Parmi les millions de mondes de l’Imperium de l’Humanité, il y a beaucoup plus de navires marchands et de transports lourds qu’il n’y aura jamais de navires de guerre de la Marine Impériale. Les transports lourds en particulier peuvent être de toutes tailles et formes, et sont généralement construits de sorte que la forme suive la fonction. Par exemple, les Carrack conçus pour le transport de minerais ou de denrées alimentaires en vrac seront sensiblement différents de ceuxs conçus pour le transport de cargaisons compartimentées, conteneurisées, de munitions ou d’engins d’attaque de rechange pour les flottes opérant près des zones de guerre. Même les pétroliers n’ont pas besoin de transporter des cargaisons dangereuses ou inflammables; dans les mondes désertiques, l’eau est aussi rare et précieuse qu’une perle de prix. Chaque flotte de Libre-Marchand est soutenue par des dizaines de ces navires marchands, qu’ils utilisent pour transporter des fournitures et des marchandises commerciales à travers le vide interstellaire. Dans les zones de guerre, il est également courant de les « consulter » pour convertir leurs cargo en transports de troupes. Bien qu’ils ne soient pas normalement utilisés de cette manière, chaque Carrack peut transporter des dizaines de milliers d’hommes ainsi que des milliers de chars ou de véhicules de soutien. Ils peuvent même transporter des Titans de l'Adeptus Mechanicus ou assez de munitions pour fournir une armée entière. En dans de tels cas, la plupart des commandants de flotte assignent des navires d’escorte à un escadron de Carrack, car la perte d’un de ces navires pendant un assaut planétaire peut avoir d’énormes répercussions à long terme sur une campagne. Au-delà de cela, il y a une myriade d’autres rôles pour les navires marchands lourds, y compris les opérations de réparation et de sauvetage de l’espace lointain, ou même simplement une soute mobile pour les marchandises et les trésors « libérés » des convois commerciaux ennemis.]]))
--template:setScale(105)
template:setRadarTrace("adv_gunship.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.015)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(450)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(100, 3.2, 2.3, 12.5, 3.2)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
--template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("default")

end

TransportCarrackCoque()

function TransportCarrackTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 0, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.05)

end

TransportCarrackTourelles()

function TransportCarrackMissiles()

end

TransportCarrackMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
TransportCarrackPNJ()

--Création du vaisseau PJ
function TransportCarrackPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Carrack"):setLocaleName(_("playerShip", "Vaisseau Carrack")):setType("playership")
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(30000):setShortRangeRadarRange(12000)

function TransportCarrackTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 0, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.05)

end

TransportCarrackTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
TransportCarrackPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
TransportCarrack()

--Création du vaisseau
function UsineGoliath()

--Définition du vaisseau PNJ
function UsineGoliathPNJ()

function UsineGoliathCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Vaisseau-Usine Goliath"):setLocaleName(_("ship", "Vaisseau-Usine Goliath")):setClass(_("class", "Transport"), _("subclass", "Goliath")):setModel("Adeptus_Mechanicus_cruiser")
template:setDescription(_([[Les navires-usines de classe Goliath sont des navires de l'Adeptus Mechanicus, des vaisseaux gigantesques de traitement de l’énergie qui récoltent l’essence même des étoiles. Ils dévorent le plasma solaire pour alimenter leurs propres dispositifs techno-arcaniques de production de combustible, afin d’assouvir la faim sans fin des mondes-ruches de l’Imperium. Plus grands encore que les Jericho, ils sont fragiles et potentiellement explosifs, traités avec beaucoup de respect et de prudence par les équipages qui en croisent, étant donné leur propension à détonner dans des explosions catastrophiques qui sont capables de souffler l’atmosphère de mondes entiers.]]))
--template:setScale(225)
template:setRadarTrace("adv_gunship.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.014)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(500)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(5000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(75, 2.4, 1.5, 3.375, 2.4)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
--template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("default")

end

UsineGoliathCoque()

function UsineGoliathTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 0, 1000, 1, 1)
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
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

end

UsineGoliathTourelles()

function UsineGoliathMissiles()
--Nombre de tubes et temps de chargement
template:setTubes(2, 6)

--Définition des macrocanons Babord
--Direction (Index,Direction)
template:setTubeDirection(0, 270)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Définition des macrocanons Tribord
--Direction (Index,Direction)
template:setTubeDirection(1, 90)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK1", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK1", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK1", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK1", 1, 2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"MCANMK1")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK1")

end

UsineGoliathMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
UsineGoliathPNJ()

--Création du vaisseau PJ
function UsineGoliathPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Goliath"):setLocaleName(_("playerShip", "Vaisseau-Usine Goliath")):setType("playership")
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(12000):setShortRangeRadarRange(4800)

function UsineGoliathTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 0, 1000, 1, 1)
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
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

end

UsineGoliathTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
UsineGoliathPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
UsineGoliath()

--Création du vaisseau
function TransportUniverse()

--Définition du vaisseau PNJ
function TransportUniversePNJ()

function TransportUniverseCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Transporteur Lourd Universe"):setLocaleName(_("ship", "Transporteur Lourd Universe")):setClass(_("class", "Transport"), _("subclass", "Universe")):setModel("Civilian_Transport_Cruiser")
template:setDescription(_([[Parmi les myriades de vaisseaux qui desservent les voies commerciales, certains des plus grands sont les Transporteurs Lourds. S’étendant sur une douzaine de kilomètres de la proue à la poupe, un Transport Lourd pourrait apparaitre mince et élégant vu de loin. Cependant, à mesure qu’on s’en approche lentement, cette impression trompeuse est remplacée par une crainte horrifiée, car ce qui semble être des mâts radio se transforme en gigantesques tours de la taille de cités-ruches. L’échelle réelle du navire se manifeste quand l'observateur réalise que des villes entières scintillent le long de ses flancs. Construire un Transporteur Lourd de classe Universe est une entreprise colossale. Pour construire un, il faut des ressources si immenses qu’ils ne sont bâtis qu’au-dessus des mondes et des station impériales les plus riches. Ce sont de purs transporteurs de marchandises, de conception relativement simple, mais a une échelle gargantuesque. Ce sont des mondes presque autonomes, où des communautés spatiales entières vivent leur vie, insensibles aux motivations ou à l’identité des propriétaires actuels du navire. Le simple déchargement du navire est une entreprise colossale qui exige des mois de labeur.]]))
--template:setScale(600)
template:setRadarTrace("transport.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.012)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(650)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(2000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(50, 0.8, 0.5, 6.25, 0.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
--template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("default")

end

TransportUniverseCoque()

function TransportUniverseTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 0, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

end

TransportUniverseTourelles()

function TransportUniverseMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(4, 30)

--Macrocanons Bâbords 1
--Direction (Index,Direction)
template:setTubeDirection(0, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Macrocanons Bâbords 2
--Direction (Index,Direction)
template:setTubeDirection(1, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanons Tribords 1
--Direction (Index,Direction)
template:setTubeDirection(2,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Macrocanons Tribords 2
--Direction (Index,Direction)
template:setTubeDirection(3,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

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
template:setWeaponTubeExclusiveForCustom(0,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK2")

end

TransportUniverseMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
TransportUniversePNJ()

--Création du vaisseau PJ
function TransportUniversePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Universe"):setLocaleName(_("playerShip", "Transporteur Lourd Universe")):setType("playership")
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(15000):setShortRangeRadarRange(6000)

function TransportUniverseTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 0, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

end

TransportUniverseTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
TransportUniversePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
TransportUniverse()
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -