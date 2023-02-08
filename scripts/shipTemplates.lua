--[[
Base of the ship templates, from here different classes of ships are included to be used within the game.
Each sub-file defines it's own set of ship classes.

These are:
* Stations: For different kinds of space stations, from tiny to huge.
* Drones: Smallest ships in the game. docked inside other ships.
* Starfighters: Small ships. fast and simple.
* Frigates: Medium sized ships. Operate on a small crew.
* Covette: Large, slower, less maneuverable ships.
* Dreadnaught: Huge things. Everything in here is really really big, and generally really really deadly.
* Exuari: Ships with a similar style, designed (but not limited) for the Exuari faction.

Player ships are in general large frigates to small corvette class
--]]
require("shiptemplates/40k/Stations.lua")
---[[Ajouts 40k
require("shiptemplates/40k/VaisseauxLegers.lua")
require("shiptemplates/40k/Fregates.lua")
require("shiptemplates/40k/Escorteurs.lua")
require("shiptemplates/40k/CroiseursLegers.lua")
require("shiptemplates/40k/Croiseurs.lua")
require("shiptemplates/40k/Cuirasses.lua")
require("shiptemplates/40k/Capitaux.lua")
require("shiptemplates/40k/Autres.lua")
require("shiptemplates/40k/Jouables.lua")
require("shiptemplates/satellites.lua") --TODO mettre en 40k
---[[Until these are ready, they are disabled
---require("shipTemplates_Drones.lua")
---require("shipTemplates_StarFighters.lua")
--require("shipTemplates_Frigates.lua")
--require("shipTemplates_Corvettes.lua")
--require("shipTemplates_Dreadnaught.lua")
--]]
--For now, we add our old ship templates as well. These should be removed at some point.
--require("shipTemplates_OLD.lua")
