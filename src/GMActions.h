#ifndef GM_ACTIONS
#define GM_ACTIONS

#include "multiplayer.h"

enum EShipOrder
{
    SO_Idle,
    SO_Roaming,
    SO_StandGround,
    SO_DefendLocation
};

class GameMasterActions;
class SpaceObject;
class PlayerSpaceship;
extern P<GameMasterActions> gameMasterActions;

class GameMasterActions : public MultiplayerObject
{

public:
    PVector<SpaceObject> *gmSelectionForRunningScript;

    GameMasterActions();

    void commandRunScript(string code);
    void commandSendGlobalMessage(string message);
    void commandInterceptAllCommsToGm(bool value);
    void commandCallGmScript(uint32_t index, PVector<SpaceObject> selection);
    void commandMoveObjects(glm::vec2 delta, PVector<SpaceObject> selection);
    void commandSetGameSpeed(float speed);
    void commandSetFactionId(uint32_t faction_id, PVector<SpaceObject> selection);
    void commandSetPersonalityId(uint32_t faction_id, PVector<SpaceObject> selection);
    void commandContextualGoTo(glm::vec2 position, bool force, PVector<SpaceObject> selection);
    void commandOrderShip(EShipOrder order, PVector<SpaceObject> selection);
    void commandDestroy(PVector<SpaceObject> selection);
    void commandSendCommToPlayerShip(P<PlayerSpaceship> target, string line);
    virtual void onReceiveClientCommand(int32_t client_id, sp::io::DataBuffer& packet) override;

private:
    void executeContextualGoTo(glm::vec2 position, bool force, PVector<SpaceObject> selection);
};

#endif//GM_ACTIONS
