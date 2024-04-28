--[[Le contenu de cette base de données est simplement constitué de textes qui n'affectent pas les données de jeu et servent simplement à enrichir l'univers de jeu.--]]


space_objects = ScienceDatabase():setName(_('Objets Spatiaux'))
item = space_objects:addEntry(_('Asteroïdes'))
item:setLongDescription(_([[Les Astéroïdes sont des objets planétaires généralement issus de la formation des systèmes solaires. Majoritairement rocheux ou métalliques, ils peuvent mesurer de quelques centimètres à plusieurs kilomètres. Si les plus petits sont généralement repoussés des vaisseaux par les boucliers, les plus gros peuvent les traverser et causer d'importants dommages.]]))

item = space_objects:addEntry(_('Nebuleuse'))
item:setLongDescription(_([[Les Nébuleuses sont des nuages de gazs qui se sont regroupés sous l'effet de la gravité. Leur nature tend à brouiller les appareils de détection, ce qui limite les observations à longue distance. Les nébuleuses sont connues des officiers spatiaux pour leur capacité à dissimuler des pirates ou autres vaisseaux en embuscade.]]))

item = space_objects:addEntry(_('Trou noir'))
item:setLongDescription(_([[Un trou noir est un objet stellaire caractérisé par une forte attraction gravitationnelle capable de happer même la lumière. Tout ce qui approche un trou noir est rapidement aspiré et broyé par les forces gravitationnelles de son centre. Si un vaisseau s'approche trop près d'un trou noir, ses moteurs ne seront bien vite plus assez puissant pour l'en éloigner.]]))

item = space_objects:addEntry(_('Faille Warp'))
item:setLongDescription(_([[Une faille Warp est un passage entre l'univers materiel (aussi appelé Materium) et l'espace Warp (aussi appelé Immaterium). De tels passages sont normalement créés lorsque la frontière entre les deux univers est affaiblie par des phénomènes psychiques ou les moteurs Warp d'un vaisseau. Les objets à proximité sont rapidement absorbés par ce qui se trouve de l'autre côté de la faille et changent de dimension. Il est rappelé à tous qu'un vaisseau ne peut éspérer survivre au Warp sans Champ Geller, un bouclier repoussant l'influence de l'Immaterium et maintenant une "bulle de normalité" autour du vaisseau.]]))

weapons = ScienceDatabase():setName(_('Armements'))
weapons:setLongDescription(_([[Cette base de données répertorie les armements les plus courants employés par l'Imperium et ses ennemis. Chaque armement existe en une multitude de variantes, bien que la base de fonctionnement reste la même.]]))


item = weapons:addEntry(_('Macrocanons'))
item:setLongDescription(_([[Comme leur nom l'indique, les macrocanons sont des pièces d'artillerie monumentales capables de projetter des obus explosifs d'une tonne (ou parfois, des salves de plasma encore plus destructrices) sur les vaisseaux ennemis afin de saturer leurs boucliers sous un déluge d'impacts. Les macrocannons nécessitent des équipes nombreuses pour manipuler et charger leurs énormes obus dans les culasses. Les équipages doivent également composer avec le fait d’être assis au sommet d’un magasin rempli de suffisamment de munitions pour raser une ville. De nombreux capitaines préfèrent malgré tout la fiabilité des macrocannons  aux autres armements malgré le labeur qu’ils nécessitent, car même après avoir subi des dégâts considérables, les macrocannons peuvent encore se charger et tirer longtemps après que les armes à énergie se soient tues.

Les macrocannons sont généralement montés dans des salles d’armes individuelles afin de limiter les dégâts si leur chargeur explose, ce qui fait que l’équipage est exposé à la chaleur, à la sueur et au danger. Les murs et le plancher des ponts d'artillerie comportant généralement les quartiers de l’équipage sous la forme de cellules éparses, et l’accès aux différentes zones du navire étant limité aux matelots, toute destruction d'une pièce d'artillerie s'accompagne généralement de la perte des hommes d'équipage qui y sont assignés. Les membres de l’équipage recrutés par la force sont les plus susceptibles d’être affectés à une batterie de canons dans un premier temps. C’est un travail simple et pénible qui nécessite peu d’expérience : hisser et mettre en place des munitions de plusieurs tonnes, et orienter le canon à l'aide des cordages qui y sont suspendus.]]))

item = weapons:addEntry(_('Lances sidérales'))
item:setLongDescription(_([[Une lance sidérale est une arme à énergie généralement montée en proue ou en tourelle, souvent vue sur les vaisseaux de guerre Impériaux, bien que certaines espèces Xenos semblent posséder des armements similaires. Ce type d'arme repose sur la formation et la projection d'un faisceau d'énergie particulièrement puissant. L'efficacité d'une tourelle Sidérale peut être augmentée en remplaçant le projecteur par plusieurs modèles plus petits dont les faisceaux sont focalisés en un seul. L'arme résultante est capable d'attaquer directement les systèmes interne d'n vaisseau en traversant le blindage comme du papier.

Si le macrocanon est un marteau utilisé pour fracasser l'ennemi, la lance est donc une rapière conçue pour le pourfendre. Cependant, les boucliers demeurent efficaces pour stopper les tirs de lances sidérales, aussi un capitaine avisé préfèrera généralement les faire tomber avec quelques obus de macrocanons afin de maximiser l'efficacité des lances.]]))

item = weapons:addEntry(_('Torpilles'))
item:setLongDescription(_([[Le terme "torpille" désigne traditionellement un missile à long rayon d'action emporté à bord d'un vaisseau. Se présentant généralement sous la forme d'une ogive de 60m de long contenant plusieurs sous-ogives volatiles et propulsée par un réacteur à plasma à courte durée de vie, les torpilles sont appréciées par les Capitaines pour leur énorme potentiel de destruction. Cependant, leur déplacement rectiligne après tir, bien que leur permettant d'accumuler une énergie cinétique considérable, fait que les navires suffisamment éloignés peuvent facilement estimer leur trajectoire et les éviter. Ainsi, bien que meurtirères, les torpilles ne touchent que rarement leur cible.

Il existe de nombreuses variantes de la torpille à ogive plasma classique, comme les torpilles à fusion et leurs charges thermonucléaires, les torpilles d'abordage qui embarquent une équipe d'assaut, ou encore de rares torpilles équipées d'un esprit de la machine meurtrier, capable d'ajuster sa trajectoire en cours de route. Chacune de ces armes est hautement mortelle, et si un accident de chargement d'un obus de macrocanon peut causer la mort de milliers d'hommes, un accident de chargement de torpille peut causer la perte de tout le vaisseau. C’est justement pour cette raison que les équipages des torpilles sont composés de matelots plus expérimentés que ceux des canons.]]))

item = weapons:addEntry(_('Canons Nova'))
item:setLongDescription(_([[Les Canons Nova sont des armes exceptionnellement puissantes qui ne peuvent être montées que sous les proues lourdement blindées des croiseurs et des cuirassés de la marine impériale. Ils n'ont que peu d’égaux en termes de portée ou de puissance destructrice. Bien qu’il existe des variantes, un Canon Nova se compose généralement d’un ensemble de puissants impulseurs gravimétriques conçus pour accélérer un projectile jusqu’à une fraction de la vitesse de la lumière. Ces projectiles varient davantage que la nature des canons eux-mêmes, allant d’ogives de plasma sophistiquées qui brûlent avec la férocité d’une petite étoile pendant une fraction de seconde, à des dispositifs implosifs qui exercent des forces gravitationnelles destructrices sur tous ceux qui se trouvent dans un rayon de plusieurs milliers de kilomètres autour de la détonation. Ainsi, en raison de la nature létale de leurs ogives, les obus des Canons Nova ne sont armés qu’une fraction de seconde après le tir, ce qui leur permet de parcourir plusieurs dizaines de milliers de kilomètres dans le vide avant de devenir vraiment mortels.

Cependant, ces armes sont souvent mal considérées par la Marine Impériale, car elles sont imprécises et nécessitent un vaisseau stable pour tirer efficacement, aussi la plupart des capitaines préférent utiliser les torpilles plus traditionnelles. Les rares personnes qui préfèrent cette arme savent qu’elle est difficile à utiliser et souvent inutile à courte portée, mais un Canon Nova bien utilisé est quelque chose de terrifiant à affronter, tout autant un outil psychologique qu’une arme.]]))

item = weapons:addEntry(_('baies de lancement'))
item:setLongDescription(_([[Les baies de lancement sont des endroits très animés, généralement constitués d’un hangar central ouvert entouré de plusieurs ateliers d’usinage, de magasins d’armes et de zones de maintenance. Un Croiseur peut avoir des escadrons entiers d’intercepteurs et de bombardiers alignés sur des berceaux prêts à être lancés, tandis qu’un vaisseau plus petit peut n’avoir qu’une poignée de vaisseaux d’attaque dédiés partageant la baie avec d’autres vaisseaux interplanétaires. Ces vaisseaux peuvent être des intercepteurs, des bombardiers ou encore des vaisseaux d'abordage, selon le cadre de l'affrontement et les modèles disponibles, évidemment.

La plupart des baies de lancement sont construites de manière à s’ouvrir directement sur l’espace, avec un champ énergétique recouvrant l’entrée pour maintenir l’atmosphère à l’intérieur de la coque, bien que les vaisseaux dotés de baies de lancement soient réputés pour leurs "fuites" à cet égard. Des volets blindés sont utilisés pour sceller complètement la baie entre les lancements et les retraits au cours d’une bataille et pour les transitions dans le Warp. De lourdes cloisons isolent les baies de lancement du reste du vaisseau au cas où un tir perdu entrerait dans la baie et provoquerait la mise à feu des munitions en attente de chargement.]]))
