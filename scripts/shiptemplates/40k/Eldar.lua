--[[Fichier de templates pour tester les différentes classes de vaisseaux pour De Verve et D'Acier]]


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function RaiderShadowhunter()

--Définition du vaisseau PNJ
function RaiderShadowhunterPNJ()

function RaiderShadowhunterCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Raider Shadowhunter"):setLocaleName(_("ship", "Raider Shadowhunter")):setClass(_("class", "Escorteur"), _("subclass", "Shadowhunter")):setModel("Eldar_Corsair_Fighter")
template:setDescription(_([[Le Shadowhunter est le plus petit type de navire employé par les Eldars. Ils peuvent opèrent généralement en meute, protégeant l’approche des navires amis qui s'approchent des plus gros vaisseaux ou tournoyant autour d'eux a une vitesse effroyable pour repousser les éventuels attaquants potentiels. En raison de ce rôle défensif, les Shadowhunters ont une portée très limitée. Les armes et les systèmes d’alimentation des Shadowhunters sont compacts, ce qui en fait l’un des vaisseaux Eldar les plus agiles, même selon leurs propres normes. Les Shadowhunters sont si agiles, en fait, qu’ils sont capables de poursuivre leur cible si finement que même les engins d’attaque ennemis trouvent difficile de les échapper.]]))
--template:setScale(40)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.014)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(150)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(375, 12, 10, 46.875, 12)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(750, 375)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

RaiderShadowhunterCoque()

function RaiderShadowhunterTourelles()

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.1)

end

RaiderShadowhunterTourelles()

function RaiderShadowhunterMissiles()

end

RaiderShadowhunterMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
RaiderShadowhunterPNJ()

--Création du vaisseau PJ
function RaiderShadowhunterPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Shadowhunter"):setLocaleName(_("playerShip", "Raider Shadowhunter")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(60000):setShortRangeRadarRange(24000)

function RaiderShadowhunterTourellesPJ()

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.1)

end

RaiderShadowhunterTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
RaiderShadowhunterPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
RaiderShadowhunter()

--Création du vaisseau
function FregateHellebore()

--Définition du vaisseau PNJ
function FregateHelleborePNJ()

function FregateHelleboreCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Fregate Hellebore"):setLocaleName(_("ship", "Fregate Hellebore")):setClass(_("class", "Fregate"), _("subclass", "Hellebore")):setModel("Eldar_Corsair_Bomber")
template:setDescription(_([[Peut-être l’Escorteur le plus lourdement armé qui soit, l’Hellebore est l’incarnation de la philosophie militaire des Asuryanis et de leur supériorité technologique. Bien qu’incapable de résister à de gros dommages, elle est dotée d’un système d’armement équivalent à celui d’un Croiseur Léger Impérial et peut infliger des dommages conséquents à des vaisseaux bien plus grands. Lorsqu’elle est déployée en escadrons, l’Hellebore est un mélange fatal de vitesse, de maniabilité et de puissance de frappe, combinant les capacités longue portée des torpilles à la solide puissance de feu d’une pièce d’artillerie Pulsar et de batteries laser. Les Hellebores excellent lors des embuscades, et peuvent disperser une formation ennemie avec leurs salves de torpilles, avant d’attaquer en nombre les traînards.]]))
--template:setScale(70)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.014)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(180)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(350, 10.72, 9.5, 43.75, 10.72)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(700, 350)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

FregateHelleboreCoque()

function FregateHelleboreTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

FregateHelleboreTourelles()

function FregateHelleboreMissiles()

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

FregateHelleboreMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
FregateHelleborePNJ()

--Création du vaisseau PJ
function FregateHelleborePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Hellebore"):setLocaleName(_("playerShip", "Fregate Hellebore")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(75000):setShortRangeRadarRange(30000)

function FregateHelleboreTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

FregateHelleboreTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
FregateHelleborePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
FregateHellebore()

--Création du vaisseau
function FregateHemlock()

--Définition du vaisseau PNJ
function FregateHemlockPNJ()

function FregateHemlockCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Fregate Hemlock"):setLocaleName(_("ship", "Fregate Hemlock")):setClass(_("class", "Fregate"), _("subclass", "Hemlock")):setModel("Eldar_Corsair_Bomber")
template:setDescription(_([[Le Hemlock est notable en raison de la simplicité de sa conception. Ce vaisseau consiste en fait en une pièce d’artillerie Pulsar propulsée par des moteurs très puissants, et pratiquement rien d’autre, ce qui lui a déjà vallu d'être qualifié de "canon mobile et non un véritable vaisseau". En raison de l’énergie utilisée par les moteurs stellaires et la lance Pulsar, et malgré la technologie avancée des Asuryanis, l’Hemlock ne peut probablement pas assurer un environnement stable pour d’autres personnes que l’équipage nécessaire au mouvement et au tir du vaisseau. Ceci le rend très vulnérable aux actions d’abordage des Escorteurs ennemis, si tant est qu’ils puissent s’approcher suffisamment.]]))
--template:setScale(70)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.012)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(180)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(375, 11.2, 9.5, 46.875, 11.2)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(750, 375)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

FregateHemlockCoque()

function FregateHemlockTourelles()

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 30, 0, 10000, 10, 60)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.15)

end

FregateHemlockTourelles()

function FregateHemlockMissiles()

end

FregateHemlockMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
FregateHemlockPNJ()

--Création du vaisseau PJ
function FregateHemlockPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Hemlock"):setLocaleName(_("playerShip", "Fregate Hemlock")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(60000):setShortRangeRadarRange(24000)

function FregateHemlockTourellesPJ()

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 30, 0, 7000, 10, 60)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.15)

end

FregateHemlockTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
FregateHemlockPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
FregateHemlock()

--Création du vaisseau
function FregateAconit()

--Définition du vaisseau PNJ
function FregateAconitPNJ()

function FregateAconitCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Fregate Aconit"):setLocaleName(_("ship", "Fregate Aconit")):setClass(_("class", "Fregate"), _("subclass", "Aconit")):setModel("Eldar_Corsair_Bomber")
template:setDescription(_([[Les Frégates de classe Aconite utilisent la meilleure technologie laser qui soit, ce qui leur permet de bénéficier d’une force de frappe dépassant de loin celle de vaisseaux de leur taille. Opérant habituellement en escadron de trois ou quatre vaisseaux, elles peuvent libérer un ouragan de tir équivalent aux batteries de bordée d’un Cuirassé, puis s’échapper avant que l’ennemi n’ait le temps de riposter. En particulier, les Aconites utilisent leur grande vitesse pour se positionner derrière un vaisseau de grande taille et le criblent de tirs sans que celui-ci ne puisse répliquer. Si des Escorteurs ennemis les prennent en chasse, elles peuvent les semer rapidement et attaquer sur un autre front.]]))
--template:setScale(75)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.014)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(200)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(350, 11.2, 9.5, 43.75, 11.2)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(700, 350)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

FregateAconitCoque()

function FregateAconitTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Lance de Proue 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 30, 0, 10000, 10, 60)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.15)

end

FregateAconitTourelles()

function FregateAconitMissiles()

end

FregateAconitMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
FregateAconitPNJ()

--Création du vaisseau PJ
function FregateAconitPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Aconit"):setLocaleName(_("playerShip", "Fregate Aconit")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(75000):setShortRangeRadarRange(30000)

function FregateAconitTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Lance de Proue 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 30, 0, 10000, 10, 60)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.15)

end

FregateAconitTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
FregateAconitPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
FregateAconit()

--Création du vaisseau
function FregateNightshade()

--Définition du vaisseau PNJ
function FregateNightshadePNJ()

function FregateNightshadeCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Fregate Nightshade"):setLocaleName(_("ship", "Fregate Nightshade")):setClass(_("class", "Fregate"), _("subclass", "Nightshade")):setModel("Eldar_Corsair_Bomber")
template:setDescription(_([[La plus grande force du Nightshade réside dans sa capacité à délivrer des torpilles à courte portée puis à s’échapper rapidement. Les torpilles Asuryanis sont dotées de systèmes de détection et de contrôle d’approche perfectionnés, ainsi que d’ogives vortex ou à neutrons très volatiles. L’Adeptus Mechanicus estime qu’elles ont ainsi deux fois plus de chances d’infliger des dommages que leurs homologues à plasma impériales. Un vaisseau rapide doté d’un tel armement est capable de s’attaquer à n’importe quelle cible, n’importe où.]]))
--template:setScale(65)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.014)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(200)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(350, 10.72, 9.5, 43.75, 10.72)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(700, 350)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

FregateNightshadeCoque()

function FregateNightshadeTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

end

FregateNightshadeTourelles()

function FregateNightshadeMissiles()

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

FregateNightshadeMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
FregateNightshadePNJ()

--Création du vaisseau PJ
function FregateNightshadePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Nightshade"):setLocaleName(_("playerShip", "Fregate Nightshade")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(72000):setShortRangeRadarRange(28800)

function FregateNightshadeTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

end

FregateNightshadeTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
FregateNightshadePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
FregateNightshade()

--Création du vaisseau
function CroiseurLegerAurora()

--Définition du vaisseau PNJ
function CroiseurLegerAuroraPNJ()

function CroiseurLegerAuroraCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Leger Aurora"):setLocaleName(_("ship", "Croiseur Leger Aurora")):setClass(_("class", "Croiseur Leger"), _("subclass", "Aurora")):setModel("Eldar_Corsair_Light_Cruiser")
template:setDescription(_([[Comme le reste des navires Eldars répertoriés par la marine impériale, on connaît très peu de choses de la classe Aurora. Ce navire imite la conception des plus grands croiseurs avec la même configuration de voile et de coque. En tant que croiseur léger, la logique voudrait que l’Aurora remplisse les mêmes fonctions que le Dauntless dans la flotte impériale. Même si les croiseurs Eldar sont rapides, l’Aurora possède l’avantage supplémentaire d'avoir la vitesse et la manoeuvrabilité d’un escorteur, tout en possédant la puissance de feu nécessaire pour concurrencer un croiseur.]]))
--template:setScale(170)
template:setRadarTrace("exuari_4.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.015)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(480)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(350, 10.88, 9, 43.75, 10.88)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(700, 350)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

CroiseurLegerAuroraCoque()

function CroiseurLegerAuroraTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Lance de Carène
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurLegerAuroraTourelles()

function CroiseurLegerAuroraMissiles()

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

CroiseurLegerAuroraMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurLegerAuroraPNJ()

--Création du vaisseau PJ
function CroiseurLegerAuroraPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Aurora"):setLocaleName(_("playerShip", "Croiseur Leger Aurora")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(60000):setShortRangeRadarRange(24000)

function CroiseurLegerAuroraTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Lance de Carène
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurLegerAuroraTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurLegerAuroraPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurLegerAurora()

--Création du vaisseau
function CroiseurEclipse()

--Définition du vaisseau PNJ
function CroiseurEclipsePNJ()

function CroiseurEclipseCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Eclipse"):setLocaleName(_("ship", "Croiseur Eclipse")):setClass(_("class", "Croiseur"), _("subclass", "Eclipse")):setModel("Eldar_Corsair_Cruiser")
template:setDescription(_([[L’Eclipse est peut-être l’un des transporteurs d’appareils d’attaque les plus efficaces de tout le secteur. Tandis que la plupart des vaisseaux de ce type doivent rester éloignés de l’ennemi, ce qui augmente d’autant la distance que doivent parcourir les bombardiers et les chasseurs, l’Eclipse peut déployer ses Chasseurs Darkstar et ses Bombardiers Eagle à distance de frappe puis utiliser sa grande vitesse et son agilité pour quitter la zone de combat. Si l’on ajoute à cela l’incroyable adresse des appareils Asuryanis, il est facile de comprendre pourquoi les Croiseurs de classe Eclipse étaient la terreur des convois impériaux du Secteur Gothique.]]))
--template:setScale(235)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.015)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(225, 7.52, 8, 28.125, 7.52)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(450, 225)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

CroiseurEclipseCoque()

function CroiseurEclipseTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Lance de Proue 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurEclipseTourelles()

function CroiseurEclipseMissiles()

--Nombre de tubes et temps de chargement
template:setTubes(2, 15)

--Hangars Bâbords
--Direction (Index,Direction)
template:setTubeDirection(0, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Hangars Tribord
--Direction (Index,Direction)
template:setTubeDirection(1, 90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Définition des chasseurs
--Définition des chasseurs (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Chasseurs", 0.5, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Chasseurs", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Chasseurs", 120)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Chasseurs",1,2)

--Sélection munition
template:setWeaponTubeExclusiveForCustom(0,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(1,"Chasseurs")

end

CroiseurEclipseMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurEclipsePNJ()

--Création du vaisseau PJ
function CroiseurEclipsePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Eclipse"):setLocaleName(_("playerShip", "Croiseur Eclipse")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(75000):setShortRangeRadarRange(30000)

function CroiseurEclipseTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Lance de Proue 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurEclipseTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurEclipsePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurEclipse()

--Création du vaisseau
function CroiseurShadow()

--Définition du vaisseau PNJ
function CroiseurShadowPNJ()

function CroiseurShadowCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Shadow"):setLocaleName(_("ship", "Croiseur Shadow")):setClass(_("class", "Croiseur"), _("subclass", "Shadow")):setModel("Eldar_Corsair_Cruiser")
template:setDescription(_([[Le Croiseur de classe Shadow est typique des vaisseaux de ligne Asuryanis : ses nombreuses voiles solaires le font bénéficier d’une grande vitesse et d’une manœuvrabilité impressionnante, le rendant capable de semer facilement les escorteurs des autres races.]]))
--template:setScale(235)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.015)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(225, 8.16, 8, 28.125, 8.16)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(450, 225)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

CroiseurShadowCoque()

function CroiseurShadowTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Lance Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurShadowTourelles()

function CroiseurShadowMissiles()

--Nombre de tubes et temps de chargement
template:setTubes(2, 6)

--Définition du macrocanon avant 1
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Définition du macrocanon avant 2
--Direction (Index,Direction)
template:setTubeDirection(1, 0)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK2", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK2", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK2", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK2", 1, 3)

--Sélection munition
template:setWeaponTubeExclusiveForCustom(0,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2")

end

CroiseurShadowMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurShadowPNJ()

--Création du vaisseau PJ
function CroiseurShadowPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Shadow"):setLocaleName(_("playerShip", "Croiseur Shadow")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(60000):setShortRangeRadarRange(24000)

function CroiseurShadowTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Lance Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurShadowTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurShadowPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurShadow()

--Création du vaisseau
function CroiseurWraithship()

--Définition du vaisseau PNJ
function CroiseurWraithshipPNJ()

function CroiseurWraithshipCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Wraithship"):setLocaleName(_("ship", "Croiseur Wraithship")):setClass(_("class", "Croiseur"), _("subclass", "Wraithship")):setModel("Eldar_Corsair_Cruiser")
template:setDescription(_([[Les Wraithships sont fabriqués à partir de moelle spectrale, une matière issue du warp et façonnée par les Eldars. Les Eldar utiliseraient leurs talents psychomorphiques pour façonner des cloisons, des murs, des planchers et des conduits en une coque qui enveloppe complètement le noyau de moelle spectrale du vaisseau et forme les cloisons internes majeures du vaisseau spatial. Le noyau fournirait un canal psychique par lequel un pilote Eldar peut contrôler le vaisseau, lui permettant de le guider et d'effectuer d’innombrables ajustements infimes pour tirer le maximum de son bâtiment. Tel un faucon qui s’élance pour s’agripper à sa proie, un Wraithship peut tourner dans les vents solaires, tourner en rond et s’élancer pour chasser sa propre proie – les vaisseaux spatiaux de son ennemi.]]))
--template:setScale(150)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.018)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(550)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(200, 7.84, 8.5, 25, 7.84)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 200)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

CroiseurWraithshipCoque()

function CroiseurWraithshipTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Lance Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurWraithshipTourelles()

function CroiseurWraithshipMissiles()

--Nombre de tubes et temps de chargement
template:setTubes(2, 6)

--Définition du macrocanon avant 1
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Définition du macrocanon avant 2
--Direction (Index,Direction)
template:setTubeDirection(1, 0)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Définition des lance missiles
--Direction (Index,Direction)
template:setTubeDirection(2, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 30)	
--Taille des obus (Index, Taille)
template:setTubeSize(2, "medium")

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 6)
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

--Sélection munition
template:setWeaponTubeExclusiveForCustom(0,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(2,"Torpille")

end

CroiseurWraithshipMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurWraithshipPNJ()

--Création du vaisseau PJ
function CroiseurWraithshipPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Wraithship"):setLocaleName(_("playerShip", "Croiseur Wraithship")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(60000):setShortRangeRadarRange(24000)

function CroiseurWraithshipTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Lance Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurWraithshipTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurWraithshipPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurWraithship()

--Création du vaisseau
function CroiseurVoidDragon()

--Définition du vaisseau PNJ
function CroiseurVoidDragonPNJ()

function CroiseurVoidDragonCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Void Dragon"):setLocaleName(_("ship", "Croiseur Void Dragon")):setClass(_("class", "Croiseur"), _("subclass", "Void Dragon")):setModel("Eldar_Corsair_Cruiser")
template:setDescription(_([["Dragons" est le nom collectif donné aux grandes classes de navires Eldar. Le terme "Dragon" ne fait pas référence à une configuration particulière, mais plutôt à une variété de vaisseaux adhérant aux mêmes principes de base, conçus pour les mêmes rôles de base. Dans ce groupe plus vaste, les configurations individuelles ou les combinaisons d’armes donnent aux classes individuelles leur nom propre – toujours une variation de l'appelation "Dragon", représentant différents aspects de la créature du même nom du mythe Eldar. Par exemple, les "Dragons" conçus pour opérer loin de leur base pour de grandes périodes de temps sont souvent appelés "Void Dragons".]]))
--template:setScale(250)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.018)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(200, 7.20, 7.5, 25, 7.20)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 200)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

CroiseurVoidDragonCoque()

function CroiseurVoidDragonTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Lance de Carène
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurVoidDragonTourelles()

function CroiseurVoidDragonMissiles()

--Nombre de tubes et temps de chargement
template:setTubes(4, 15)

--Définition du macrocanon avant
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Définition du macrocanon avant
--Direction (Index,Direction)
template:setTubeDirection(1, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Hangars Bâbords
--Direction (Index,Direction)
template:setTubeDirection(2, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Hangars Tribord
--Direction (Index,Direction)
template:setTubeDirection(3, 90)
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

--Définition des chasseurs
--Définition des chasseurs (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Chasseurs", 0.5, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Chasseurs", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Chasseurs", 120)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Chasseurs",1,2)

--Sélection munition
template:setWeaponTubeExclusiveForCustom(0,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(2,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(3,"Chasseurs")

end

CroiseurVoidDragonMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurVoidDragonPNJ()

--Création du vaisseau PJ
function CroiseurVoidDragonPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Void Dragon"):setLocaleName(_("playerShip", "Croiseur Void Dragon")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(54000):setShortRangeRadarRange(21600)

function CroiseurVoidDragonTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 30, 0, 7000, 10, 40)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Lance de Carène
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurVoidDragonTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurVoidDragonPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurVoidDragon()

--Création du vaisseau
function CroiseurNightDragon()

--Définition du vaisseau PNJ
function CroiseurNightDragonPNJ()

function CroiseurNightDragonCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Night Dragon"):setLocaleName(_("ship", "Croiseur Night Dragon")):setClass(_("class", "Croiseur"), _("subclass", "Night Dragon")):setModel("Eldar_Corsair_Cruiser")
template:setDescription(_([["Dragons" est le nom collectif donné aux grandes classes de navires Eldar. Le terme "Dragon" ne fait pas référence à une configuration particulière, mais plutôt à une variété de vaisseaux adhérant aux mêmes principes de base, conçus pour les mêmes rôles de base. Dans ce groupe plus vaste, les configurations individuelles ou les combinaisons d’armes donnent aux classes individuelles leur nom propre – toujours une variation de l'appellation "Dragon", représentant différents aspects de la créature du même nom du mythe Eldar. Par exemple, les "Night Dragons" semblent disposer de capacités de détection supérieures, n'étant jamais pris par surprise.]]))
--template:setScale(250)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.018)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(200, 7.20, 7.5, 25, 7.20)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 200)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

CroiseurNightDragonCoque()

function CroiseurNightDragonTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Carène
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 7000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.15)

end

CroiseurNightDragonTourelles()

function CroiseurNightDragonMissiles()

--Nombre de tubes et temps de chargement
template:setTubes(6, 15)

--Définition du macrocanon avant 1
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Définition du macrocanon avant 1
--Direction (Index,Direction)
template:setTubeDirection(1, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Définition du macrocanon avant 1
--Direction (Index,Direction)
template:setTubeDirection(2, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Définition du macrocanon avant 1
--Direction (Index,Direction)
template:setTubeDirection(3, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Hangars Bâbords
--Direction (Index,Direction)
template:setTubeDirection(4, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(4, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(4, "small")

--Hangars Tribord
--Direction (Index,Direction)
template:setTubeDirection(5, 90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(5, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(5, "small")

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK2", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK2", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK2", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK2", 1, 3)

--Définition des chasseurs
--Définition des chasseurs (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Chasseurs", 0.5, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Chasseurs", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Chasseurs", 120)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Chasseurs",1,2)

--Sélection munition
template:setWeaponTubeExclusiveForCustom(0,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(4,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(5,"Chasseurs")

end

CroiseurNightDragonMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurNightDragonPNJ()

--Création du vaisseau PJ
function CroiseurNightDragonPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Night Dragon"):setLocaleName(_("playerShip", "Croiseur Night Dragon")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(84000):setShortRangeRadarRange(33600)

function CroiseurNightDragonTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Carène
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.15)

end

CroiseurNightDragonTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurNightDragonPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurNightDragon()

--Création du vaisseau
function CroiseurNovaDragon()

--Définition du vaisseau PNJ
function CroiseurNovaDragonPNJ()

function CroiseurNovaDragonCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Nova Dragon"):setLocaleName(_("ship", "Croiseur Nova Dragon")):setClass(_("class", "Croiseur"), _("subclass", "Nova Dragon")):setModel("Eldar_Corsair_Cruiser")
template:setDescription(_([["Dragons" est le nom collectif donné aux grandes classes de navires Eldar. Le terme "Dragon" ne fait pas référence à une configuration particulière, mais plutôt à une variété de vaisseaux adhérant aux mêmes principes de base, conçus pour les mêmes rôles de base. Dans ce groupe plus vaste, les configurations individuelles ou les combinaisons d’armes donnent aux classes individuelles leur nom propre – toujours une variation de l'appellation "Dragon", représentant différents aspects de la créature du même nom du mythe Eldar. Par exemple, les "Nova Dragons" semblent dédiés à un seul but, la destruction de leur ennemis. Leurs canons leur permettent de vaporiser les vaisseau ennemis, alors qu'ils tirent des nuées de torpilles dans toutes les directions.]]))
--template:setScale(250)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.018)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(200, 7.20, 7.5, 25, 7.20)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 200)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

CroiseurNovaDragonCoque()

function CroiseurNovaDragonTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Carène
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 7000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.15)

end

CroiseurNovaDragonTourelles()

function CroiseurNovaDragonMissiles()

--Nombre de tubes et temps de chargement
template:setTubes(8, 30)

--Définition du macrocanon avant 1
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Définition du macrocanon avant 2
--Direction (Index,Direction)
template:setTubeDirection(1, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Définition du macrocanon avant 1
--Direction (Index,Direction)
template:setTubeDirection(2, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Définition du macrocanon avant 2
--Direction (Index,Direction)
template:setTubeDirection(3, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Définition du macrocanon avant 1
--Direction (Index,Direction)
template:setTubeDirection(4, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(4, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(4, "small")

--Définition du macrocanon avant 2
--Direction (Index,Direction)
template:setTubeDirection(5, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(5, 6)	
--Taille des obus (Index, Taille)
template:setTubeSize(5, "small")

--Définition des lance missiles
--Direction (Index,Direction)
template:setTubeDirection(6, 0)
--Taille des obus (Index, Taille)
template:setTubeSize(6, "medium")

--Définition des lance missiles
--Direction (Index,Direction)
template:setTubeDirection(7, 0)
--Taille des obus (Index, Taille)
template:setTubeSize(7, "medium")

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK2", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK2", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK2", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK2", 1, 3)

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
template:setWeaponTubeExclusiveForCustom(0,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(5,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(6,"Torpille")
template:setWeaponTubeExclusiveForCustom(7,"Torpille")

end

CroiseurNovaDragonMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurNovaDragonPNJ()

--Création du vaisseau PJ
function CroiseurNovaDragonPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Nova Dragon"):setLocaleName(_("playerShip", "Croiseur Nova Dragon")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(54000):setShortRangeRadarRange(21600)

function CroiseurNovaDragonTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Carène
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 360, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.15)

end

CroiseurNovaDragonTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurNovaDragonPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurNovaDragon()

--Création du vaisseau
function CroiseurStarDragon()

--Définition du vaisseau PNJ
function CroiseurStarDragonPNJ()

function CroiseurStarDragonCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Star Dragon"):setLocaleName(_("ship", "Croiseur Star Dragon")):setClass(_("class", "Croiseur"), _("subclass", "Star Dragon")):setModel("Eldar_Corsair_Cruiser")
template:setDescription(_([["Dragons" est le nom collectif donné aux grandes classes de navires Eldar. Le terme "Dragon" ne fait pas référence à une configuration particulière, mais plutôt à une variété de vaisseaux adhérant aux mêmes principes de base, conçus pour les mêmes rôles de base. Dans ce groupe plus vaste, les configurations individuelles ou les combinaisons d’armes donnent aux classes individuelles leur nom propre – toujours une variation de l'appellation "Dragon", représentant différents aspects de la créature du même nom du mythe Eldar. Par exemple, les "Star Dragons" sont une menace pour les grands navires, car ils sont capables d’ignorer le blindage le plus épais avec leurs multiples batteries de lances Pulsar.]]))
--template:setScale(250)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.018)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
--template:setShields(50)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(200, 7.20, 7.5, 25, 7.20)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 200)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")
template:setCloaking (true)

end

CroiseurStarDragonCoque()

function CroiseurStarDragonTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 30, 0, 7000, 10, 60)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.15)

--Lance de Proue 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 30, 0, 7000, 10, 60)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.15)

--Lance de Proue 3
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 30, 0, 7000, 10, 46)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.15)

end

CroiseurStarDragonTourelles()

function CroiseurStarDragonMissiles()

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

CroiseurStarDragonMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurStarDragonPNJ()

--Création du vaisseau PJ
function CroiseurStarDragonPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Star Dragon"):setLocaleName(_("playerShip", "Croiseur Star Dragon")):setType("playership")
--Valeur de recharge des boucliers
--variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(54000):setShortRangeRadarRange(21600)

function CroiseurStarDragonTourellesPJ()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 30, 0, 7000, 10, 60)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.15)

--Lance de Proue 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 30, 0, 7000, 10, 60)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.15)

--Lance de Proue 3
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(3, 30, 0, 7000, 10, 46)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(3, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(3, 0.15)

end

CroiseurStarDragonTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurStarDragonPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurStarDragon()
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -