-- Name: Basic Template
-- Description: Basic template for EE maps
---
-- Type: Basic
-- Variation[Empty]: Places no enemies. Recommended for GM-controlled scenarios and rookie crew orientation. The scenario continues until the GM declares victory or all Human Navy craft are destroyed.
-- Variation[Easy]: Places fewer enemies. Recommended for inexperienced crews.
-- Variation[Hard]: Places more enemies. Recommended if you have multiple player-controlled ships.
-- Variation[Extreme]: Places many enemies. You're pretty surely overwhelmed.

--- Scenario
-- @script scenario_basic_template

require("utils.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

require("ee.lua") --tsht for systems
require("luax.lua") --tsht for table functions
require("utils_mars21.lua") --tsht toutes les fonctions necessaires pour mars

-- Global variables
-- local xxx
-- End global variables



--Est appele pour tout nouveau vaisseau, CPU ou joueur (mais pas pour les stations)
--You should only have to modify what is between "Begin balance modification" and "end balance modification"
onNewShip(
    function(ship)
		doOnNewShip(ship)
    end
)


onNewPlayerShip(
	function(pc)
		doOnNewPlayerShip(pc)
	end

)


--- Initialize scenario.
function init()
	doInit()
	

end

--- Update.
--
-- @tparam number delta the time delta (in seconds)
function update(delta)
   	doUpdateUtils(delta)
end 
