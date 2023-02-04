#ifndef SHIP_CARGO_H
#define SHIP_CARGO_H

#include "P.h"
#include "shipTemplate.h"
#include "cargo.h"
#include "spaceObjects/spaceship.h"
#include "multiplayer_client.h"

//class ShipCargo;
class ShipTemplate;

class ShipCargo : public Cargo
{
public:
  string callsign;
  string template_name;
  int32_t base_carrier_id; 

private:
  float hull_strength;
  bool has_reactor;
  bool has_cloaking;
  float systems_health[SYS_COUNT];
  bool auto_repair_enabled;
  bool auto_coolant_enabled;
public:
  ShipCargo();
  ShipCargo(P<ShipTemplate> ship_template);
  ShipCargo(P<SpaceShip> cargo);

  ShipCargo::Entries getEntries() override;
  string getCallSign() override { return callsign; }
  P<ShipTemplate> getTemplate() { return ShipTemplate::getTemplate(template_name); }
  float getMaxEnergy() override { return getTemplate()->energy_storage_amount; }
  float getMaxHealth() override { return getTemplate()->hull * (SYS_COUNT + 1); }
  float getHealth() override ;
  void addHealth(float amount) override;
  P<ModelData> getModel() override;
  bool onLaunch(Dock &source) override;
  P<SpaceShip> getBaseCarrier() //null if not based
  { return (game_server) ? game_server->getObjectById(base_carrier_id) : game_client->getObjectById(base_carrier_id);}
  void setBaseCarrier(P<SpaceShip> iBased) { assert(iBased); base_carrier_id = iBased->getMultiplayerId(); }

};

#endif //SHIP_CARGO_H
