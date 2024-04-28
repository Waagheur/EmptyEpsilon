
-- Radiious/ Chasseur : 30-40 fregate/destroyer 160
-- Valeurs à modifier

--MODELES 40K

function Imperium()

--[[Frégate Firestorm]]
function Firestorm()
model = ModelData()
model:setName("Navy_Frigate")
model:setMesh("model3d/Navy_Frigate.obj")
model:setTexture("textures/Navy_Frigate_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Navy_Frigate_Full.jpg")
model:setScale(4)
model:setRadius(100)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

model:addEngineEmitter(-0.75, 0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
model:addEngineEmitter(-0.75,-0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
model:addEngineEmitter(-8,  0, 0.3,  0.2, 0.2, 1.0, 2.0)

end

--[[Transport Leger Civil]]
function Transport()
model = ModelData()
model:setName("Civilian_Transport_Ship")
model:setMesh("model3d/Civilian_Transport_Ship.obj")
model:setTexture("textures/Civilian_Transport_Ship_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Civilian_Transport_Ship_Full.jpg")
model:setScale(4)
model:setRadius(100)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-0.75, 0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
--model:addEngineEmitter(-0.75,-0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
model:addEngineEmitter(-10,  0, 0.3,  0.2, 0.2, 1.0, 3.0)

end

--[[Croiseur Marchand Civil]]
function Marchand()
model = ModelData()
model:setName("Civilian_Transport_Cruiser")
model:setMesh("model3d/Civilian_Transport_Cruiser.obj")
model:setTexture("textures/Civilian_Transport_Cruiser_Full.jpg")
model:setSpecular("") 
model:setIllumination("textures/Civilian_Transport_Cruiser_Full.jpg")
model:setScale(6)
model:setRadius(200)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-30, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
--model:addEngineEmitter(-30,  2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)

end

--[[Destroyer Imperial Cobra]]
function Cobra()
model = ModelData()
model:setName("Navy_Destroyer")
model:setMesh("model3d/Navy_Destroyer.obj")
model:setTexture("textures/Navy_Destroyer_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Navy_Destroyer_Full.jpg")
model:setScale(4)
model:setRadius(100)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-0.75, 0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
--model:addEngineEmitter(-0.75,-0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
model:addEngineEmitter(-8, -2.1500, 0.3,  0.2, 0.2, 1.0, 2.0)
model:addEngineEmitter(-8,  2.1500, 0.3,  0.2, 0.2, 1.0, 2.0)

end

--[[Destroyer du chaos Iconoclast]]
function Iconoclast()
model = ModelData()
model:setName("Chaos_Destroyer")
model:setMesh("model3d/Chaos_Destroyer.obj")
model:setTexture("textures/Chaos_Destroyer_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Chaos_Destroyer_Full.jpg")
model:setScale(4)
model:setRadius(100)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-0.75, 0.2,-0.03,  0.5, 0.5, 1.0, 3.0)
--model:addEngineEmitter(-0.75,-0.2,-0.03,  0.5, 0.5, 1.0, 3.0)

model:addEngineEmitter(-8, -2.1500, 0.3,  1, 0.2, 0.2, 2.0)
model:addEngineEmitter(-8,  2.1500, 0.3,  1, 0.2, 0.2, 2.0)

end

--[[Croiseur leger Dauntless]]
function Dauntless()
model = ModelData()
model:setName("Navy_Light_Cruiser")
model:setMesh("model3d/Navy_Light_Cruiser.obj")
model:setTexture("textures/Navy_Light_Cruiser_Full.png")
model:setSpecular("")
model:setIllumination("textures/Navy_Light_Cruiser_Full.png")
model:setScale(6)
model:setRadius(200)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-0.75, 0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
--model:addEngineEmitter(-0.75,-0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
model:addEngineEmitter(-25, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
model:addEngineEmitter(-25,  2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)

end

--[[Croiseur Gothic]]
function Gothic()
model = ModelData()
model:setName("Navy_Cruiser")
model:setMesh("model3d/Navy_Cruiser.obj")
model:setTexture("textures/Navy_Cruiser_Full.png")
model:setSpecular("")
model:setIllumination("textures/Navy_Cruiser_Full.png")
model:setScale(7)
model:setRadius(250)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

model:addEngineEmitter(-25, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
model:addEngineEmitter(-25,  2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)

end

--[[Croiseur Inquisitorial]]
function Inquisitorial()
model = ModelData()
model:setName("Inquisitorial_Cruiser")
model:setMesh("model3d/Inquisitorial_Cruiser.obj")
model:setTexture("textures/Inquisitorial_Cruiser_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Inquisitorial_Cruiser_Full.jpg")
model:setScale(8)
model:setRadius(350)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

model:addEngineEmitter(-25, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
model:addEngineEmitter(-25,  2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)

end

--[[cuirasse Imperial Emperor]]
function Emperor()
model = ModelData()
model:setName("Navy_Battleship")
model:setMesh("model3d/Navy_Battleship.obj")
model:setTexture("textures/Navy_Battleship_Full.png")
model:setSpecular("")
model:setIllumination("textures/Navy_Battleship_Full.png")
model:setScale(10)
model:setRadius(485)
model:setCollisionBox(2000, 600)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

-- Engin emitter to do 
--model:addEngineEmitter(-180, -30, 1.2,  0.2, 0.2, 1.0, 30.0)
--model:addEngineEmitter(-180,  30, 1.2,  0.2, 0.2, 1.0, 30.0)

end

--[[Croiseur Marchand Rogue]]
function Rogue()
model = ModelData()
model:setName("Rogue_Trader_Cruiser")
model:setMesh("model3d/Rogue_Trader_Cruiser.obj")
model:setTexture("textures/Rogue_Trader_Cruiser_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Rogue_Trader_Cruiser_Full.jpg")
model:setScale(8)
model:setRadius(370)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

model:addEngineEmitter(-15, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
model:addEngineEmitter(-15,  2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)

end

--[[Arche Mechanicus]]
function Mechanicus1()
model = ModelData()
model:setName("Adeptus_Mechanicus_Battleship")
model:setMesh("model3d/Adeptus_Mechanicus_Battleship.obj")
model:setTexture("textures/Adeptus_Mechanicus_Battleship_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Adeptus_Mechanicus_Battleship_Full.jpg")
model:setScale(12)
model:setRadius(850)
model:setCollisionBox(2000, 600)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

model:addEngineEmitter(-30, -30, 1.2,  0.2, 0.2, 1.0, 30.0)
model:addEngineEmitter(-30,  30, 1.2,  0.2, 0.2, 1.0, 30.0)

end

--[[Arche Mechanicus  croiseur ]]
function Mechanicus2()
model = ModelData()
model:setName("Adeptus_Mechanicus_cruiser")
model:setMesh("model3d/Adeptus_Mechanicus_Battleship.obj")
model:setTexture("textures/Adeptus_Mechanicus_Battleship_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Adeptus_Mechanicus_Battleship_Full.jpg")
model:setScale(7)
model:setRadius(250)
model:setCollisionBox(1200, 300)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-30, -30, 1.2,  0.2, 0.2, 1.0, 30.0)
--model:addEngineEmitter(-30,  30, 1.2,  0.2, 0.2, 1.0, 30.0)

end

--[[Barge de Bataille]]
function Barge()
model = ModelData()
model:setName("Eternal_Crusader_Battlebarge")
model:setMesh("model3d/Eternal_Crusader_Battlebarge.obj")
model:setTexture("textures/Eternal_Crusader_Battlebarge_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Eternal_Crusader_Battlebarge_Full.jpg")
model:setScale(10)
model:setRadius(485)
model:setCollisionBox(2000, 600)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-180, -30, 1.2,  0.2, 0.2, 1.0, 30.0)
--model:addEngineEmitter(-180,  30, 1.2,  0.2, 0.2, 1.0, 30.0)

end

--[[Grande station Imperial]]
function Station()
model = ModelData()
model:setName("Navy_Station")
model:setMesh("model3d/Navy_Station.obj")
model:setTexture("textures/Navy_Station_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Navy_Station_Full.jpg")
model:setRenderOffset(0, 0, 3)
--model:setRenderOffset(0, 0, 5)
--Taille visuelle de l'objet
model:setScale(35)
--Taille de la hitbox
model:setRadius(1500)
--model:setCollisionBox(1800, 1800)

end

Firestorm()
Transport()
Marchand()
Cobra()
Iconoclast()
Dauntless()
Gothic()
--Inquisitorial()
Emperor()
Rogue()
Mechanicus1()
Mechanicus2()
Barge()
Station()

end

function Chaos()

--[[Croiseur leger du chaos Slaughter]]
function Slaughter()
model = ModelData()
model:setName("Chaos_Light_Cruiser")
model:setMesh("model3d/Chaos_Light_Cruiser.obj")
model:setTexture("textures/Chaos_Light_Cruiser_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Chaos_Light_Cruiser_Full.jpg")
model:setScale(7)
model:setRadius(250)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-0.75, 0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
--model:addEngineEmitter(-0.75,-0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
model:addEngineEmitter(-20, -2.1500, 0.3,  1, 0.2, 0.2, 3.0)
model:addEngineEmitter(-20,  2.1500, 0.3,  1, 0.2, 0.2, 3.0)

end

--[[Croiseur du Chaos Carnage]]
function Carnage()
model = ModelData()
model:setName("Chaos_Cruiser")
model:setMesh("model3d/Chaos_Cruiser.obj")
model:setTexture("textures/Chaos_Cruiser_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Chaos_Cruiser_Full.jpg")
model:setScale(7)
model:setRadius(250)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-25, -2.1500, 0.3,  1.0, 0.2, 0.1, 3.0)
--model:addEngineEmitter(-25,  2.1500, 0.3,  1.0, 0.2, 0.1, 3.0)
model:addEngineEmitter(-20, -2.1500, 0.3,  1, 0.2, 0.2, 3.0)
model:addEngineEmitter(-20,  2.1500, 0.3,  1, 0.2, 0.2, 3.0)
--1.0, 0.2, 0.1, 17.0)

end

--[[Cuirassé du Chaos Despoiler]]
function Despoiler()
model = ModelData()
model:setName("Chaos_Heavy_Carrier")
model:setMesh("model3d/Chaos_Heavy_Carrier.obj")
model:setTexture("textures/Chaos_Heavy_Carrier_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Chaos_Heavy_Carrier_Full.jpg")
model:setScale(10)
model:setRadius(485)
model:setCollisionBox(2000, 600)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-30, -30, 1.2,  1, 0.2, 0.2, 30.0)
--model:addEngineEmitter(-30,  30, 1.2,  1, 0.2, 0.2, 30.0)

end

Slaughter()
Carnage()
Despoiler()

end

function Xenos()
--[[Chasseur Eldar Corsair]]
function ChasseurEldar()
model = ModelData()
--Nom de la texture
model:setName("Eldar_Corsair_Fighter")
model:setMesh("model3d/Eldar_Corsair_Fighter.obj")
model:setTexture("textures/Eldar_Corsair_Fighter_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Eldar_Corsair_Fighter_Full.jpg")
--Taille visuelle de l'objet
model:setScale(40)
--Taille de la hitbox
model:setRadius(70)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(1.8, 0, 0.03)
model:addEngineEmitter(-1.5, 0.42, -0.13,  0.5, 0.5, 1.0, 0.5)
model:addEngineEmitter(-1.5,-0.42, -0.13,  0.5, 0.5, 1.0, 0.5)
model:addEngineEmitter(-1.5, 0.42, 0.33,  0.5, 0.5, 1.0, 0.5)
model:addEngineEmitter(-1.5,-0.42, 0.33,  0.5, 0.5, 1.0, 0.5)

model:addEngineEmitter(-28, -1.5, -5,  1.0, 0.2, 0.2, 3.0)
model:addEngineEmitter(-28,  1.5, -5,  1.0, 0.2, 0.2, 3.0)

end

--[[Bombardier Eldar Corsair]]
function BombardierEldar()
model = ModelData()
--Nom de la texture
model:setName("Eldar_Corsair_Bomber")
model:setMesh("model3d/Eldar_Corsair_Bomber.obj")
model:setTexture("textures/Eldar_Corsair_Bomber_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Eldar_Corsair_Bomber_Full.jpg")
--Taille visuelle de l'objet
model:setScale(30)
--Taille de la hitbox
model:setRadius(40)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(1.8, 0, 0.03)
model:addBeamPosition(1.8, 0.13, 0.03)
model:addBeamPosition(1.8,-0.13, 0.03)
model:addTubePosition(1.8, 0, 0.03)
model:addEngineEmitter(-1.5, 0.42, -0.13,  0.5, 0.5, 1.0, 0.5)
model:addEngineEmitter(-1.5,-0.42, -0.13,  0.5, 0.5, 1.0, 0.5)
model:addEngineEmitter(-1.5, 0.42, 0.33,  0.5, 0.5, 1.0, 0.5)
model:addEngineEmitter(-1.5,-0.42, 0.33,  0.5, 0.5, 1.0, 0.5)

end

--[[Croiseur leger Eldar Corsaire]]
function CroiseurLegerEldar()
model = ModelData()
model:setName("Eldar_Corsair_Light_Cruiser")
model:setMesh("model3d/Eldar_Corsair_Light_Cruiser.obj")
model:setTexture("textures/Eldar_Corsair_Light_Cruiser_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Eldar_Corsair_Light_Cruiser_Full.jpg")
model:setScale(5)
model:setRadius(170)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-0.75, 0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
--model:addEngineEmitter(-0.75,-0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
model:addEngineEmitter(-5,  0, 0.3,  0.2, 0.2, 1.0, 2.0)
--model:addEngineEmitter(-25, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
--model:addEngineEmitter(-25,  2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)

end

--[[Croiseur Corsair Eldar Torture]]
function Torture()
model = ModelData()
model:setName("Eldar_Corsair_Cruiser")
model:setMesh("model3d/Eldar_Corsair_Cruiser.obj")
model:setTexture("textures/Eldar_Corsair_Cruiser_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Eldar_Corsair_Cruiser_Full.jpg")
model:setScale(8)
model:setRadius(235)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

model:addEngineEmitter(-5,  0, 0.3,  0.2, 0.2, 1.0, 2.5)

end

--[[Croiseur Marchand Il'porrui]]
function Tau()
model = ModelData()
model:setName("Tau_Merchant_Cruiser")
model:setMesh("model3d/Tau_Merchant_Cruiser.obj")
model:setTexture("textures/Tau_Merchant_Cruiser_Full.jpg")
model:setSpecular("")
model:setIllumination("textures/Tau_Merchant_Cruiser_Full.jpg")
model:setScale(8)
model:setRadius(350)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)

--model:addEngineEmitter(-30, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
--model:addEngineEmitter(-30,  2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)

end

ChasseurEldar()
BombardierEldar()
CroiseurLegerEldar()
Torture()
Tau()

end

--ANCIENS MODELES

function Non40KUtilise()

function Alien()
model = ModelData()
model:setName("sci_fi_alien_ship_6")
model:setMesh("sci_fi_alien_ship_6/sci_fi_alien_ship_6.model")
model:setTexture("sci_fi_alien_ship_6/sci_fi_alien_ship_6_color.jpg")
model:setSpecular("sci_fi_alien_ship_6/sci_fi_alien_ship_6_specular.jpg")
model:setIllumination("sci_fi_alien_ship_6/sci_fi_alien_ship_6_illumination.jpg")
model:setScale(3)
model:setRadius(150)

end

function Frigate()
model = ModelData()
model:setName("small_frigate_3")
model:setMesh("small_frigate_3/small_frigate_3.model")
model:setTexture("small_frigate_3/small_frigate_3_color.png")
model:setSpecular("small_frigate_3/small_frigate_3_specular.png")
model:setIllumination("small_frigate_3/small_frigate_3_illumination.png")
model:setScale(0.4)
model:setRadius(150)

model:addEngineEmitter(-91, 32,-4,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-95, 32,-17,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-91,-32,-4,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-95,-32,-17,  0.2, 0.2, 1.0, 8.0)

end

function Station3()

model = ModelData()
model:setName("space_station_3")
model:setMesh("space_station_3/space_station_3.model")
model:setTexture("space_station_3/space_station_3_color.jpg")
model:setSpecular("space_station_3/space_station_3_specular.jpg")
model:setIllumination("space_station_3/space_station_3_illumination.jpg")
model:setRenderOffset(10, 0, 5)
model:setScale(20)
model:setRadius(1000)
model:setCollisionBox(1200, 1000)

end

function Station4()

model = ModelData()
model:setName("space_station_4")
model:setMesh("space_station_4/space_station_4.model")
model:setTexture("space_station_4/space_station_4_color.jpg")
model:setSpecular("space_station_4/space_station_4_specular.jpg")
model:setIllumination("space_station_4/space_station_4_illumination.jpg")
model:setRenderOffset(0, 0, 5)
model:setScale(10)
model:setRadius(300)
model:setCollisionBox(400, 400)

end


Alien()
Frigate()
Station3()
Station4()

end

function Non40K()

model = ModelData()
model:setName("space_station_2")
model:setMesh("space_station_2/space_station_2.model")
model:setTexture("space_station_2/space_station_2_color.jpg")
model:setSpecular("space_station_2/space_station_2_specular.jpg")
model:setIllumination("space_station_2/space_station_2_illumination.jpg")
model:setRenderOffset(10, 0, 5)
model:setScale(20)
model:setRadius(1300)
model:setCollisionBox(1400, 1000)

model = ModelData()
model:setName("space_station_1")
model:setMesh("space_station_1/space_station_1.model")
model:setTexture("space_station_1/space_station_1_color.jpg")
model:setSpecular("space_station_1/space_station_1_specular.jpg")
model:setIllumination("space_station_1/space_station_1_illumination.jpg")
model:setRenderOffset(0, 0, 5)
model:setScale(20)
model:setRadius(1500)
model:setCollisionBox(2000, 1800)

model = ModelData()
model:setName("small_fighter_1")
model:setMesh("small_fighter_1.model")
model:setTexture("small_fighter_1_color.jpg")
model:setSpecular("small_fighter_1_specular.jpg")
model:setIllumination("small_fighter_1_illumination.jpg")
model:setScale(3)
model:setRadius(40)

-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(23, 0, -1.8)
model:addEngineEmitter(-8, 0, 0.5,  1.0, 0.2, 0.2, 1.5)


--model = ModelData()
--model:setName("space_tug")
--model:setMesh("space_tug.model")
--model:setTexture("space_tug_color.jpg")
--model:setSpecular("space_tug_illumination.jpg")
--model:setIllumination("space_tug_illumination.jpg")
--model:setScale(6)
--model:setRadius(80)

--model:addEngineEmitter(-13, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
--model:addEngineEmitter(-13,  2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)



model = ModelData()
model:setName("space_frigate_6")
model:setMesh("space_frigate_6.model")
model:setTexture("space_frigate_6_color.png")
model:setSpecular("space_frigate_6_specular.png")
model:setIllumination("space_frigate_6_illumination.png")
model:setScale(6)
model:setRadius(100)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(-1.6, -8, -2)
model:addBeamPosition(-1.6,  8, -2)
model:addTubePosition(18, 0, -3.5)
model:addTubePosition(18, 0, -3.5)
model:addEngineEmitter(-18, 0, -1,  0.2, 0.2, 1.0, 6.0)


model = ModelData()
model:setName("space_cruiser_4")
model:setMesh("space_cruiser_4.model")
model:setTexture("space_cruiser_4_color.jpg")
--model:setSpecular("space_cruiser_4_illumination.jpg")
model:setIllumination("space_cruiser_4_illumination.jpg")
model:setScale(8)
model:setRadius(100)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addTubePosition(2, -10, -2.3)
model:addTubePosition(2,  10, -2.3)
model:addEngineEmitter(-13, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
model:addEngineEmitter(-13, 2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)

model = ModelData()
model:setName("dark_fighter_6")
model:setMesh("dark_fighter_6.model")
model:setTexture("dark_fighter_6_color.png")
model:setSpecular("dark_fighter_6_specular.png")
model:setIllumination("dark_fighter_6_illumination.png")
model:setScale(1)
model:setRadius(60)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(21, -28.2, -2)
model:addBeamPosition(21,  28.2, -2)
model:addEngineEmitter(-28, -1.5, -5,  1.0, 0.2, 0.2, 3.0)
model:addEngineEmitter(-28,  1.5, -5,  1.0, 0.2, 0.2, 3.0)


model = ModelData()
model:setName("battleship_destroyer_1_upgraded")
model:setMesh("battleship_destroyer_1_upgraded/battleship_destroyer_1_upgraded.model")
model:setTexture("battleship_destroyer_1_upgraded/battleship_destroyer_1_upgraded_color.jpg")
model:setSpecular("battleship_destroyer_1_upgraded/battleship_destroyer_1_upgraded_specular.jpg")
model:setIllumination("battleship_destroyer_1_upgraded/battleship_destroyer_1_upgraded_illumination.jpg")
model:setScale(4)
model:setRadius(200)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(34, -17, -7)
model:addBeamPosition(34,  17, -7)
model:addBeamPosition(-5, -33, -1)
model:addBeamPosition(-5,  33, -1)
model:addTubePosition(5, -7, -11)
model:addTubePosition(5,  7, -11)
model:addEngineEmitter(-30, 0, -3,  1.0, 0.2, 0.1, 14.0)
model:addEngineEmitter(-33, 12, -1,  1.0, 0.2, 0.1, 17.0)
model:addEngineEmitter(-33,-12, -1,  1.0, 0.2, 0.1, 17.0)
model:addEngineEmitter(-33, 22, -1,  1.0, 0.2, 0.1, 14.0)
model:addEngineEmitter(-33,-22, -1,  1.0, 0.2, 0.1, 14.0)

model = ModelData()
model:setName("battleship_destroyer_2_upgraded")
model:setMesh("battleship_destroyer_2_upgraded/battleship_destroyer_2_upgraded.model")
model:setTexture("battleship_destroyer_2_upgraded/battleship_destroyer_2_upgraded_color.jpg")
model:setSpecular("battleship_destroyer_2_upgraded/battleship_destroyer_2_upgraded_specular.jpg")
model:setIllumination("battleship_destroyer_2_upgraded/battleship_destroyer_2_upgraded_illumination.jpg")
model:setScale(4)
model:setRadius(200)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(37, -14.5, -3.5)
model:addBeamPosition(37,  14.5, -3.5)
model:addBeamPosition(10, -12, -15)
model:addBeamPosition(10,  12, -15)
model:addBeamPosition(-9, -28, -3)
model:addBeamPosition(-9,  28, -3)
model:addEngineEmitter(-33, 0, -3,  1.0, 0.2, 0.1, 14.0)
model:addEngineEmitter(-36, 14, -4,  1.0, 0.2, 0.1, 17.0)
model:addEngineEmitter(-36,-14, -4,  1.0, 0.2, 0.1, 17.0)

model = ModelData()
model:setName("battleship_destroyer_3_upgraded")
model:setMesh("battleship_destroyer_3_upgraded/battleship_destroyer_3_upgraded.model")
model:setTexture("battleship_destroyer_3_upgraded/battleship_destroyer_3_upgraded_color.jpg")
model:setSpecular("battleship_destroyer_3_upgraded/battleship_destroyer_3_upgraded_specular.jpg")
model:setIllumination("battleship_destroyer_3_upgraded/battleship_destroyer_3_upgraded_illumination.jpg")
model:setScale(4)
model:setRadius(200)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(22,  22, -4.5)
model:addBeamPosition(22, -22, -4.5)
model:addBeamPosition(12,  22, -4.5)
model:addBeamPosition(12, -22, -4.5)

model:addEngineEmitter(-34, 0, 0,  1.0, 0.2, 0.1, 14.0)
model:addEngineEmitter(-36, 13, 0,  1.0, 0.2, 0.1, 17.0)
model:addEngineEmitter(-36,-13, 0,  1.0, 0.2, 0.1, 17.0)

model = ModelData()
model:setName("battleship_destroyer_4_upgraded")
model:setMesh("battleship_destroyer_4_upgraded/battleship_destroyer_4_upgraded.model")
model:setTexture("battleship_destroyer_4_upgraded/battleship_destroyer_4_upgraded_color.jpg")
model:setSpecular("battleship_destroyer_4_upgraded/battleship_destroyer_4_upgraded_specular.jpg")
model:setIllumination("battleship_destroyer_4_upgraded/battleship_destroyer_4_upgraded_illumination.jpg")
model:setScale(4)
model:setRadius(200)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(4, -27, -0.5)
model:addBeamPosition(4,  27, -0.5)
model:addTubePosition(30, -11, -0.5)
model:addTubePosition(30,  11, -0.5)
model:addEngineEmitter(-27, 0, -4,  1.0, 0.2, 0.1, 14.0)
model:addEngineEmitter(-32, 11.5, -1.5,  1.0, 0.2, 0.1, 13.0)
model:addEngineEmitter(-32,-11.5, -1.5,  1.0, 0.2, 0.1, 13.0)
model:addEngineEmitter(-30, 20, -1.5,  1.0, 0.2, 0.1, 10.0)
model:addEngineEmitter(-32,-20, -1.5,  1.0, 0.2, 0.1, 10.0)

model = ModelData()
model:setName("battleship_destroyer_5_upgraded")
model:setMesh("battleship_destroyer_5_upgraded/battleship_destroyer_5_upgraded.model")
model:setTexture("battleship_destroyer_5_upgraded/battleship_destroyer_5_upgraded_color.jpg")
model:setSpecular("battleship_destroyer_5_upgraded/battleship_destroyer_5_upgraded_specular.jpg")
model:setIllumination("battleship_destroyer_5_upgraded/battleship_destroyer_5_upgraded_illumination.jpg")
model:setScale(4)
model:setRadius(200)

-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(4, -27, -0.5)
model:addBeamPosition(4,  27, -0.5)
model:addTubePosition(27, 0, -0.5)
model:addTubePosition(27, 0, -0.5)
model:addEngineEmitter(-33, 0, 0,  1.0, 0.2, 0.1, 16.0)
model:addEngineEmitter(-28, 13, -0,  1.0, 0.2, 0.1, 13.0)
model:addEngineEmitter(-28,-13, -0,  1.0, 0.2, 0.1, 13.0)
model:addEngineEmitter(-27, 24, 0,  1.0, 0.2, 0.1, 5.0)
model:addEngineEmitter(-27,-24, 0,  1.0, 0.2, 0.1, 5.0)


model = ModelData()
model:setName("Ender Battlecruiser")
model:setMesh("Ender Battlecruiser.obj")
model:setTexture("Ender Battlecruiser.png")
model:setSpecular("Ender Battlecruiser_illumination.png")
model:setIllumination("Ender Battlecruiser_illumination.png")
model:setScale(5)
model:setRadius(1000)
model:setCollisionBox(2000, 600)
-- Positions visuelles des faisceaux/lance missiles (position : -X, Y, Z)
model:addBeamPosition(66, -71, 12)
model:addBeamPosition(66, -71, -12)
model:addBeamPosition(66,  71, 12)
model:addBeamPosition(66,  71, -12)
model:addBeamPosition(-32, -71, 12)
model:addBeamPosition(-32, -71, -12)
model:addBeamPosition(-32,  71, 12)
model:addBeamPosition(-32,  71, -12)
model:addBeamPosition(-112, -71, 12)
model:addBeamPosition(-112, -71, -12)
model:addBeamPosition(-112,  71, 12)
model:addBeamPosition(-112,  71, -12)
model:addEngineEmitter(-180, -30, 1.2,  0.2, 0.2, 1.0, 30.0)
model:addEngineEmitter(-180,  30, 1.2,  0.2, 0.2, 1.0, 30.0)


model = ModelData()
model:setName("sci_fi_alien_ship_1")
model:setMesh("sci_fi_alien_ship_1/sci_fi_alien_ship_1.model")
model:setTexture("sci_fi_alien_ship_1/sci_fi_alien_ship_1_color.jpg")
model:setSpecular("sci_fi_alien_ship_1/sci_fi_alien_ship_1_specular.jpg")
model:setIllumination("sci_fi_alien_ship_1/sci_fi_alien_ship_1_illumination.jpg")
model:setScale(3)
model:setRadius(180)

model = ModelData()
model:setName("sci_fi_alien_ship_2")
model:setMesh("sci_fi_alien_ship_2/sci_fi_alien_ship_2.model")
model:setTexture("sci_fi_alien_ship_2/sci_fi_alien_ship_2_color.jpg")
model:setSpecular("sci_fi_alien_ship_2/sci_fi_alien_ship_2_specular.jpg")
model:setIllumination("sci_fi_alien_ship_2/sci_fi_alien_ship_2_illumination.jpg")
model:setScale(3)
model:setRadius(180)

model = ModelData()
model:setName("sci_fi_alien_ship_3")
model:setMesh("sci_fi_alien_ship_3/sci_fi_alien_ship_3.model")
model:setTexture("sci_fi_alien_ship_3/sci_fi_alien_ship_3_color.jpg")
model:setSpecular("sci_fi_alien_ship_3/sci_fi_alien_ship_3_specular.jpg")
model:setIllumination("sci_fi_alien_ship_3/sci_fi_alien_ship_3_illumination.jpg")
model:setScale(3)
model:setRadius(150)

model = ModelData()
model:setName("sci_fi_alien_ship_4")
model:setMesh("sci_fi_alien_ship_4/sci_fi_alien_ship_4.model")
model:setTexture("sci_fi_alien_ship_4/sci_fi_alien_ship_4_color.jpg")
model:setSpecular("sci_fi_alien_ship_4/sci_fi_alien_ship_4_specular.jpg")
model:setIllumination("sci_fi_alien_ship_4/sci_fi_alien_ship_4_illumination.jpg")
model:setScale(3)
model:setRadius(150)

model = ModelData()
model:setName("sci_fi_alien_ship_5")
model:setMesh("sci_fi_alien_ship_5/sci_fi_alien_ship_5.model")
model:setTexture("sci_fi_alien_ship_5/sci_fi_alien_ship_5_color.jpg")
model:setSpecular("sci_fi_alien_ship_5/sci_fi_alien_ship_5_specular.jpg")
model:setIllumination("sci_fi_alien_ship_5/sci_fi_alien_ship_5_illumination.jpg")
model:setScale(3)
model:setRadius(150)

model = ModelData()
model:setName("sci_fi_alien_ship_7")
model:setMesh("sci_fi_alien_ship_7/sci_fi_alien_ship_7.model")
model:setTexture("sci_fi_alien_ship_7/sci_fi_alien_ship_7_color.jpg")
model:setSpecular("sci_fi_alien_ship_7/sci_fi_alien_ship_7_specular.jpg")
model:setIllumination("sci_fi_alien_ship_7/sci_fi_alien_ship_7_illumination.jpg")
model:setScale(6)
model:setRadius(330)

model = ModelData()
model:setName("sci_fi_alien_ship_8")
model:setMesh("sci_fi_alien_ship_8/sci_fi_alien_ship_8.model")
model:setTexture("sci_fi_alien_ship_8/sci_fi_alien_ship_8_color.jpg")
model:setSpecular("sci_fi_alien_ship_8/sci_fi_alien_ship_8_specular.jpg")
model:setIllumination("sci_fi_alien_ship_8/sci_fi_alien_ship_8_illumination.jpg")
model:setScale(6)
model:setRadius(350)

model = ModelData()
model:setName("ammo_box")
model:setRadius(50)
model:setMesh("ammo_box.obj")
model:setTexture("ammo_box.png")
model:setSpecular("ammo_box_specular.png")
model:setIllumination("ammo_box_illumination.png")

model = ModelData()
model:setName("shield_generator")
model:setRadius(150)
model:setScale(3)
model:setMesh("Shield bubble generator.obj")
model:setTexture("Shield bubble generator.jpg")
model:setSpecular("Shield bubble generator specular.jpg")

model = ModelData()
model:setName("small_frigate_1")
model:setMesh("small_frigate_1/small_frigate_1.model")
model:setTexture("small_frigate_1/small_frigate_1_color.png")
model:setSpecular("small_frigate_1/small_frigate_1_specular.png")
model:setIllumination("small_frigate_1/small_frigate_1_illumination.png")
model:setScale(1)
model:setRadius(100)

model:addEngineEmitter(-85, 33, 2,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-85, 33, 14,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-85,-33, 2,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-85,-33, 14,  0.2, 0.2, 1.0, 8.0)

model = ModelData()
model:setName("small_frigate_2")
model:setMesh("small_frigate_2/small_frigate_2.model")
model:setTexture("small_frigate_2/small_frigate_2_color.png")
model:setSpecular("small_frigate_2/small_frigate_2_specular.png")
model:setIllumination("small_frigate_2/small_frigate_2_illumination.png")
model:setScale(1)
model:setRadius(80)

model:addEngineEmitter(-75, 53,-27,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-75,-53,-27,  0.2, 0.2, 1.0, 8.0)

model = ModelData()
model:setName("small_frigate_4")
model:setMesh("small_frigate_4/small_frigate_4.model")
model:setTexture("small_frigate_4/small_frigate_4_color.png")
model:setSpecular("small_frigate_4/small_frigate_4_specular.png")
model:setIllumination("small_frigate_4/small_frigate_4_illumination.png")
model:setScale(1)
model:setRadius(100)

model:addEngineEmitter(-81, 10,-4,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-81,  0,-4,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-81,-10,-4,  0.2, 0.2, 1.0, 8.0)

model = ModelData()
model:setName("small_frigate_5")
model:setMesh("small_frigate_5/small_frigate_5.model")
model:setTexture("small_frigate_5/small_frigate_5_color.png")
model:setSpecular("small_frigate_5/small_frigate_5_specular.png")
model:setIllumination("small_frigate_5/small_frigate_5_illumination.png")
model:setScale(1)
model:setRadius(80)

model:addEngineEmitter(-95, 30, 8,  0.2, 0.2, 1.0, 5.0)
model:addEngineEmitter(-95, 30, 0,  0.2, 0.2, 1.0, 5.0)
model:addEngineEmitter(-95, 30,-8,  0.2, 0.2, 1.0, 5.0)
model:addEngineEmitter(-95,-30, 8,  0.2, 0.2, 1.0, 5.0)
model:addEngineEmitter(-95,-30, 0,  0.2, 0.2, 1.0, 5.0)
model:addEngineEmitter(-95,-30,-8,  0.2, 0.2, 1.0, 5.0)


ModelData():setName("artifact1"):setScale(3):setRadius(50):setMesh("Artifact1.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact2"):setScale(3):setRadius(50):setMesh("Artifact2.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact3"):setScale(3):setRadius(50):setMesh("Artifact3.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact4"):setScale(3):setRadius(50):setMesh("Artifact4.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact5"):setScale(3):setRadius(50):setMesh("Artifact5.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact6"):setScale(3):setRadius(50):setMesh("Artifact6.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact7"):setScale(3):setRadius(50):setMesh("Artifact7.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact8"):setScale(3):setRadius(50):setMesh("Artifact8.obj"):setTexture("electric_sphere_texture.png")

end

function transports()

for type=1,5 do
    for cnt=1,5 do
        model = ModelData():setName("transport_" .. type .. "_" .. cnt)
        model:setScale(0.5)
        model:setRadius(100 + cnt * 50)
        model:setCollisionBox(200 + cnt * 100, 200)
        model:setMesh("transport_space_ship_" .. type .. "/transport_space_ship_" .. type .. "_cargo_" .. cnt .. ".model")
        model:setTexture("transport_space_ship_" .. type .. "/transport_space_ship_" .. type .. "_color.png")
        model:setSpecular("transport_space_ship_" .. type .. "/transport_space_ship_" .. type .. "_specular.png")
        model:setIllumination("transport_space_ship_" .. type .. "/transport_space_ship_" .. type .. "_illumination.png")
    end
end

end

Imperium()
Chaos()
Xenos()
Non40KUtilise()
--Non40K()
--transports()