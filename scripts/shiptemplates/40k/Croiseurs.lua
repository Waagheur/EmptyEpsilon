--[[Fichier de templates permettant la création des Croiseurs.]]

--[[Relativement maniables, bien armés, en mesure d’opérer loin de leur base durant de longues périodes, un Croiseur est un vaisseau de guerre, point à ligne.
Ces bâtiments forment la colonne vertébrale de toute flotte de combat et participent aux engagements navals majeurs.
Il en est donc fait un usage intensif lors des patrouilles prolongées, des blocus et des raids en espace sidéral ennemi.
Lors des batailles majeures, les croiseurs soutiennent les escorteurs dans la protection de la flotte et forment la ligne de front une fois les hostilités engagées.
Ces vaisseaux sont rares : la construction d’un Croiseur prend des siècles et demande un savoir et une technologie remontant à l’Age d’Or de l’Humanité
dont seuls les plus puissants Magos disposent.
Mais chacun de ces vaisseaux, qui mesurent généralement plus de cinq kilomètres de long,
embarque une puissance de feu capable de réduire en cendres une planète entière.
Ils sont conçus pour gagner des guerres et la Marine Impériale veille sur eux avec un soin jaloux. Acheter un croiseur est donc généralement impossible.

Les Croiseurs sont équipés de puissantes batteries d’armes et d’un blindage lourd.
Ils ont de gigantesques moteurs mais leur vitesse et leur manœuvrabilité sont loin d’être spectaculaires à cause de leur taille.
Ce qui est salutaire pour les adversaires plus petits, car leur seule chance face à ces mastodontes est de prendre la fuite.
De fait, les Croiseurs sont conçus pour affronter d’autres Croiseurs et embarquent des armes puissantes destinées à détruire ce type de cibles.]]


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function CroiseurLunar()

--Définition du vaisseau PNJ
function CroiseurLunarPNJ()

function CroiseurLunarCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Lunar"):setLocaleName(_("ship", "Croiseur Lunar")):setClass(_("class", "Croiseur"), _("subclass", "Lunar")):setModel("Navy_Cruiser")
template:setDescription(_([[Les Croiseurs de Classe Lunar forment l’ossature des Flotte de Guerre, plus de six cents d’entre eux opérant à travers l’ensemble du Segmentum Obscurus, dont une vingtaine ayant pris part à la Guerre Gothique. Son armement varié de batteries, de lances sidérales et de torpilles en fait un combattant polyvalent et un adversaire dangereux. Les Libres-Marchands qui arrivent à s’en offrir un enlèvent généralement les tubes lance-torpilles pour gagner de l’espace cargo. La conception (relativement) simple du Croiseur de classe Lunar remontant à l’aube de l’Imperium assure leur durabilité et permet leur construction dans les Mondes-Ruches ou industriels normalement incapables de fabriquer un vaisseau de ligne.]]))
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

end

CroiseurLunarCoque()

function CroiseurLunarTourelles()
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

CroiseurLunarTourelles()

function CroiseurLunarMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(5, 30)

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
template:setCustomWeaponStorage("Torpille", 12)
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

CroiseurLunarMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurLunarPNJ()

--Création du vaisseau PJ
function CroiseurLunarPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Lunar"):setLocaleName(_("playerShip", "Croiseur Lunar")):setType("playership")
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

function CroiseurLunarTourellesPJ()
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

CroiseurLunarTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurLunarPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurLunar()

--Création du vaisseau
function CroiseurGothic()

--Définition du vaisseau PNJ
function CroiseurGothicPNJ()

function CroiseurGothicCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Gothic"):setLocaleName(_("ship", "Croiseur Gothic")):setClass(_("class", "Croiseur"), _("subclass", "Gothic")):setModel("Navy_Cruiser")
template:setDescription(_([[Le Croiseur de Classe Gothic est commun à travers l’Imperium. Un seul d’entre eux est un adversaire redoutable, capable de venir à bout d’ennemis de n’importe quelle taille. Cependant, au cours de la Guerre Gothique, il devint évident que les Croiseurs de Classe Gothic ne pouvaient opérer avec succès qu’appuyés par d’autres vaisseaux.  Aussi puissantes que soient leurs pièces d’artillerie, elles ne représentent pas un réel danger pour un adversaire suffisamment mobile en duel. Une nouvelle tactique fut donc mise en place en associant aux vaisseaux de Classe Gothic un escadron d’escorteurs ou de Croiseurs. Cette configuration permet d’engager les vaisseaux ennemi par le travers, tandis que les autres membres de l’escadron les encerclent pour les attaquer de toutes parts. Il est alors possible de tirer le meilleur parti des pièces d’artillerie du vaisseau.]]))
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

end

CroiseurGothicCoque()

function CroiseurGothicTourelles()
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

CroiseurGothicTourelles()

function CroiseurGothicMissiles()
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

CroiseurGothicMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurGothicPNJ()

--Création du vaisseau PJ
function CroiseurGothicPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Gothic"):setLocaleName(_("playerShip", "Croiseur Gothic")):setType("playership")
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

function CroiseurGothicTourellesPJ()
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

CroiseurGothicTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurGothicPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurGothic()

--Création du vaisseau
function CroiseurDominator()

--Définition du vaisseau PNJ
function CroiseurDominatorPNJ()

function CroiseurDominatorCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Dominator"):setLocaleName(_("ship", "Croiseur Dominator")):setClass(_("class", "Croiseur"), _("subclass", "Dominator")):setModel("Navy_Cruiser")
template:setDescription(_([[Le Croiseur de Classe Dominator est un vaisseau inhabituel, construit à l’origine pour servir de soutien dans les engagements majeurs et les assauts planétaires. Il fut conçu pour se tenir à l’écart et bombarder son ennemi de loin à l’aide de son imposant Canon Nova. Ce type de vaisseau est beaucoup plus courant dans la Flotte de Guerre Ultima que dans celle du Segmentum Obscurus, car ils sont en grande majorité construits dans la base navale de Kar Duniash.]]))
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

end

CroiseurDominatorCoque()

function CroiseurDominatorTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

end

CroiseurDominatorTourelles()

function CroiseurDominatorMissiles()
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
template:setCustomWeaponStorage("Chasseurs", 60)
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

CroiseurDominatorMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurDominatorPNJ()

--Création du vaisseau PJ
function CroiseurDominatorPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Dominator"):setLocaleName(_("playerShip", "Croiseur Dominator")):setType("playership")
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

function CroiseurDominatorTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

end

CroiseurDominatorTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurDominatorPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurDominator()

--Création du vaisseau
function GalionConquest()

--Définition du vaisseau PNJ
function GalionConquestPNJ()

function GalionConquestCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Galion Stellaire Conquest"):setLocaleName(_("ship", "Galion Stellaire Conquest")):setClass(_("class", "Croiseur"), _("subclass", "Conquest")):setModel("Navy_Cruiser")
template:setDescription(_([[Le « Galion Stellaire » de classe Conquest est un ancien modèle de croiseur encore utilisé dans les anciennes flottes impériales ainsi que par certains Libres-Marchands. Ils sont considérés comme des navires au trésor créés pour les tout premiers Libres-Marchands sur ordre de l’Empereur lui-même. Ceux encore en service disposent de merveilles technologiques depuis longtemps perdues et sont capables de mener à la fois des missions d’exploration à longue portée et de mener les leurs au combat. Au 41e millénaire, peu de ces navires sont encore en service et ils sont considérés comme de précieuses reliques des temps légendaires de la fondation de l’Imperium.]]))
--template:setScale(255)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.016)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(650)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(100, 4.8, 2.1, 12.5, 4.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

GalionConquestCoque()

function GalionConquestTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

end

GalionConquestTourelles()

function GalionConquestMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(9, 30)

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

--Macrocanons Bâbords 4
--Direction (Index,Direction)
template:setTubeDirection(4, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(4, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(4, "small")

--Macrocanons Tribords 1
--Direction (Index,Direction)
template:setTubeDirection(5,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(5, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(5, "small")

--Macrocanons Tribords 2
--Direction (Index,Direction)
template:setTubeDirection(6,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(6, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(6, "small")

--Macrocanons Tribords 3
--Direction (Index,Direction)
template:setTubeDirection(7,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(7, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(7, "small")

--Macrocanons Tribords 4
--Direction (Index,Direction)
template:setTubeDirection(8,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(8, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(8, "small")

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 12)
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
template:setWeaponTubeExclusiveForCustom(5,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(6,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(7,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(8,"MCANMK2")

end

GalionConquestMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
GalionConquestPNJ()

--Création du vaisseau PJ
function GalionConquestPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Conquest"):setLocaleName(_("playerShip", "Galion Stellaire Conquest")):setType("playership")
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

function GalionConquestTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

end

GalionConquestTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
GalionConquestPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
GalionConquest()

--Création du vaisseau
function CroiseurAmbition()

--Définition du vaisseau PNJ
function CroiseurAmbitionPNJ()

function CroiseurAmbitionCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Ambition"):setLocaleName(_("ship", "Croiseur Ambition")):setClass(_("class", "Croiseur"), _("subclass", "Ambition")):setModel("Navy_Cruiser")
template:setDescription(_([[Le croiseur de classe Ambition est un type de vaisseau produit par les chantiers navals de l'Adeptus Mechanicus pour les individus extrêmement riches, les Libres Marchands et les forces de défense spatiales des nobles dynasties. Bien qu’ils soient exploités par divers clans, maisons et flottes, ce sont de véritables croiseurs, possédant autant de puissance de feu que les classes Lunar ou Tyrant. Ils intègrent également invariablement des quartiers luxueux et des équipements pour leurs riches propriétaires.]]))
--template:setScale(245)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.017)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(660)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(125, 5.92, 3, 15.625, 5.92)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurAmbitionCoque()

function CroiseurAmbitionTourelles()
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

CroiseurAmbitionTourelles()

function CroiseurAmbitionMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(5, 30)

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
template:setCustomWeaponStorage("Torpille", 12)
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

CroiseurAmbitionMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurAmbitionPNJ()

--Création du vaisseau PJ
function CroiseurAmbitionPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Ambition"):setLocaleName(_("playerShip", "Croiseur Ambition")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(45000):setShortRangeRadarRange(18000)

function CroiseurAmbitionTourellesPJ()
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

CroiseurAmbitionTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurAmbitionPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurAmbition()

--Création du vaisseau
function CroiseurDictator()

--Définition du vaisseau PNJ
function CroiseurDictatorPNJ()

function CroiseurDictatorCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Dictator"):setLocaleName(_("ship", "Croiseur Dictator")):setClass(_("class", "Croiseur"), _("subclass", "Dictator")):setModel("Navy_Cruiser")
template:setDescription(_([[Les Croiseurs de Classe Dictator sont construits à partir de la coque de ceux de Classe Lunar, mais les pièces d’artillerie navale sont remplacées par des ponts de lancement d’appareils d’attaque. Ces modifications furent conçues afin de pouvoir envoyer facilement en orbite basse un grand nombre d’appareils, comme les chasseurs Thunderbolts et les Bombardiers Marauder, pour effectuer des opérations de soutien au sol. Cependant, des améliorations successives sur les systèmes de communication et de détection augmentèrent la capacité des Dictators à lancer des attaques à longue portée. C’est pourquoi ces derniers furent de plus en plus souvent équipés de chasseurs Fury capables d’opérer dans l’espace ainsi que de Bombardiers Starhawk, leur permettant d’opérer soit comme vaisseau de soutien au sein d’une flotte, soit indépendamment afin de patrouiller dans le secteur. Un seul Dictator épaulé par une poignée d’escorteurs constitue donc une force extrêmement souple capable de pourchasser des pirates ou d’inquiéter une planète.]]))
--template:setScale(255)
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
template:setSpeed(125, 5.28, 2.5, 15.625, 5.28)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurDictatorCoque()

function CroiseurDictatorTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.33, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

end

CroiseurDictatorTourelles()

function CroiseurDictatorMissiles()
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

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 12)
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

--Définition des chasseurs
--Définition des chasseurs (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Chasseurs", 0.5, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Chasseurs", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Chasseurs", 60)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Chasseurs",1,2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Torpille")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(5,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(6,"Chasseurs")

end

CroiseurDictatorMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurDictatorPNJ()

--Création du vaisseau PJ
function CroiseurDictatorPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Dictator"):setLocaleName(_("playerShip", "Croiseur Dictator")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(54000):setShortRangeRadarRange(21600)

function CroiseurDictatorTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.33, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

end

CroiseurDictatorTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurDictatorPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurDictator()

--Création du vaisseau
function CroiseurTyrant()

--Définition du vaisseau PNJ
function CroiseurTyrantPNJ()

function CroiseurTyrantCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Tyrant"):setLocaleName(_("ship", "Croiseur Tyrant")):setClass(_("class", "Croiseur"), _("subclass", "Tyrant")):setModel("Navy_Cruiser")
template:setDescription(_([[Vers la fin du trente-huitième millénaire, le célèbre Artisan-Magos Hyus N’dai travailla sur la technologie des Armes à Plasma à haute cadence. Le Croiseur de Classe Tyrant devint bientôt populaire dans les chantiers navals grâce à ses batteries d’armes à plasma à haute cadence capables de délivrer des salves à une portée bien supérieure à celles des batteries classiques. Cela constitua une petite révolution, dans la mesure où le secret de la fabrication d’armes à longue portée avait été perdu depuis le Moyen-Âge Technologique. En pratique, toutefois, ces armes à longue portée n’ont pas la puissance nécessaire pour constituer une menace sérieuse contre autre chose que des escorteurs.]]))
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

end

CroiseurTyrantCoque()

function CroiseurTyrantTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

end

CroiseurTyrantTourelles()

function CroiseurTyrantMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(9, 30)

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

--Macrocanons Bâbords 4
--Direction (Index,Direction)
template:setTubeDirection(4, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(4, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(4, "small")

--Macrocanons Tribords 1
--Direction (Index,Direction)
template:setTubeDirection(5,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(5, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(5, "small")

--Macrocanons Tribords 2
--Direction (Index,Direction)
template:setTubeDirection(6,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(6, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(6, "small")

--Macrocanons Tribords 3
--Direction (Index,Direction)
template:setTubeDirection(7,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(7, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(7, "small")

--Macrocanons Tribords 4
--Direction (Index,Direction)
template:setTubeDirection(8,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(8, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(8, "small")

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 12)
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
template:setWeaponTubeExclusiveForCustom(5,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(6,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(7,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(8,"MCANMK2")

end

CroiseurTyrantMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurTyrantPNJ()

--Création du vaisseau PJ
function CroiseurTyrantPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Tyrant"):setLocaleName(_("playerShip", "Croiseur Tyrant")):setType("playership")
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

function CroiseurTyrantTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

end

CroiseurTyrantTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurTyrantPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurTyrant()
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -