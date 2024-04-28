--[[Fichier de templates permettant la création des Croiseurs Légers]]

--[[Plus petits et plus rapides que les Croiseurs, les Croiseurs Légers sont les yeux et les oreilles de la flotte,
les patrouilleurs qui s’enfoncent dans les profondeurs du vide sidéral,
car ils ont assez de réserves de carburant et de nourriture pour des patrouilles pouvant durer des mois ou des années.
Ils ont de plus assez de puissance de feu pour éradiquer tout vaisseau de taille inférieure qui serait assez téméraire pour engager le combat avec eux.
Les Croiseurs Légers font aussi office de vaisseau amiral pour de petites escadres de Frégates et de Destroyers chargées d’escorter des convois
ou de chasser des pirates.

La conception d’un tel vaisseau cherche l’équilibre entre puissance de feu et endurance.
Un Croiseur Leger a l’avantage d’être à peine moins rapide et maniable qu’une Frégate tout en disposant de l’armement d’un vaisseau de ligne.
Mais cela ne peut se faire qu’au prix d’un blindage et de cloisons internes beaucoup moins solides que sur un Croiseur.
En résumé, les Croiseurs Légers sont plus rapides et manœuvrables que les Croiseurs standards mais ils sont aussi beaucoup plus fragiles.
Les croiseurs légers appartiennent en général à la Marine Impériale.]]


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function CroiseurLegerDauntless()

--Définition du vaisseau PNJ
function CroiseurLegerDauntlessPNJ()

function CroiseurLegerDauntlessCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Leger Dauntless"):setLocaleName(_("ship", "Croiseur Leger Dauntless")):setClass(_("class", "Croiseur Leger"), _("subclass", "Dauntless")):setModel("Navy_Light_Cruiser")
template:setDescription(_([[Le Dauntless est populaire parce qu’il associe la manœuvrabilité d’une Frégate à une impressionnante lance sidérale de proue, aussi ces Croiseurs Légers ont toujours été la marque de fabrique de la Flotte Impériale à travers la galaxie. Le Croiseur Leger idéal doit être suffisamment armé pour tenir en échec les escorteurs adverses et disposer d’assez de réserves et d’énergie pour opérer loin de sa base pendant plusieurs mois. Le Dauntless est une classe appréciée, aussi rapide et manœuvrable qu’une frégate mais doté d’un armement avant redoutable.]]))
--template:setScale(225)
template:setRadarTrace("exuari_4.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.019)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(800)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(175, 6.4, 4.3, 21.875, 6.4)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurLegerDauntlessCoque()

function CroiseurLegerDauntlessTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

end

CroiseurLegerDauntlessTourelles()

function CroiseurLegerDauntlessMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(4, 15)

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

CroiseurLegerDauntlessMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurLegerDauntlessPNJ()

--Création du vaisseau PJ
function CroiseurLegerDauntlessPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Dauntless"):setLocaleName(_("playerShip", "Croiseur Leger Dauntless")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(60000):setShortRangeRadarRange(24000)

function CroiseurLegerDauntlessTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)
end

CroiseurLegerDauntlessTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurLegerDauntlessPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurLegerDauntless()

--Création du vaisseau
function CroiseurLegerEndeavour()

--Définition du vaisseau PNJ
function CroiseurLegerEndeavourPNJ()

function CroiseurLegerEndeavourCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Leger Endeavour"):setLocaleName(_("ship", "Croiseur Leger Endeavour")):setClass(_("class", "Croiseur Leger"), _("subclass", "Endeavour")):setModel("Navy_Light_Cruiser")
template:setDescription(_([[Le Croiseur Leger de classe Endeavour, ne possédant pas la vitesse adéquate pour combattre les vaisseaux pirates, est généralement employé comme vaisseau amiral pour des convois ou en tant qu’escorteur lourd pour les vaisseaux de ligne plus gros. Ses batteries d’armes lourdes peuvent rivaliser avec celles de croiseurs plus imposants, lui permettant de soutenir une bataille rangée.]]))
--template:setScale(190)
template:setRadarTrace("exuari_4.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(800)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(150, 5.92, 3.9, 18.75, 5.92)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurLegerEndeavourCoque()

function CroiseurLegerEndeavourTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

end

CroiseurLegerEndeavourTourelles()

function CroiseurLegerEndeavourMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(5, 30)


--Lance Torpilles de Proue
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

--Macrocanons Tribords 3
--Direction (Index,Direction)
template:setTubeDirection(3,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Macrocanons Tribords 4
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

CroiseurLegerEndeavourMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurLegerEndeavourPNJ()

--Création du vaisseau PJ
function CroiseurLegerEndeavourPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Endeavour"):setLocaleName(_("playerShip", "Croiseur Leger Endeavour")):setType("playership")
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

function CroiseurLegerEndeavourTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance de proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

end

CroiseurLegerEndeavourTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurLegerEndeavourPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurLegerEndeavour()

--Création du vaisseau
function CroiseurLegerDefiant()

--Définition du vaisseau PNJ
function CroiseurLegerDefiantPNJ()

function CroiseurLegerDefiantCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Leger v"):setLocaleName(_("ship", "Croiseur Leger Defiant")):setClass(_("class", "Croiseur Leger"), _("subclass", "Defiant")):setModel("Navy_Light_Cruiser")
template:setDescription(_([[Le croiseur de classe Defiant est l’élément le moins courant du triumvirat de Voss, mais il s’agit de la dernière pièce du puzzle. Transporteur de vaisseaux d’attaque fiable, il est cependant considéré comme trop vulnérable pour opérer sans soutien, car il manque de canon pour assurer sa propre défense. C’est la raison pour laquelle il se retrouve en général en arrière de la ligne de bataille, hors de portée de l’ennemi.]]))
--template:setScale(190)
template:setRadarTrace("exuari_4.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(800)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(150, 5.92, 3.8, 18.75, 5.92)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurLegerDefiantCoque()

function CroiseurLegerDefiantTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

end

CroiseurLegerDefiantTourelles()

function CroiseurLegerDefiantMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(3, 30)


--Lance Torpilles de Proue
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 30)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")

--Hangars Bâbords
--Direction (Index,Direction)
template:setTubeDirection(1, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Hangars Tribords
--Direction (Index,Direction)
template:setTubeDirection(2,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Définition des torpilles
--Définition des torpilles (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Torpille", 1, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Torpille", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Torpille", 12)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Torpille",1,2)

--Définition des chasseurs
--Définition des chasseurs (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Chasseurs", 0.5, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Chasseurs", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Chasseurs", 30)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Chasseurs",1,2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"Torpille")
template:setWeaponTubeExclusiveForCustom(1,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(2,"Chasseurs")

end

CroiseurLegerDefiantMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurLegerDefiantPNJ()

--Création du vaisseau PJ
function CroiseurLegerDefiantPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Defiant"):setLocaleName(_("playerShip", "Croiseur Leger Defiant")):setType("playership")
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

function CroiseurLegerDefiantTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

end

CroiseurLegerDefiantTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurLegerDefiantPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurLegerDefiant()

--Création du vaisseau
function CroiseurLegerEndurance()

--Définition du vaisseau PNJ
function CroiseurLegerEndurancePNJ()

function CroiseurLegerEnduranceCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Leger Endurance"):setLocaleName(_("ship", "Croiseur Leger Endurance")):setClass(_("class", "Croiseur Leger"), _("subclass", "Endurance")):setModel("Navy_Light_Cruiser")
template:setDescription(_([[Le Croiseur Leger de classe Endurance est un Endeavour dont les batteries ont été remplacées par des pièces d’artillerie navale. Une tactique répandue consiste à faire opérer ensemble un croiseur de classe Endeavour et un Endurance pour qu’ils se protègent mutuellement et combinent leur puissance de feu. Comme l’Endurance est produit en quantités inférieures, le faible nombre de croiseurs de ce type empêche parfois cette tactique d’être mise en œuvre. Il est par contre courant qu’un escadron regroupe deux ou trois Endeavour et un Endurance en soutien.]]))
--template:setScale(190)
template:setRadarTrace("exuari_4.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(600)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(800)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(150, 5.92, 3.9, 18.75, 5.92)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurLegerEnduranceCoque()

function CroiseurLegerEnduranceTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Babord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

--Lance Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurLegerEnduranceTourelles()

function CroiseurLegerEnduranceMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(3, 30)

--Lance Torpilles
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 30)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")

--Macrocanon de Proue 1
--Direction (Index,Direction)
template:setTubeDirection(1, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanon de Proue 2
--Direction (Index,Direction)
template:setTubeDirection(2, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

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

end

CroiseurLegerEnduranceMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurLegerEndurancePNJ()

--Création du vaisseau PJ
function CroiseurLegerEndurancePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Endurance"):setLocaleName(_("playerShip", "Croiseur Leger Endurance")):setType("playership")
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

function CroiseurLegerEnduranceTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Babord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

--Lance Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

end

CroiseurLegerEnduranceTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurLegerEndurancePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurLegerEndurance()

--Création du vaisseau
function CroiseurMonitorSecutor()

--Définition du vaisseau PNJ
function CroiseurMonitorSecutorPNJ()

function CroiseurMonitorSecutorCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Monitor Secutor"):setLocaleName(_("ship", "Croiseur Monitor Secutor")):setClass(_("class", "Croiseur Leger"), _("subclass", "Secutor")):setModel("Navy_Light_Cruiser")
template:setDescription(_([[Le croiseur Monitor de classe Secutor a été adapté des modèles existants lorsque certains mondes-forge se sont rendus compte que les croiseurs légers existant était insuffisamment armés pour le combat contre des vaisseaux lourds. Plutôt que de dépenser des ressources considérables pour construire de véritables croiseurs, ils ont développé le Secutor. Les Secutor sont beaucoup mieux armés que leurs cousins, et ont également des capacités défensives plus élevées. En échange, ils sont moins maniables, et avec une telle quantité de personnel consacrée aux armes et aux défenses, ils ne sont utiles que pour la guerre. Bien sûr, dans ce domaine, ils excellent.]]))
--template:setScale(215)
template:setRadarTrace("exuari_4.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(650)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(800)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(125, 5.92, 3.9, 15.625, 5.92)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurMonitorSecutorCoque()

function CroiseurMonitorSecutorTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.1)

end

CroiseurMonitorSecutorTourelles()

function CroiseurMonitorSecutorMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(5, 30)

--Lance Torpilles
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 30)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")

--Macrocanons Tribord 1
--Direction (Index,Direction)
template:setTubeDirection(1, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanons Tribord 2
--Direction (Index,Direction)
template:setTubeDirection(2, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Macrocanons Bâbord 1
--Direction (Index,Direction)
template:setTubeDirection(3, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Macrocanons Bâbord 2
--Direction (Index,Direction)
template:setTubeDirection(4, 0)
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

CroiseurMonitorSecutorMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurMonitorSecutorPNJ()

--Création du vaisseau PJ
function CroiseurMonitorSecutorPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Secutor"):setLocaleName(_("playerShip", "Croiseur Monitor Secutor")):setType("playership")
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

function CroiseurMonitorSecutorTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.1)

end

CroiseurMonitorSecutorTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurMonitorSecutorPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurMonitorSecutor()

--Création du vaisseau
function CroiseurMonitorLathe()

--Définition du vaisseau PNJ
function CroiseurMonitorLathePNJ()

function CroiseurMonitorLatheCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Monitor Lathe"):setLocaleName(_("ship", "Croiseur Monitor Lathe")):setClass(_("class", "Croiseur Leger"), _("subclass", "Lathe")):setModel("Navy_Light_Cruiser")
template:setDescription(_([[Bien qu'ils participent aux guerres aux côtés de la Marine Impériale et de l'Astra Militarum, le rôle principal des flottes Mechanicus est l’exploration, et non le combat. Les flottes Explorator traversent la galaxie, à la recherche d’archéotechnologies perdus et d’anciennes reliques du Moyen-Âge Technologique. Le croiseur Monitor de classe Lathe est un parfait exemple des navires que les Explorators utilisent dans leurs flottes. La conception diffère de celle de nombreux croiseurs légers, l’accent étant mis sur la détection à longue distance et l’endurance plutôt que sur la vitesse et la maniabilité. Équipé correctement, un croiseur Lathe peut fonctionner sans radoub ni réapprovisionnement pendant des décennies.]]))
--template:setScale(210)
template:setRadarTrace("exuari_4.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(630)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(800)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(125, 5.92, 6, 15.625, 5.92)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurMonitorLatheCoque()

function CroiseurMonitorLatheTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

--Lance Babord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(2, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(2, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(2, 0.1)

--Lance Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(3, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(3, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(3, 0.1)

end

CroiseurMonitorLatheTourelles()

function CroiseurMonitorLatheMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(1, 30)

--Lance Torpilles
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

CroiseurMonitorLatheMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurMonitorLathePNJ()

--Création du vaisseau PJ
function CroiseurMonitorLathePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Lathe"):setLocaleName(_("playerShip", "Croiseur Monitor Lathe")):setType("playership")
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

function CroiseurMonitorLatheTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

--Lance Babord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(2, 1, 90, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(2, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(2, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(2, 0.1)

--Lance Tribord
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(3, 1, 270, 7000, 10, 40)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(3, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(3, 20)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(3, 0.1)

end

CroiseurMonitorLatheTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurMonitorLathePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurMonitorLathe()
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -