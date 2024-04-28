--[[Fichier de templates permettant la création des Escorteurs]]

--[[Les Escorteurs, ou Corvettes sont les vaisseaux les plus courants, rapides, légers et capables de manœuvrer autour de plus gros vaisseaux qu’ils accompagnent
pour les prémunir des attaques de torpilles et repousser les Escorteurs ennemis.
Ils remplissent parfois des missions de repérage ou de protection de convois et pourchassent les pirates.
Ces "petits" vaisseaux n’ont que peu de chances d’endommager seuls des navires plus gros et opèrent en règle générale par escadrons demeurant en formation serrée
afin de combiner efficacement leur puissance de feu.
Cela les rend populaires auprès des pirates et des boucaniers qui écument les routes spatiales et préfèrent lancer de brusques assauts sur des vaisseaux isolés
puis s’éloigner rapidement avant d’être repérés par une patrouille de la Marine.

La Marine Impériale emploie elle aussi des Corvettes, qu’elle appelle plutôt du nom de Destroyers
et préfère les équiper d’armes capables de désemparer des vaisseaux (comme des torpilles) pour les envoyer donner la chasse à des bâtiments plus grands.
La vitesse et la manœuvrabilité supérieures des Destroyers leur permettent de s’approcher à courte portée, de lancer leur salve,
puis de s’échapper avant que la cible ait pu riposter, si tout se passe comme prévu évidemment.]]

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function EscorteurMeritechShrike()

--Définition du vaisseau PNJ
function EscorteurMeritechShrikePNJ()

function EscorteurMeritechShrikeCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Escorteur Meritech Shrike"):setLocaleName(_("ship", "Escorteur Meritech Shrike")):setClass(_("class", "Escorteur"), _("subclass", "Meritech Shrike")):setModel("Navy_Destroyer")
template:setDescription(_([[L'escorteur Meritech de classe Shrike est une classe infâme de vaisseaux pilleurs construits par les clans Meritech qui résident dans des mondes frontaliers.]]))
--template:setScale(100)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.016)
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
template:setSpeed(250, 8.0, 5.9, 31.25, 8.0)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

EscorteurMeritechShrikeCoque()

function EscorteurMeritechShrikeTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 10000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

EscorteurMeritechShrikeTourelles()

function EscorteurMeritechShrikeMissiles()

end

EscorteurMeritechShrikeMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
EscorteurMeritechShrikePNJ()

--Création du vaisseau PJ
function EscorteurMeritechShrikePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Meritech Shrike"):setLocaleName(_("playerShip", "Escorteur Meritech Shrike")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(60000):setShortRangeRadarRange(24000)

function EscorteurMeritechShrikeTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 10000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

EscorteurMeritechShrikeTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
EscorteurMeritechShrikePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
EscorteurMeritechShrike()

--Création du vaisseau
function EscorteurFalchion()

--Définition du vaisseau PNJ
function EscorteurFalchionPNJ()

function EscorteurFalchionCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Escorteur Falchion"):setLocaleName(_("ship", "Escorteur Falchion")):setClass(_("class", "Escorteur"), _("subclass", "Falchion")):setModel("Navy_Destroyer")
template:setDescription(_([[Directement dans la lignée de la frégate de classe Sword, le Falchion est un vaisseau polyvalent, utilisé pour les patrouilles, l’escorte de convois ou de croiseurs légers qui eux-mêmes appuient leurs cousins plus gros. Comme tous les vaisseaux conçus selon le modèle Voss, ils sont quasiment exclusifs à ce Monde-Forge, mais les rares flottes à être dotées de Falchion le considèrent comme une alternative intéressante à la frégate de classe Sword.]]))
--template:setScale(110)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.018)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(360)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(200, 6.72, 4.6, 25.0, 6.72)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

EscorteurFalchionCoque()

function EscorteurFalchionTourelles()

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.05)

end

EscorteurFalchionTourelles()

function EscorteurFalchionMissiles()
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

EscorteurFalchionMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
EscorteurFalchionPNJ()

--Création du vaisseau PJ
function EscorteurFalchionPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Falchion"):setLocaleName(_("playerShip", "Escorteur Falchion")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(42000):setShortRangeRadarRange(16800)

function EscorteurFalchionTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.05)

end

EscorteurFalchionTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
EscorteurFalchionPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
EscorteurFalchion()

--Création du vaisseau
function CorsaireHazeroth()

--Définition du vaisseau PNJ
function CorsaireHazerothPNJ()

function CorsaireHazerothCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Escorteur Hazeroth"):setLocaleName(_("ship", "Escorteur Hazeroth")):setClass(_("class", "Escorteur"), _("subclass", "Hazeroth")):setModel("Navy_Destroyer")
template:setDescription(_([[La classe Hazeroth rassemble différentes Corvettes de taille et de puissance de feu similaires. Très utilisés dans la zone de l’abysse d’Hazeroth (d’où leur nom), ces bâtiments sont populaires chez corsaires. La plupart sacrifient l’espace cargo et le blindage au profit de moteurs puissants et de cloisons intérieures renforcées, ce qui leur permet de fuir ce qu’ils ne peuvent vaincre.]]))
--template:setScale(75)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.014)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(320)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(250, 7.68, 5.6, 31.25, 7.68)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

CorsaireHazerothCoque()

function CorsaireHazerothTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.05)

end

CorsaireHazerothTourelles()

function CorsaireHazerothMissiles()

end

CorsaireHazerothMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CorsaireHazerothPNJ()

--Création du vaisseau PJ
function CorsaireHazerothPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Hazeroth"):setLocaleName(_("playerShip", "Escorteur Hazeroth")):setType("playership")
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

function CorsaireHazerothTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.05)

end

CorsaireHazerothTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CorsaireHazerothPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CorsaireHazeroth()

--Création du vaisseau
function CorvetteHavoc()

--Définition du vaisseau PNJ
function CorvetteHavocPNJ()

function CorvetteHavocCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Escorteur Havoc"):setLocaleName(_("ship", "Escorteur Havoc")):setClass(_("class", "Escorteur"), _("subclass", "Havoc")):setModel("Navy_Destroyer")
template:setDescription(_([[Le Havoc est une Corvette Lourde disposant de propulseurs puissants, d’un espace cargo conséquent et d’une puissance de feu capable de rivaliser avec bien des Frégates. Par contre son blindage est relativement léger, ce qui fait que ce "canon de verre" aura des difficultés en cas d’affrontement avec un vaisseau militaire de même catégorie.]]))
--template:setScale(80)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.016)
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
template:setSpeed(225, 8.0, 5.0, 28.125, 8.0)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

CorvetteHavocCoque()

function CorvetteHavocTourelles()
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
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

end

CorvetteHavocTourelles()

function CorvetteHavocMissiles()
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

CorvetteHavocMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CorvetteHavocPNJ()

--Création du vaisseau PJ
function CorvetteHavocPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Havoc"):setLocaleName(_("playerShip", "Escorteur Havoc")):setType("playership")
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

function CorvetteHavocTourellesPJ()
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
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

end

CorvetteHavocTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CorvetteHavocPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CorvetteHavoc()

--Création du vaisseau
function CorvetteClaymore()

--Définition du vaisseau PNJ
function CorvetteClaymorePNJ()

function CorvetteClaymoreCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Corvette Claymore"):setLocaleName(_("ship", "Corvette Claymore")):setClass(_("class", "Corvette"), _("subclass", "Claymore")):setModel("Navy_Destroyer")
template:setDescription(_([[La Corvette de classe Claymore est un vaisseau d’escorte spécialisée de la Marine impériale. Les corvettes sont en général un peu plus petites et moins puissantes que les frégates, mais elles sont mieux équipées que d’autres navires, comme les escorteurs légers. La Claymore est considéré comme une Corvette standard : elle est robuste et utilise un design simple qui permet des réparations faciles, faisant de la Claymore un navire extrêmement pratique à fabriquer en temps de guerre. De grandes quantités de ces vaisseaux peuvent être fabriqués à la hâte par les chantiers navals mobiles de l'Adeptus Mechanicus et les petits chantiers navals civils.]]))
--template:setScale(70)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.017)
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
template:setSpeed(200, 6.88, 4.6, 25.0, 6.88)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

CorvetteClaymoreCoque()

function CorvetteClaymoreTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.05)

end

CorvetteClaymoreTourelles()

function CorvetteClaymoreMissiles()

end

CorvetteClaymoreMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CorvetteClaymorePNJ()

--Création du vaisseau PJ
function CorvetteClaymorePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Claymore"):setLocaleName(_("playerShip", "Corvette Claymore")):setType("playership")
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

function CorvetteClaymoreTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.05)

end

CorvetteClaymoreTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CorvetteClaymorePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CorvetteClaymore()

--Création du vaisseau
function CorvetteWolfpack()

--Définition du vaisseau PNJ
function CorvetteWolfpackPNJ()

function CorvetteWolfpackCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Corvette Wolfpack"):setLocaleName(_("ship", "Corvette Wolfpack")):setClass(_("class", "Corvette"), _("subclass", "Wolfpack")):setModel("Navy_Destroyer")
template:setDescription(_([[Les pirates sont réputés pour utiliser tous les vaisseaux qui leurs tombent sous la main. Ils préfèrent si possible les vaisseaux légers et rapides pour frapper vite et décrocher rapidement. La vitesse est déterminante, car peu de bâtiments pirates sont capables d'affronter un véritable vaisseau de guerre.]]))
--template:setScale(85)
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
template:setSpeed(250, 8.8, 5, 31.25, 8.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

CorvetteWolfpackCoque()

function CorvetteWolfpackTourelles()
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
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

end

CorvetteWolfpackTourelles()

function CorvetteWolfpackMissiles()
--Nombre de tubes et temps de chargement
template:setTubes(1, 6)

--Définition du macrocanon avant
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

CorvetteWolfpackMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CorvetteWolfpackPNJ()

--Création du vaisseau PJ
function CorvetteWolfpackPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Wolfpack"):setLocaleName(_("playerShip", "Corvette Wolfpack")):setType("playership")
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

function CorvetteWolfpackTourellesPJ()
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
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

end

CorvetteWolfpackTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CorvetteWolfpackPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CorvetteWolfpack()

--Création du vaisseau
function DestroyerIconoclast()

--Définition du vaisseau PNJ
function DestroyerIconoclastPNJ()

function DestroyerIconoclastCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Destroyer Iconoclast"):setLocaleName(_("ship", "Destroyer Iconoclast")):setClass(_("class", "Destroyer"), _("subclass", "Iconoclast")):setModel("Navy_Destroyer")
template:setDescription(_([[Les bandes de Destroyers de classe Iconoclast en maraude sont un danger constant pour qui voyage dans l’espace. Utilisés essentiellement par des pirates et autres bandits, les Iconoclasts sont d’une conception similaire à toutes sortes d’Escorteurs construits par n’importe quel astroport. Bien que de taille réduite, ils bénéficient d’une puissance de feu conséquente et une attaque combinée peut même inquiéter un vaisseau de ligne. Dans le cadre d’une flotte, ils peuvent engager les escorteurs ennemis, abattre les appareils d’attaque ou détruire les torpilles en approche.]]))
--template:setScale(65)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.014)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(280)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(250, 8, 7.2, 31.25, 8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

DestroyerIconoclastCoque()

function DestroyerIconoclastTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.05)

end

DestroyerIconoclastTourelles()

function DestroyerIconoclastMissiles()

end

DestroyerIconoclastMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
DestroyerIconoclastPNJ()

--Création du vaisseau PJ
function DestroyerIconoclastPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Iconoclast"):setLocaleName(_("playerShip", "Destroyer Iconoclast")):setType("playership")
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

function DestroyerIconoclastTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

--Tourelle Dorsale 2
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.05)

end

DestroyerIconoclastTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
DestroyerIconoclastPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
DestroyerIconoclast()

--Création du vaisseau
function EscorteurCobra()

--Définition du vaisseau PNJ
function EscorteurCobraPNJ()

function EscorteurCobraCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Escorteur Cobra"):setLocaleName(_("ship", "Escorteur Cobra")):setClass(_("class", "Escorteur"), _("subclass", "Cobra")):setModel("Navy_Destroyer")
template:setDescription(_([[Les escorteurs de classe Cobra représentent une partie importante de la Flotte de Guerre Obscurus, leur flexibilité en faisant le vaisseau parfait pour les opérations de reconnaissance, les patrouilles et les raids. L’atout principal du Cobra est sa vitesse élevée, le rendant capable de poursuivre les vaisseaux rapides qu’affectionnent les pirates.]]))
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

end

EscorteurCobraCoque()

function EscorteurCobraTourelles()
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
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

end

EscorteurCobraTourelles()

function EscorteurCobraMissiles()
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

EscorteurCobraMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
EscorteurCobraPNJ()

--Création du vaisseau PJ
function EscorteurCobraPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Cobra"):setLocaleName(_("playerShip", "Escorteur Cobra")):setType("playership")
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

function EscorteurCobraTourellesPJ()
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
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

end

EscorteurCobraTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
EscorteurCobraPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
EscorteurCobra()

--Création du vaisseau
function EscorteurViper()

--Définition du vaisseau PNJ
function EscorteurViperPNJ()

function EscorteurViperCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Escorteur Viper"):setLocaleName(_("ship", "Escorteur Viper")):setClass(_("class", "Escorteur"), _("subclass", "Viper")):setModel("Navy_Destroyer")
template:setDescription(_([[Pendant la prérogative Gareox, de nombreux destroyers Cobra ont été convertis pour transporter des torpilles d’abordage. Leur batterie d’arme principale a été retirée et des tubes de lancement de torpilles supplémentaires ajoutés. L’expérience n’a pas été un succès; les escorteurs n’ont pas pu transporter un équipage suffisant pour utiliser au mieux les torpilles et capturer les navires ennemis. Ils se sont de plus avérés de piètres escortes de convois, mais ils ont étonnamment bien réussi en tant que les flottilles de soutien pour la flotte. Ainsi, la plupart des Vipers ont été maintenus à ce titre et continuent d’être construits, bien qu’ils n’utilisent plus de torpilles d’embarquement.]]))
--template:setScale(48)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.014)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(250)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(275, 8.8, 6, 34.375, 8.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

EscorteurViperCoque()

function EscorteurViperTourelles()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

end

EscorteurViperTourelles()

function EscorteurViperMissiles()
--Nombre de tubes et temps de chargement
template:setTubes(2, 30)

--Définition des lance missiles
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")
template:setTubeSize(1, "medium")

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 12)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Torpille",1,2)

--Sélection munition
template:setWeaponTubeExclusiveForCustom(0,"Torpille")
template:setWeaponTubeExclusiveForCustom(1,"Torpille")

end

EscorteurViperMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
EscorteurViperPNJ()

--Création du vaisseau PJ
function EscorteurViperPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Viper"):setLocaleName(_("playerShip", "Escorteur Viper")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(1.2)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(75000):setShortRangeRadarRange(30000)

function EscorteurViperTourellesPJ()
--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 1000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

end

EscorteurViperTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
EscorteurViperPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
EscorteurViper()
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -