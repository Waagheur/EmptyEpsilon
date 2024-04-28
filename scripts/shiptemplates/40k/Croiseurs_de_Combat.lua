--[[Fichier de templates permettant la création des Croiseurs de Combat.]]

--[[Les secrets de fabrication des Grands Croiseurs étant perdus et l’utilisation des exemplaires survivants étant jugée peu fiable,
il restait néanmoins toujours un besoin dans l’arsenal impérial pour un croiseur lourd,
un vaisseau qui se situait à mi-chemin entre un Croiseur "classique" comme le classe Lunar et un véritable Cuirassé.
De nombreuses petites forces opérationnelles nécessitaient un vaisseau amiral puissant,
cependant les imposants et précieux Cuirassés ne pouvaient être affectés à chaque engagement de ce type.

A la fin du 36e Millénaire, l’Adeptus Mechanicus produisit ainsi un nouveau type de vaisseau : le Croiseur de Combat.
Conçus pour fournir à la flotte la puissance à longue portée de l’armement des Cuirassés dans une coque de la taille d’un Croiseur,
les Croiseurs de Combat sont forgés uniquement pour les engagements lourds entre de vastes vaisseaux capitaux, et ils excellent dans cette activité spécifique,
surpassant les Croiseurs grâce à leur armement surpuissant : très peu de navires peuvent surpasser un Croiseur de Combat en termes de puissance de feu.

Généralement un peu plus petits et plus légèrement blindés que leurs prédécesseurs les Grands Croiseurs, les Croiseurs de Combat sont néanmoins plus économiques,
plus sûrs et plus fiables. Ce qui leur manque en termes de blindage lourd et de systèmes de propulsion exotiques est plus que compensé par leur puissance de feu brute.
Jalousement gardés par les amiraux des flottes de combat,
il est extrêmement rare que ces puissants vaisseaux se retrouvent dans les mains de quelqu’un n’appartenant pas à la Marine Impériale.]]



-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function CroiseurdeCombatOverlord()

--Définition du vaisseau PNJ
function CroiseurdeCombatOverlordPNJ()

function CroiseurdeCombatOverlordCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur de Combat Overlord"):setLocaleName(_("ship", "Croiseur de Combat Overlord")):setClass(_("class", "Croiseur de Combat"), _("subclass", "Overlord")):setModel("Navy_Battleship")
template:setDescription(_([[Basé sur la conception du Croiseur Lourd de Classe Acheron, le Croiseur de Combat de Classe Overlord fut conçu pour fournir à la flotte impériale un vaisseau de catégorie croiseur possédant la puissance de feu à longue portée d’un cuirassé. En raison de difficultés dues à la transmission d’énergie, les batteries d’armes de proue de l’Acheron furent remplacées par la proue blindée et les tubes lance-torpilles habituels des Croiseurs. Ces modifications permirent d’améliorer les pièces d’artillerie dorsales en leur conférant une portée accrue, comparable à celle des autres batteries laser du vaisseau. Cependant, les difficultés de construction inhérentes à ces modifications font que seul un nombre limité d’Overlords à été incorporé aux différentes flottes.]]))
--template:setScale(265)
template:setRadarTrace("battleship.png")
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
template:setSpeed(125, 5.6, 2.4, 15.625, 5.6)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurdeCombatOverlordCoque()

function CroiseurdeCombatOverlordTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(4, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(4, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(4, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(4, 0.1)

--Tourelle Tribord 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(5, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(5, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(5, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(5, 0.1)

end

CroiseurdeCombatOverlordTourelles()

function CroiseurdeCombatOverlordMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(1, 30)

--Lance-Torpilles
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 60)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 18)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Torpille",1,2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Torpille")

end

CroiseurdeCombatOverlordMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurdeCombatOverlordPNJ()

--Création du vaisseau PJ
function CroiseurdeCombatOverlordPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Overlord"):setLocaleName(_("playerShip", "Croiseur de Combat Overlord")):setType("playership")
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


function CroiseurdeCombatOverlordTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(4, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(4, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(4, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(4, 0.1)

--Tourelle Tribord 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(5, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(5, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(5, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(5, 0.1)

end

CroiseurdeCombatOverlordTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurdeCombatOverlordPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurdeCombatOverlord()

--Création du vaisseau
function CroiseurdeCombatMars()

--Définition du vaisseau PNJ
function CroiseurdeCombatMarsPNJ()

function CroiseurdeCombatMarsCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur de Combat Mars"):setLocaleName(_("ship", "Croiseur de Combat Mars")):setClass(_("class", "Croiseur de Combat"), _("subclass", "Mars")):setModel("Navy_Battleship")
template:setDescription(_([[La production des Croiseurs de Combat de classe Mars dura pendant dix-huit siècles jusqu’à ce que la Guerre Gothique éclate, après quoi leur nombre ne cessa de décroître. Bien que considéré comme insuffisamment armé par de nombreux capitaines, un tir bien placé de leur canon Nova leur permet de porter des coups dévastateurs à l'ennemi avant de l'achever à la lance sidérale.]]))
--template:setScale(270)
template:setRadarTrace("battleship.png")
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
template:setSpeed(125, 5.6, 2.4, 15.625, 5.6)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurdeCombatMarsCoque()

function CroiseurdeCombatMarsTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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

CroiseurdeCombatMarsTourelles()

function CroiseurdeCombatMarsMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(7, 30)

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

--Hangars Bâbords
--Direction (Index,Direction)
template:setTubeDirection(5, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(5, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(5, "small")

--Hangars Tribords
--Direction (Index,Direction)
template:setTubeDirection(6,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(6, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(6, "small")

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
template:setCustomWeaponStorage("Chasseurs", 80)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Chasseurs",1,2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Canon Nova")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(5,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(6,"Chasseurs")

end

CroiseurdeCombatMarsMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurdeCombatMarsPNJ()

--Création du vaisseau PJ
function CroiseurdeCombatMarsPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Mars"):setLocaleName(_("playerShip", "Croiseur de Combat Mars")):setType("playership")
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


function CroiseurdeCombatMarsTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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

CroiseurdeCombatMarsTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurdeCombatMarsPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurdeCombatMars()

--Création du vaisseau
function CroiseurdeCombatChalice()

--Définition du vaisseau PNJ
function CroiseurdeCombatChalicePNJ()

function CroiseurdeCombatChaliceCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur de Combat Chalice"):setLocaleName(_("ship", "Croiseur de Combat Chalice")):setClass(_("class", "Croiseur de Combat"), _("subclass", "Chalice")):setModel("Navy_Battleship")
template:setDescription(_([[La classe Chalice était une tentative audacieuse, mais pas entièrement réussie, de développer davantage le concept du croiseur de combat dans le secteur Calixis. La théorie semblait bonne : un croiseur lourd rapide, avec une armure légère et des armes puissantes qui pouvaient distancer et déjouer tout ce qu’il ne pouvait pas détruire immédiatement. Pendant les sombres années de la croisade angevine, les propagandistes impériaux ont fait grand cas des nouveaux « super-croiseurs » fabriqués localement, qui avaient pour mission de repousser les nombreux xénos et hérétiques s'opposant aux forces Impériales. Même s’ils ne sont entrés en service qu’à la fin de la croisade, les espoirs pour ces navires étaient immenses. Les premiers capitaines de la classe Calice ont été salués comme des aventuriers glamour et flamboyants dans les bobines de vox sans fin et les jeux de données. Malheureusement, ces navires n’ont pas répondu aux attentes. Deux des premiers cuirassés de classe Chalice ont été détruits lors d’un engagement avec des forces xénos inconnues dans l’abîme de Hazeroth, et d’autres ont été perdus au cours d'accidents ou d'engagements au cours des prochains millénaires. Cependant, ces navires restent admirés parmi le grand public impérial, qui croit que ces navires sont le noyau de fer de la Flotte de Guerre Calixis. Cependant, ces navires élégants et beaux, bien que rapides et bien armés, ont une mâchoire de verre, et une tendance déconcertante à subir des ruptures de leurs conduites de plasma lors d’assauts soutenus.]]))
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

end

CroiseurdeCombatChaliceCoque()

function CroiseurdeCombatChaliceTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(3, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.1)

end

CroiseurdeCombatChaliceTourelles()

function CroiseurdeCombatChaliceMissiles()
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

CroiseurdeCombatChaliceMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurdeCombatChalicePNJ()

--Création du vaisseau PJ
function CroiseurdeCombatChalicePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Chalice"):setLocaleName(_("playerShip", "Croiseur de Combat Chalice")):setType("playership")
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


function CroiseurdeCombatChaliceTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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

--Tourelle Tribord 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(3, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(3, 90, 90, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(3, 0.1)

end

CroiseurdeCombatChaliceTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurdeCombatChalicePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurdeCombatChalice()

--Création du vaisseau
function CroiseurdeCombatArmageddon()

--Définition du vaisseau PNJ
function CroiseurdeCombatArmageddonPNJ()

function CroiseurdeCombatArmageddonCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur de Combat Armageddon"):setLocaleName(_("ship", "Croiseur de Combat Armageddon")):setClass(_("class", "Croiseur de Combat"), _("subclass", "Armageddon")):setModel("Navy_Battleship")
template:setDescription(_([[Les croiseurs de combat de classe Armageddon ont été développés pour accroître rapidement les effectifs de la Flotte Impériale. La quasi intégralité des classe Armageddon sont en fait des Croiseurs Lunar recyclés après qu'ils aient été mis hors de combat. Même s'ils sont faciles à produire, de nombreux commandants voient en général d'un mauvais œil de perdre des Lunar au profit d'Armageddon. Les croiseurs de combat Armageddon possèdent des Batteries d'armes à la puissance augmentée par une dérivation d'énergie de leur réacteur à plasma et des Pièces d'artillerie navale modifiées. Ces caractéristiques en font un bon vaisseau à moyenne portée capable d'engager les ennemis à distance mais nécessite l'usage de presque trois mille cinq cents hommes d'équipage supplémentaires.]]))
--template:setScale(250)
template:setRadarTrace("battleship.png")
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

end

CroiseurdeCombatArmageddonCoque()

function CroiseurdeCombatArmageddonTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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

CroiseurdeCombatArmageddonTourelles()

function CroiseurdeCombatArmageddonMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(7, 30)

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

CroiseurdeCombatArmageddonMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurdeCombatArmageddonPNJ()

--Création du vaisseau PJ
function CroiseurdeCombatArmageddonPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Armageddon"):setLocaleName(_("playerShip", "Croiseur de Combat Armageddon")):setType("playership")
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


function CroiseurdeCombatArmageddonTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
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

CroiseurdeCombatArmageddonTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurdeCombatArmageddonPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurdeCombatArmageddon()

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -