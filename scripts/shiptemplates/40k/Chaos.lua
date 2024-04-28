--[[Fichier de templates permettant la création des vaisseaux du Chaos.]]

--[[Une bonne partie des Flottes Chaotiques est composée de Capitaines Impériaux renégats et ne comprend aucun Space Marine du Chaos.
Le degré de loyauté que ces Capitaines ont envers leurs maîtres est de même variable,
et certaines flottes pirates inféodées au Chaos n’ont jamais vu un Space Marine renégat de leur vie.

La totalité de l’équipage d’un vaisseau n’est pas toujours complice en cas de rébellion.
Un Capitaine renégat n’a parfois corrompu qu’une poignée de ses officiers et quartiers-maîtres, avec lesquels ils conspirent pour asservir le reste de l’équipage
aux puissances du Chaos. Dans de telles conditions, certains finissent par succomber et par vénérer le Warp, de peur de voir leur esprit et leur corps brisés par la servitude.
Mais parfois, certains braves résistent.

De même, il peut suffire d’une poignée de renégats invisibles pour condamner un navire entier, peut-être même à l’insu du Capitaine et des officiers supérieurs.
Un matelot insignifiant, isolé dans quelque compartiment obscur des moteurs, peut échapper aux inspections de routine pendant des mois,
ce qui lui laisse amplement le temps de subtilement modifier les fréquences utilisées pour les voyages Warp de son vaisseau.
Au fil du temps, ces modifications mineures en arriveront au point où cette fréquence se sera muée en un signal chaotique
qui attirera tous les démons du Warp dès que le vaisseau s’y aventurera. Des entités se masseront autour du navire avant de lentement l’envahir,
souillant sa structure même, et permettront aux puissances de la ruine de corrompre le moindre centimètre carré du vaisseau, mais aussi les âmes de ses occupants.
Ainsi, ce matelot insignifiant est capable d’offrir les âmes de chacun de ses milliers de camarades et de tous les damner avant même qu’ils ne soupçonnent sa trahison.

Lorsque des vaisseaux d’une certaine classe se sont rebellés, un Commandant Impérial doit longuement réfléchir à ce qu’il va advenir des autres navires du même modèle.
Il arrive que des capitaines ou des individus isolés puissent devenir des traîtres, mais lorsqu’un grand nombre d’appareils de la même classe est perdu aux Puissances de la Ruine,
il est possible qu’un défaut de série existe. Par accident, ou peut-être selon les desseins d’un Technomagos hérétique, un vaisseau peut souffrir d’un défaut dans ses Boucliers Warp,
qui laissent alors passer l’influence néfaste de l’Empyrean, ou bien son architecture peut contenir certains volumes,
certaines proportions ou une combinaison de matériaux qui font office de conduits pour les énergies du Chaos, ce qui rend tous les navires de ce modèle vulnérables à la corruption,
quelles que soient la loyauté et la bravoure de son équipage.]]


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Création du vaisseau
function EsclavagisteSoulcage()

--Définition du vaisseau PNJ
function EsclavagisteSoulcagePNJ()

function EsclavagisteSoulcageCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Vaisseau Esclavagiste Soulcage"):setLocaleName(_("ship", "Vaisseau Esclavagiste Soulcage")):setClass(_("class", "Transport"), _("subclass", "Soulcage")):setModel("Civilian_Transport_Ship")
template:setDescription(_([[Contrairement à de nombreux vaisseaux du Chaos, les transports de classe Soulcage voient rarement le combat. Au lieu de cela, ils errent dans l’espace, suivant le sillage des corsaires et des pirates pour acheter, troquer ou escroquer ceux qui ont le malheur d’être pris en vie. La plupart font généralement partie de la flotte d’un seigneur de guerre, bien que certains opèrent indépendamment, risquant leur sécurité pour des gains plus conséquents. Presque tous les Soulcages sont des transports impériaux capturés et reconvertis. Après avoir profané des icônes impériales et souillé le navire avec les sigles et les icônes de leurs nouveaux maîtres, les soutes intérieures sont remplacées pont après pont par des enclos à esclaves. Par milliers, leur chair et leur esprit sont brisés pour créer de nouveaux serviteurs du Chaos. Incapables d’échapper à la corruption qui les entourent, à l’air vicié, aux chants blasphématoires constants et aux tortures insensées détruisant leurs âmes, forcés de s'agenouiller dans des sanctuaires profanes et marqués d’icônes impies, ils sont transformés en esclaves sans cervelle, prêts à combattre ou mourir pour la volonté de leur maître. Bien préparés, ils génèrent de beaux profits sur les mondes contrôlés par le Chaos ou même les Xenos. Cependant, certains sont laissés saints, conservés dans des champ de stase pour préserver leur pureté en vue de sacrifices rituels, de monstrueux repas, ou d’autres destins horribles. ]]))
--template:setScale(100)
template:setRadarTrace("blockade.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.015)
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
template:setSpeed(75, 2.4, 3, 9.375, 2.4)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
--template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")
--Autorisation de Dockage
template:setDockClasses(_("class", "Transport"), _("class", "Escorteur"), _("class", "Fregate"))

end

EsclavagisteSoulcageCoque()

function EsclavagisteSoulcageTourelles()
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

EsclavagisteSoulcageTourelles()

function EsclavagisteSoulcageMissiles()
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

EsclavagisteSoulcageMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
EsclavagisteSoulcagePNJ()

--Création du vaisseau PJ
function EsclavagisteSoulcagePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Soulcage"):setLocaleName(_("playerShip", "Vaisseau Esclavagiste Soulcage")):setType("playership")
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

function EsclavagisteSoulcageTourellesPJ()
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

EsclavagisteSoulcageTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
EsclavagisteSoulcagePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
EsclavagisteSoulcage()

--Création du vaisseau
function RaiderInfidel()

--Définition du vaisseau PNJ
function RaiderInfidelPNJ()

function RaiderInfidelCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Escorteur Infidel"):setLocaleName(_("ship", "Escorteur Infidel")):setClass(_("class", "Escorteur"), _("subclass", "Infidel")):setModel("Chaos_Destroyer")
template:setDescription(_([[À la fin du quarantième millénaire, les plans d’un Escorteur de grande taille, destiné à remplacer le Destroyer Cobra, disparurent des ports orbitaux de Monsk. Des années plus tard, des vaisseaux d’une conception proche commencèrent à lancer des raids sur les avant-postes et les convois impériaux. Les premières attaques eurent lieu dans le secteur de Damocles, à seulement sept cent quatre-vingt années-lumière de Monsk, mais leur secteur d’opération s’est étendu au cours des deux derniers siècles. On pense généralement que des escadrons de cette classe de vaisseau sont responsables de nombreuses attaques sur des bases isolées du Segmentum Obscurus, et nombre d’entre eux ont été aperçus aussi loin qu’Alphon dans le Segmentum Solar et Xanthus près de la bordure nord. Appelés Infidel dans la hiérarchie navale, ces vaisseaux participèrent en grand nombre à la Guerre Gothique, s’illustrant lors de plusieurs attaques surprises contre des vaisseaux en orbite attendant d’être ravitaillés.]]))
--template:setScale(75)
template:setRadarTrace("adv_striker.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.017)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(330)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(250, 8.0, 5, 31.25, 8.0)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

RaiderInfidelCoque()

function RaiderInfidelTourelles()
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

RaiderInfidelTourelles()

function RaiderInfidelMissiles()
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

RaiderInfidelMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
RaiderInfidelPNJ()

--Création du vaisseau PJ
function RaiderInfidelPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Infidel"):setLocaleName(_("playerShip", "Escorteur Infidel")):setType("playership")
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

function RaiderInfidelTourellesPJ()
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

RaiderInfidelTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
RaiderInfidelPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
RaiderInfidel()

--Création du vaisseau
function CroiseurLegerPestilaan()

--Définition du vaisseau PNJ
function CroiseurLegerPestilaanPNJ()

function CroiseurLegerPestilaanCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Léger Pestilaan"):setLocaleName(_("ship", "Croiseur Léger Pestilaan")):setClass(_("class", "Croiseur Leger"), _("subclass", "Pestilaan")):setModel("Chaos_Light_Cruiser")
template:setDescription(_([[Prédateurs des plus dérangeants, les navires de classe Pestilaan semblent lourds et lents, faits de métal rouillé, de plaies ouvertes dispersées à travers la coque et de saillies organiques immondes. De telles apparences démentent la puissance d’un tel vaisseau, car sa nature pestifère charrie des énergies qui le soutiennent et soutiennent son équipage. On pense que la classe Pestilaan est un ancien croiseur léger oublié depuis longtemps, sur-armé et blindé au prix de la vitesse. La plupart des Pestilaans sont considérés comme des navires autrefois fiers, maintenant dévastés en servitude impure après une mutinerie ou la capture par l’Archiennemi.]]))
--template:setScale(250)
template:setRadarTrace("exuari_4.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.022)
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
template:setSpeed(125, 4.8, 2, 15.625, 4.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurLegerPestilaanCoque()

function CroiseurLegerPestilaanTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 1, 1)
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

end

CroiseurLegerPestilaanTourelles()

function CroiseurLegerPestilaanMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(5, 15)

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

CroiseurLegerPestilaanMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurLegerPestilaanPNJ()

--Création du vaisseau PJ
function CroiseurLegerPestilaanPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Pestilaan"):setLocaleName(_("playerShip", "Croiseur Léger Pestilaan")):setType("playership")
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

function CroiseurLegerPestilaanTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 1, 1)
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
end

CroiseurLegerPestilaanTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurLegerPestilaanPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurLegerPestilaan()

--Création du vaisseau
function VaisseauAssautHellbringer()

--Définition du vaisseau PNJ
function VaisseauAssautHellbringerPNJ()

function VaisseauAssautHellbringerCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Vaisseau d'Assaut Planétaire Hellbringer"):setLocaleName(_("ship", "Vaisseau d'Assaut Planétaire Hellbringer")):setClass(_("class", "Croiseur Leger"), _("subclass", "Hellbringer")):setModel("Chaos_Light_Cruiser")
template:setDescription(_([[Les experts ne savent pas si le Hellbringer est une adaptation d’un navire de guerre existant, ou un nouveau design basé sur d’autres conceptions infâmes utilisées par les hordes du Chaos. Quoi qu’il en soit, les équipages des Hellbringers vivent dans un seul but : piller les civilisations planétaires, qu’il s’agisse d'Impériaux, de Xenos, ou même d’autres adeptes des Dieux Noirs. Arrivant à des systèmes sans méfiance, ces navires peuvent lancer des attaques dévastatrices à l'aide de leurs bordées d'armes ainsi que par l’intermédiaire d’une multitude d’embarcations d’assaut. Une fois que la surface est bombardée et la soumission proche, le ciel est rempli de navettes de débarquement, écrasant rapidement toute opposition alors qu'ils rassemblent les captifs pour les réduire en esclavage, pillant tous les objets de valeur, puis repartant avant que l’aide ne puisse arriver. Il est plus rare, mais pas impossible pour eux d’attaquer des stations spatiales sans défense, apportant une telle destruction qu'il n'en reste généralement plus qu'une coquille vide.]]))
--template:setScale(200)
template:setRadarTrace("exuari_4.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.018)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(650)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(50)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(1.2)
--Energie
template:setEnergyStorage(600)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(200, 6.4, 5, 25, 6.4)
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

VaisseauAssautHellbringerCoque()

function VaisseauAssautHellbringerTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.05)

end

VaisseauAssautHellbringerTourelles()

function VaisseauAssautHellbringerMissiles()
--Nombre de tubes et temps de chargement
template:setTubes(4, 6)

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

--Hangars Bâbords
--Direction (Index,Direction)
template:setTubeDirection(2, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Hangars Tribords
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
template:setWeaponTubeExclusiveForCustom(0,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(2,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(3,"Chasseurs")

end

VaisseauAssautHellbringerMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
VaisseauAssautHellbringerPNJ()

--Création du vaisseau PJ
function VaisseauAssautHellbringerPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Hellbringer"):setLocaleName(_("playerShip", "Vaisseau d'Assaut Planétaire Hellbringer")):setType("playership")
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

function VaisseauAssautHellbringerTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 1, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Lance Dorsale 1
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 20)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 10)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.05)

end

VaisseauAssautHellbringerTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
VaisseauAssautHellbringerPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
VaisseauAssautHellbringer()

--Création du vaisseau
function CroiseurDevastator()

--Définition du vaisseau PNJ
function CroiseurDevastatorPNJ()

function CroiseurDevastatorCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Devastator"):setLocaleName(_("ship", "Croiseur Devastator")):setClass(_("class", "Croiseur"), _("subclass", "Devastator")):setModel("Chaos_Cruiser")
template:setDescription(_([[Transporteur robuste et fiable, le Croiseur de classe Devastator est un navire très apprécié des bandes de pirates et des chefs de guerre renégats. Il possède de puissantes lances à longue portée placées de chaque côté, des batteries de turbo-lasers destructeurs sur sa proue, et peut lancer un nombre considérable de vaisseaux d’attaque depuis ses ponts d’envol. Les Devastators disposent de solides installations de réparation et de réarmement pour ses bombardiers et ses chasseurs, et sous les ponts, des cales entières sont consacrées à des quartiers rudimentaires où logent les troupes d'assaut avant d'mbarquer à bord des Modules d'Assaut Dreadclaws.]]))
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
template:setSpeed(175, 4.8, 2.4, 21.875, 4.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("fighter")

end

CroiseurDevastatorCoque()

function CroiseurDevastatorTourelles()
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

CroiseurDevastatorTourelles()

function CroiseurDevastatorMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(5, 30)

--Macrocanon Avant
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 15)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Macrocanon Avant
--Direction (Index,Direction)
template:setTubeDirection(1, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)	
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanon Avant
--Direction (Index,Direction)
template:setTubeDirection(2, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)	
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Hangars Bâbords
--Direction (Index,Direction)
template:setTubeDirection(3, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Hangars Tribords
--Direction (Index,Direction)
template:setTubeDirection(4,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(4, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(4, "small")

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
template:setCustomWeaponStorage("Chasseurs", 60)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("Chasseurs",1,2)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK3")
template:setWeaponTubeExclusiveForCustom(3,"Chasseurs")
template:setWeaponTubeExclusiveForCustom(4,"Chasseurs")

end

CroiseurDevastatorMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurDevastatorPNJ()

--Création du vaisseau PJ
function CroiseurDevastatorPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Devastator"):setLocaleName(_("playerShip", "Croiseur Devastator")):setType("playership")
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

function CroiseurDevastatorTourellesPJ()
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

CroiseurDevastatorTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurDevastatorPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurDevastator()

--Création du vaisseau
function CroiseurSlaughter()

--Définition du vaisseau PNJ
function CroiseurSlaughterPNJ()

function CroiseurSlaughterCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Slaughter"):setLocaleName(_("ship", "Croiseur Slaughter")):setClass(_("class", "Croiseur"), _("subclass", "Slaughter")):setModel("Chaos_Cruiser")
template:setDescription(_([[Le Croiseur de classe Slaughter utilisait des bobines de moteurs Scartix, ce qui lui permettait de bénéficier d’une vitesse bien plus grande que celle de n’importe quel autre vaisseau. Les plans de ces bobines furent perdus lorsqu'un des croiseurs achevé en 126.M34 se rebella et bombarda le Monde-Forge de Sethelan. Certains pensent que le seul but de cette attaque était précisément d’empêcher la construction de nouveaux vaisseaux de cette classe.]]))
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
template:setSpeed(225, 4.8, 2.4, 28,125, 4.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurSlaughterCoque()

function CroiseurSlaughterTourelles()
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

CroiseurSlaughterTourelles()

function CroiseurSlaughterMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(6, 30)

--Macrocanons avant 1
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(0, "small")

--Macrocanons avant 2
--Direction (Index,Direction)
template:setTubeDirection(1, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanons Bâbords 1
--Direction (Index,Direction)
template:setTubeDirection(2, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Macrocanons Bâbords 2
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
template:setWeaponTubeExclusiveForCustom(4,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(5,"MCANMK2")

end

CroiseurSlaughterMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurSlaughterPNJ()

--Création du vaisseau PJ
function CroiseurSlaughterPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Slaughter"):setLocaleName(_("playerShip", "Croiseur Slaughter")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(15000):setShortRangeRadarRange(6000)

function CroiseurSlaughterTourellesPJ()
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

CroiseurSlaughterTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurSlaughterPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurSlaughter()

--Création du vaisseau
function CroiseurCarnage()

--Définition du vaisseau PNJ
function CroiseurCarnagePNJ()

function CroiseurCarnageCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Carnage"):setLocaleName(_("ship", "Croiseur Carnage")):setClass(_("class", "Croiseur"), _("subclass", "Carnage")):setModel("Chaos_Cruiser")
template:setDescription(_([[Les Croiseurs de classe Carnage furent mis au point pour servir de bâtiments de soutien, utilisant la longue portée de leurs armes pour rester en arrière et appuyer de leurs tirs les autres vaisseaux. L’idée devait se révéler malheureuse, entravée par les difficultés d’approvisionnement en énergie de telles armes, et causa un schisme au sein de la Flotte de Guerre Obscura.]]))
--template:setScale(250)
template:setRadarTrace("cruiser.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(730)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1000)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(175, 4.8, 2.4, 21.875, 4.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurCarnageCoque()

function CroiseurCarnageTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

end

CroiseurCarnageTourelles()

function CroiseurCarnageMissiles()
--Définition des lance missiles

--Nombre de tubes et temps de chargement
template:setTubes(7, 30)

--Macrocanon de Proue
--Direction (Index,Direction)
template:setTubeDirection(0, 0)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(0, 30)	
--Taille des obus (Index, Taille)
template:setTubeSize(0, "medium")

--Macrocanons Lourd Bâbords 1
--Direction (Index,Direction)
template:setTubeDirection(1, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(1, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(1, "small")

--Macrocanons Lourd Tribords 1
--Direction (Index,Direction)
template:setTubeDirection(2,90)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(2, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(2, "small")

--Macrocanons Bâbords 2
--Direction (Index,Direction)
template:setTubeDirection(3, 270)
--Temps de chargement (Index, Temps)
template:setTubeLoadTime(3, 15)
--Taille des obus (Index, Taille)
template:setTubeSize(3, "small")

--Macrocanons Bâbords 3
--Direction (Index,Direction)
template:setTubeDirection(4, 270)
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

--Définition des macrocanons moyens
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK2", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK2", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK2", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK2", 1, 3)

--Définition des macrocanons lourds
--Définition des macrocanons (Type, Nom, Multiplicateur de dégâts, Vitesse, Type de dégâts, Temps de vie)
template:setCustomWeapon("HVLI", "MCANMK4", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK4", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK4", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK4", 3, 4)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(4,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(5,"MCANMK2")
template:setWeaponTubeExclusiveForCustom(6,"MCANMK2")

end

CroiseurCarnageMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurCarnagePNJ()

--Création du vaisseau PJ
function CroiseurCarnagePJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Carnage"):setLocaleName(_("playerShip", "Croiseur Carnage")):setType("playership")
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

function CroiseurCarnageTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

end

CroiseurCarnageTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurCarnagePJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurCarnage()

--Création du vaisseau
function GrandCroiseurRetaliator()

--Définition du vaisseau PNJ
function GrandCroiseurRetaliatorPNJ()

function GrandCroiseurRetaliatorCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Grand Croiseur Retaliator"):setLocaleName(_("ship", "Grand Croiseur Retaliator")):setClass(_("class", "Grand Croiseur"), _("subclass", "Retaliator")):setModel("Chaos_Heavy_Carrier")
template:setDescription(_([[Le Retaliator est un Grand Croiseur polyvalent, équipé d'un large éventail d'armes différents afin de pouvoir combattre l'ennemi à toutes distances. En plus des macrocanons, des lances sidérales et des escadrons d'attaque, l'équipage est généralement rompu aux actions d'abordage, ce qui en fait un adversaire à ne sous estimer à aucun moment.]]))
--template:setScale(310)
template:setRadarTrace("tug.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
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
template:setSpeed(125, 4.8, 2.5, 15.625, 4.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

GrandCroiseurRetaliatorCoque()

function GrandCroiseurRetaliatorTourelles()
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

GrandCroiseurRetaliatorTourelles()

function GrandCroiseurRetaliatorMissiles()
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
template:setCustomWeaponStorage("Chasseurs", 30)
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

GrandCroiseurRetaliatorMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
GrandCroiseurRetaliatorPNJ()

--Création du vaisseau PJ
function GrandCroiseurRetaliatorPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Retaliator"):setLocaleName(_("playerShip", "Grand Croiseur Retaliator")):setType("playership")
--Valeur de recharge des boucliers
variation:setShieldRechargeRate(2.4)
--Module de saut
variation:setJumpDrive(true)
--Portée de saut(Minimum,Maximum)
variation:setJumpDriveRange(5000.0, 50000.0)
--Temps de rechargement après un saut de 10 unités
variation:setJumpDriveChargeTime(60)
--Définition des portées Radar
variation:setLongRangeRadarRange(15000):setShortRangeRadarRange(6000)

function GrandCroiseurRetaliatorTourellesPJ()
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

GrandCroiseurRetaliatorTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
GrandCroiseurRetaliatorPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
GrandCroiseurRetaliator()

--Création du vaisseau
function CroiseurLourdHades()

--Définition du vaisseau PNJ
function CroiseurLourdHadesPNJ()

function CroiseurLourdHadesCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Croiseur Lourd Hades"):setLocaleName(_("ship", "Croiseur Lourd Hades")):setClass(_("class", "Grand Croiseur"), _("subclass", "Hades")):setModel("Chaos_Heavy_Carrier")
template:setDescription(_([[Autrefois considéré comme l’épine dorsale d’une flotte de combat, le Croiseur Lourd de la classe Hades est un navire exceptionnellement dangereux et bien armé, une menace sérieuse pour tout navire de ligne. Les Croiseurs Lourds Hades peuvent déployer une puissance de feu dévastatrice à longue distance, notamment grâce à leurs deux rangées de lances et à leurs batteries d’armes lourdes regroupées sur chaque flanc.]]))
--template:setScale(260)
template:setRadarTrace("tug.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(0.02)
template:setSystemDamageRatio(0.7)
--Coque
template:setHull(750)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(100)
--Valeur de recharge des boucliers
template:setShieldRechargeRate(2.4)
--Energie
template:setEnergyStorage(1500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(175, 4.8, 2.4, 21.875, 4.8)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
template:setCombatManeuver(400, 250)
--Capacité de hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA
template:setDefaultAI("missilevolley")

end

CroiseurLourdHadesCoque()

function CroiseurLourdHadesTourelles()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.15)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(1, 1, 0, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
template:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(1, 0.15)

end

CroiseurLourdHadesTourelles()

function CroiseurLourdHadesMissiles()
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
template:setCustomWeapon("HVLI", "MCANMK4", 6, 4000, "Kinetic", 20)
--Définition de la couleur de l'obus
template:setCustomWeaponColor("MCANMK4", 255, 255, 103)
--Définition du montant stocké (Nom, Stock maximum)
template:setCustomWeaponStorage("MCANMK4", 200)
--Définition de la salve (Nom, nombre de salves, nombre d'objets par salve)
template:setCustomWeaponMultiple("MCANMK4", 3, 4)

--Sélection des munitions
template:setWeaponTubeExclusiveForCustom(0,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(1,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(2,"MCANMK4")
template:setWeaponTubeExclusiveForCustom(3,"MCANMK4")

end

CroiseurLourdHadesMissiles()

end

--Appel de la fonction créant le vaisseau PNJ
CroiseurLourdHadesPNJ()

--Création du vaisseau PJ
function CroiseurLourdHadesPJ()
--Copie du vaisseau PNJ et transformation en vaisseau PJ
variation = template:copy("Hades"):setLocaleName(_("playerShip", "Croiseur Lourd Hades")):setType("playership")
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

function CroiseurLourdHadesTourellesPJ()
--Définition des armes laser

--Tourelles de défense
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(0, 360, 180, 2000, 0.5, 1)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(0, 1)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(0, 0.01)

--Tourelle de Proue
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 90, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.15)

--Tourelle Dorsale
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
variation:setBeamWeapon(1, 1, 0, 10000, 10, 60)
--Paramètres de tourelle (N°d'arme, Arc de tir, orientation, vitesse de rotation)
variation:setBeamWeaponTurret(1, 270, 0, 0.5)
--Ajustement de la consommation d'énergie des tirs
variation:setBeamWeaponEnergyPerFire(1, 30)
--Ajustement de la surchauffe engendrée par les tirs
variation:setBeamWeaponHeatPerFire(1, 0.15)

end

CroiseurLourdHadesTourellesPJ()

end

--Appel de la fonction créant le vaisseau PJ
CroiseurLourdHadesPJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
CroiseurLourdHades()

--Création du vaisseau
function Demon()

--Définition du vaisseau PNJ
function DemonPNJ()

function DemonCoque()
--Description, définition du modèle et de l'icone radar
template = ShipTemplate():setName("Entitee Psychique"):setLocaleName(_("ship", "Entitee Psychique")):setClass(_("class", "Chasseur"), _("subclass", "Erreur")):setModel("sci_fi_alien_ship_6")
template:setDescription(_([[Envoyer quelqu'un dans le Warp sans protection revient à envoyer un nageur dans une mer infestée de requins et lui dire qu'il n'a qu'a nager pour rentrer chez lui. ]]))
template:setSecret(true)
--template:setScale(100)
--template:setRadarTrace("blockade.png")
--Endommagement des systèmes
template:setSystemDamageHullThreshold(1)
template:setSystemDamageRatio(0)
--Coque
template:setHull(0)
--Boucliers (plusieurs valeurs pour plusieurs boucliers)
template:setShields(0)
--Valeur de recharge des boucliers
--template:setShieldRechargeRate(1.2)
--Peut être détruit?
--template:setCanBeDestroyed(false)
--Energie
--template:setEnergyStorage(500)
--Vitesse (vitesse avant max, rotation, accélération, vitesse arrière max, rotation)
template:setSpeed(300, 90, 50, 300, 90)
--Manoeuvre de Combat (vitesse avant, vitesse latérale)
--template:setCombatManeuver(400, 250)
--Capacité de Hack
template:setCanHack(false)
--Sondes
template:setCanLaunchProbe(false)
--Définition du comportement IA

--Autorisation de Dockage
template:setDockClasses(_("class", "Transport"), _("class", "Escorteur"), _("class", "Fregate"))

end

DemonCoque()

function DemonTourelles()
--Griffes
--Axe de tir (N° d'arme, arc de tir, Orientation, portée, délais de tir, dégâts)
template:setBeamWeapon(0, 360, 180, 1000, 1, 2.4)
--Ajustement de la consommation d'énergie des tirs
template:setBeamWeaponEnergyPerFire(0, 0)
--Ajustement de la surchauffe engendrée par les tirs
template:setBeamWeaponHeatPerFire(0, 0)

end

DemonTourelles()

end

--Appel de la fonction créant le vaisseau PNJ
DemonPNJ()

end

--Appel de la fonction créant les vaisseaux PJ et PNJ
Demon()



-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -