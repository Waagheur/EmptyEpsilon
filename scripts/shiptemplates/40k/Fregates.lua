--[[Fichier de templates permettant la création des Frégates]]

--[[Sveltes, rapides et dangereuses, les Frégates sont capables d’échapper à tout ce qu’elles ne peuvent pas combattre
et de détruire tout ce qu’elles peuvent rattraper. Les Frégates forment l’ossature de ces flottes.
Une Frégate n’est pas aussi prestigieuse qu’un Croiseur ou qu’un Cuirassé,
mais sa polyvalence fait d’elle le bâtiment de choix de la Marine pour toutes sortes de missions.
Les Frégates sont chargées de l’escorte de convois, de patrouilles, d’opérations anti-piraterie et même d’assauts contre des vaisseaux et des stations rebelles.
Elles se livrent fréquemment à des escarmouches avec les Frégates et les Corvettes de rebelles, de pirates et même de races Xenos hostiles.

Les Frégates sont un compromis entre les différentes qualités recherchées pour un vaisseau : vitesse, manœuvrabilité, puissance de feu et protection.
Ce sont aussi des vaisseaux assez courants, de conception relativement simple et robuste, ce qui les rend faciles à modifier et à entretenir.]]


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function FregateSword()

--Définition du vaisseau PNJ
function FregateSwordPNJ()

function FregateSwordCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Fregate Sword"):setLocaleName(_("ship", "Fregate Sword")):setClass(_("class", "Fregate"), _("subclass", "Sword")):setModel("Navy_Frigate")
template:setDescription(_([[Les Frégates Sword sont les escorteurs de prédilection de la flotte depuis l’époque de sa fondation. Chaque système embarqué sur ces Frégates a été testé et mis à l’épreuve dans d’innombrables engagements. Ses batteries d’armes laser ainsi que ses tourelles bénéficient d’un exceptionnel niveau d’efficacité de 82%. De facture simple, ses moteurs à plasma ont inspiré la conception de nombreux autres vaisseaux et peuvent être entretenus par du personnel peu formé. La Frégate Sword constitue donc à tous les égards l’escorteur par excellence, et les corps expéditionnaires comprennent presque toujours une paire de Sword pour couvrir les flancs des plus gros bâtiments ou poursuivre les Corvettes plus petites et plus rapides. De nombreux Libres-Marchands ont été attirés par les performances spatiales de ces vaisseaux et ont réussi à en acquérir un. Avec quelques conversions mineures pour accroître sa capacité de chargement, un Sword répond parfaitement à leurs besoins.]]))
--template:setScale(80)
template:setRadarTrace("ktlitan_destroyer.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.018)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(350)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(600)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(200, 7.2, 4.5, 25, 7.2)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Module de saut
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

FregateSwordCoque()

function FregateSwordTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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
template:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.05)

end

FregateSwordTourelles()

end

--Appel de la fonction créant le vaisseau PNJ
FregateSwordPNJ()

--Création du vaisseau PJ
function FregateSwordPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Sword"):setLocaleName(_("playerShip", "Fregate Sword")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(45000):setShortRangeRadarRange(18000)

function FregateSwordTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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
variation:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.05)

end

FregateSwordTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
FregateSwordPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
FregateSword()

--Création du vaisseau
function FregateTempest()

--Définition du vaisseau PNJ
function FregateTempestPNJ()

function FregateTempestCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Fregate d'attaque Tempest"):setLocaleName(_("ship", "Fregate d'attaque Tempest")):setClass(_("class", "Fregate"), _("subclass", "Tempest")):setModel("Navy_Frigate")
template:setDescription(_([[La Tempest est une Frégate spécialisée qui sacrifie sa puissance de feu à longue portée pour des batteries lourdes de portée courte conçues pour déchiqueter les vaisseaux ennemis en combat rapproché. Pour arriver aussi près de sa cible, le Tempest dispose d’une proue à blindage triple et de propulseurs suralimentés, embarque souvent des appareils de débarquement et un surcroît de matelots pour les actions d’abordage. Ses quartiers d’équipages spacieux et ses ponts de lancement se révèlent également utiles pour d’autres activités plus mercantiles.]]))
--template:setScale(75)
template:setRadarTrace("ktlitan_destroyer.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.019)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(360)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(600)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(200, 6.88, 4.7, 25, 6.88)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Module de saut
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

FregateTempestCoque()

function FregateTempestTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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

FregateTempestTourelles()

end

--Appel de la fonction créant le vaisseau PNJ
FregateTempestPNJ()

--Création du vaisseau PJ
function FregateTempestPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Tempest"):setLocaleName(_("playerShip", "Fregate d'attaque Tempest")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(36000):setShortRangeRadarRange(14400)

function FregateTempestTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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
variation:setBeamWeapon(2, 1, 0, 10000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

FregateTempestTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
FregateTempestPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
FregateTempest()

--Création du vaisseau
function FregateTurbulent()

--Définition du vaisseau PNJ
function FregateTurbulentPNJ()

function FregateTurbulentCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Fregate Lourde Turbulent"):setLocaleName(_("ship", "Fregate Lourde Turbulent")):setClass(_("class", "Fregate"), _("subclass", "Turbulent")):setModel("Navy_Frigate")
template:setDescription(_([[Importées du secteur Scarus pour servir d’escortes navales lourdes, la poignée de frégates lourdes de la classe Turbulent qui ont survécu dans le secteur n’est jamais repartie. Destinée à devancer la flotte principale et à engager les unités de reconnaissance rivales lorsqu’elles sont rencontrées, l’histoire de la classe Turbulent est caractérisée par des actions agressives et autres raids éclairs contre les ennemis de l’empereur.]]))
--template:setScale(98)
template:setRadarTrace("ktlitan_destroyer.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(400)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(600)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(175, 6.88, 4.3, 21.875, 6.88)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Module de saut
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

FregateTurbulentCoque()

function FregateTurbulentTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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
template:setBeamWeapon(2, 1, 0, 10000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

FregateTurbulentTourelles()

end

--Appel de la fonction créant le vaisseau PNJ
FregateTurbulentPNJ()

--Création du vaisseau PJ
function FregateTurbulentPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Turbulent"):setLocaleName(_("playerShip", "Fregate Lourde Turbulent")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(45000):setShortRangeRadarRange(18000)

function FregateTurbulentTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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
variation:setBeamWeapon(2, 1, 0, 10000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

FregateTurbulentTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
FregateTurbulentPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
FregateTurbulent()

--Création du vaisseau
function FregateFirestorm()

--Définition du vaisseau PNJ
function FregateFirestormPNJ()

function FregateFirestormCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Fregate Firestorm"):setLocaleName(_("ship", "Fregate Firestorm")):setClass(_("class", "Fregate"), _("subclass", "Firestorm")):setModel("Navy_Frigate")
template:setDescription(_([[Les frégates de classe Firestorm constituent une innovation relativement récente au sein de la Flotte de Guerre. Elles furent conçues dans le but de combiner la manœuvrabilité des escorteurs avec la force de frappe des pièces d’artillerie navale. La Firestorm est construite à partir de la coque d’une Frégate de classe Sword, mais les systèmes laser centraux ont été reconfigurés afin de pouvoir diriger vers le canon monté en proue l’énergie nécessaire à sa mise à feu. Seuls quatre escadrons de Firestorms prirent part à la Guerre Gothique et ils se trouvèrent surclassés dans la plupart des engagements, en raison du manque de renforts disponibles.]]))
--template:setScale(80)
template:setRadarTrace("ktlitan_destroyer.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.018)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(380)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(600)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(175, 7.2, 4.4, 21.875, 7.2)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Module de saut
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

FregateFirestormCoque()

function FregateFirestormTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Sidérale de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 0, 0.5)
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

FregateFirestormTourelles()

end

--Appel de la fonction créant le vaisseau PNJ
FregateFirestormPNJ()

--Création du vaisseau PJ
function FregateFirestormPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Firestorm"):setLocaleName(_("playerShip", "Fregate Firestorm")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(45000):setShortRangeRadarRange(18000)

function FregateFirestormTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Sidérale de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Lance Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

FregateFirestormTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
FregateFirestormPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
FregateFirestorm()
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -