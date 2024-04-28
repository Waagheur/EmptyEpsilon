--[[Fichier de templates permettant la création des Grands Croiseurs.]]

--[[A l’origine conçus comme une tentative de monter un armement digne d’un cuirassé sur une coque de la taille d’un croiseur,
les Grands Croiseurs sont des vaisseaux de guerre archaïques et extrêmement puissants, vestiges d’une époque technologiquement plus avancée de l’histoire impériale.
Seuls les Cuirassés portent un blindage plus lourd ou disposent d’une plus grande puissance de feu.
Ces vaisseaux étaient autrefois le cœur des escadrons de la flotte de combat,
de rudes vaisseaux de guerre conçus pour les actions de canonnades concertées et les duels punitifs dans le vide. 

Ils ont été depuis remplacés par les Croiseurs de Combat, plus faciles à entretenir que ces reliques hautement sophistiquées,
aussi mal comprises que coûteuses à entretenir, notamment au niveau de leurs réacteurs Warp expérimentaux
(la perte du savoir nécessaire à leur utilisation correcte ayant causé un grand nombre d’incidents qui donnent aux Grands Croiseurs une sombre réputation).
Aujourd’hui, bon nombre de Grands Croiseurs ont été mis en retrait du service actif et ont intégré les flottes de réserve en attendant leur dernier combat.]]


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function GrandCroiseurVengeance()

--Définition du vaisseau PNJ
function GrandCroiseurVengeancePNJ()

function GrandCroiseurVengeanceCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Grand Croiseur Vengeance"):setLocaleName(_("ship", "Grand Croiseur Vengeance")):setClass(_("class", "Grand Croiseur"), _("subclass", "Vengeance")):setModel("Rogue_Trader_Cruiser")
template:setDescription(_([[Le Croiseur de Classe Vengeance incarne la transition entre les bâtiments des premiers temps de l’Imperium et le style développé au fil des millénaires, le vaisseau possédant une proue blindée rudimentaire, mais pas de blindage renforcé. De nos jours, les Croiseurs de Classe Vengeance sont gardés en réserve et sont considérés par de nombreux amiraux comme des antiquités dont les jours de gloire sont depuis longtemps révolus.]]))
--template:setScale(355)
template:setRadarTrace("tug.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.012)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(1000)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(100, 4.0, 2.89, 12.5, 4.0)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

GrandCroiseurVengeanceCoque()

function GrandCroiseurVengeanceTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.33, 1)
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

GrandCroiseurVengeanceTourelles()

function GrandCroiseurVengeanceMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(8, 30)

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

--Macrocanons Bâbords 3
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

--Macrocanons Tribords 3
--Direction (Index,Direction)
template:setTubeDirection(5,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(5, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(5, "small")

--Hangars Bâbords
--Direction (Index,Direction)
template:setTubeDirection(6, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(6, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(6, "small")

--Hangars Tribords
--Direction (Index,Direction)
template:setTubeDirection(7,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(7, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(7, "small")

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK3", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK3", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK3", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK3", 1, 4)

--Définition des chasseurs
--Définition des chasseurs (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Chasseurs", 0.5, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Chasseurs", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Chasseurs", 100)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Chasseurs",1,2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(5,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(6,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(7,"Chasseurs")

end

GrandCroiseurVengeanceMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
GrandCroiseurVengeancePNJ()

--Création du vaisseau PJ
function GrandCroiseurVengeancePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Vengeance"):setLocaleName(_("playerShip", "Grand Croiseur Vengeance")):setType("playership")
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

function GrandCroiseurVengeanceTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.33, 1)
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

GrandCroiseurVengeanceTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
GrandCroiseurVengeancePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
GrandCroiseurVengeance()

--Création du vaisseau
function GrandCroiseurAvenger()

--Définition du vaisseau PNJ
function GrandCroiseurAvengerPNJ()

function GrandCroiseurAvengerCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Grand Croiseur Avenger"):setLocaleName(_("ship", "Grand Croiseur Avenger")):setClass(_("class", "Grand Croiseur"), _("subclass", "Avenger")):setModel("Rogue_Trader_Cruiser")
template:setDescription(_([[L’Avenger est le vestige d’une époque et de tactiques révolues. Des escadrons de ce briseur de blocus se déployaient habituellement derrière un écran d’escorteurs et de Croiseurs légers, puis accéléraient pour atteindre leur vitesse maximale et frapper au cœur des lignes ennemies. Les Croiseurs ouvraient ensuite le feu pour abattre les vaisseaux adverses avec leurs tirs de barrage à courte portée. Cette tactique impliquait généralement que deux ou trois escadrons de Croiseurs Avenger infligent (et subissent) de lourds dommages, mais leur puissance de feu leur permettait de surclasser la plupart des navires ennemis à courte portée. La confusion et les dégâts causés par cette tactique brutale rendaient l’adversaire vulnérable à l’attaque des vagues suivantes. À mesure que les tactiques impériales évoluaient, le Croiseur de Classe Avenger perdit de son importance pour finalement devenir obsolète et être retiré des actions de première ligne.]]))
--template:setScale(375)
template:setRadarTrace("tug.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.021)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(900)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(125, 4.8, 2.2, 15.625, 4.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

GrandCroiseurAvengerCoque()

function GrandCroiseurAvengerTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.33, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

end

GrandCroiseurAvengerTourelles()

function GrandCroiseurAvengerMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(6, 30)

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

--Macrocanons Bâbords 3
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

--Macrocanons Tribords 3
--Direction (Index,Direction)
template:setTubeDirection(5,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(5, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(5, "small")

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK4", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK4", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK4", 400)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK4", 3, 4)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(5,"MCANMK4")

end

GrandCroiseurAvengerMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
GrandCroiseurAvengerPNJ()

--Création du vaisseau PJ
function GrandCroiseurAvengerPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Avenger"):setLocaleName(_("playerShip", "Grand Croiseur Avenger")):setType("playership")
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

function GrandCroiseurAvengerTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.33, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

end

GrandCroiseurAvengerTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
GrandCroiseurAvengerPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
GrandCroiseurAvenger()

--Création du vaisseau
function GrandCroiseurRepulsive()

--Définition du vaisseau PNJ
function GrandCroiseurRepulsivePNJ()

function GrandCroiseurRepulsiveCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Grand Croiseur Repulsive"):setLocaleName(_("ship", "Grand Croiseur Repulsive")):setClass(_("class", "Grand Croiseur"), _("subclass", "Repulsive")):setModel("Rogue_Trader_Cruiser")
template:setDescription(_([[Dans le domaine sacré et obscur de la construction de Vaisseaux Impériaux, des classes entières de navires peuvent être considérées comme maudites dès le stade de la conception. Les hommes du vide murmurent que ces vaisseaux ont traversé les étoiles, tentant d'entraîner des équipages entiers avec eux dans le Warp à un moment donné, pour les laisser succomber à la fin ou à la corruption, jusqu’à ce que le vaisseau réapparaisse dans l’OEil de la Terreur, prêt pour servir les seigneurs corrompus du Chaos.

Cette sombre réputation a suivi le Grand Croiseur de classe Repulsive depuis sa création, à l’époque où tous servaient l’Imperium. Un nombre inquiétant de Repulsive (leurs noms d’origine disparus depuis longtemps dans les ténèbres de l'histoire) ont trahi ou ont été capturés au profit du Grand Ennemi depuis leur mise en service, tant que certains ont oublié que les navires ont été construits à l’origine au service de l’Empereur. C'est en effet une tragédie pour l'Impérium, car ce sont de gracieux et puissants vaisseaux de combat, équipés d'armes radicalement différentes de celles des autres Grands Croiseur, illustration parfaite de l’ancienne doctrine promouvant des vaisseaux de guerre lourds, rapides et maniables.

Leur conception ne peut pas être dupliquée, car les secrets de construction de leurs puissants réacteurs à plasma ont depuis été perdus. Seule une poignée des navires de cette classe sont restés exempts de corruption, et ils sont soit en quarantaine, écartés et gardés dans la flotte de réserve des diverses forteresses des Segmentums, soit sous le commandement de certains Libres Marchands.]]))
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

end

GrandCroiseurRepulsiveCoque()

function GrandCroiseurRepulsiveTourelles()
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

GrandCroiseurRepulsiveTourelles()

function GrandCroiseurRepulsiveMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(8, 30)

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
template:setWeaponTubeExclusiveForCustom(3,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(5,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(6,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(7,"MCANMK3")

end

GrandCroiseurRepulsiveMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
GrandCroiseurRepulsivePNJ()

--Création du vaisseau PJ
function GrandCroiseurRepulsivePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Repulsive"):setLocaleName(_("playerShip", "Grand Croiseur Repulsive")):setType("playership")
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

function GrandCroiseurRepulsiveTourellesPJ()
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

GrandCroiseurRepulsiveTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
GrandCroiseurRepulsivePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
GrandCroiseurRepulsive()

--Création du vaisseau
function GrandCroiseurExorcist()

--Définition du vaisseau PNJ
function GrandCroiseurExorcistPNJ()

function GrandCroiseurExorcistCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Grand Croiseur Exorcist"):setLocaleName(_("ship", "Grand Croiseur Exorcist")):setClass(_("class", "Grand Croiseur"), _("subclass", "Exorcist")):setModel("Rogue_Trader_Cruiser")
template:setDescription(_([[Le Croiseur Lourd de Classe Exorcist a été conçu pour servir de patrouilleur au long cours, capable d’opérer sur de longues périodes sans ravitaillement. Habituellement entourés de deux ou trois escadrons d’escorteurs, les Exorcist étaient affectés aux secteurs les plus éloignés de l’Imperium, tels que la Bordure Orientale ou le Halo. L’Exorcist a été peu à peu remplacé par des vaisseaux plus sophistiqués, notamment par les Croiseurs de Combat de Classe Mars. Quelques Exorcist sont maintenus en état par les flottes situées en bordure de l’Imperium pour continuer à patrouiller dans le Halo, tandis que d’autres servent de transports.]]))
--template:setScale(365)
template:setRadarTrace("tug.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
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
template:setSpeed(100, 4.64, 1.99, 12.5, 4.64)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

GrandCroiseurExorcistCoque()

function GrandCroiseurExorcistTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.33, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

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

GrandCroiseurExorcistTourelles()

function GrandCroiseurExorcistMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(8, 30)

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

--Macrocanons Bâbords 3
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

--Macrocanons Tribords 3
--Direction (Index,Direction)
template:setTubeDirection(5,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(5, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(5, "small")

--Hangars Bâbords
--Direction (Index,Direction)
template:setTubeDirection(6, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(6, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(6, "small")

--Hangars Tribords
--Direction (Index,Direction)
template:setTubeDirection(7,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(7, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(7, "small")

--Définition des macrocanons
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK3", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK3", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK3", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK3", 1, 4)

--Définition des chasseurs
--Définition des chasseurs (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("Nuke", "Chasseurs", 0.5, 800.0, "Kinetic", 60)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("Chasseurs", 255, 204, 0)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("Chasseurs", 12)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Chasseurs",1,2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(5,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(6,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(7,"Chasseurs")

end

GrandCroiseurExorcistMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
GrandCroiseurExorcistPNJ()

--Création du vaisseau PJ
function GrandCroiseurExorcistPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Exorcist"):setLocaleName(_("playerShip", "Grand Croiseur Exorcist")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(27000):setShortRangeRadarRange(10800)

function GrandCroiseurExorcistTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.33, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

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

GrandCroiseurExorcistTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
GrandCroiseurExorcistPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
GrandCroiseurExorcist()
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -