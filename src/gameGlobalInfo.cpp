#include <i18n.h>
#include "gameGlobalInfo.h"
#include "preferenceManager.h"
#include "scienceDatabase.h"
#include "resources.h"
#include <regex>

static inline sp::io::DataBuffer& operator << (sp::io::DataBuffer& packet, const ECommsGmInterception& cgi) { return packet << int(cgi); }
static inline sp::io::DataBuffer& operator >> (sp::io::DataBuffer& packet, ECommsGmInterception& cgi) {
    int value;
    packet >> value;
    cgi = ECommsGmInterception(value);
    return packet;
}
#include "multiplayer_client.h"
#include "soundManager.h"
#include "random.h"
#include "config.h"
#include <SDL_assert.h>

P<GameGlobalInfo> gameGlobalInfo;

REGISTER_MULTIPLAYER_CLASS(GameGlobalInfo, "GameGlobalInfo")
GameGlobalInfo::GameGlobalInfo()
: MultiplayerObject("GameGlobalInfo")
{
    SDL_assert(!gameGlobalInfo);

    callsign_counter = 0;
    victory_faction = -1;
    gameGlobalInfo = this;

    for(int n=0; n<max_player_ships; n++)
    {
        playerShipId[n] = -1;
        registerMemberReplication(&playerShipId[n]);
    }

    global_message_timeout = 0.0;
    scanning_complexity = SC_Normal;
    hacking_difficulty = 2;
    hacking_games = HG_All;
    use_beam_shield_frequencies = true;
    use_system_damage = true;
    use_repair_crew = false;
    allow_main_screen_tactical_radar = true;
    allow_main_screen_long_range_radar = true;
    allow_main_screen_target_analysis = true;
    allow_main_screen_global_range_radar = true;
    allow_main_screen_ship_state = true;
    intercept_all_comms_to_gm = CGI_None;
    use_nano_repair_crew = true;
    use_long_range_for_relay = true;
    use_complex_radar_signatures = false;
    hack_efficiency_ratio = 1.0;
    ai_missile_attack_range = 7500;
    
    gm_control_code = "";
    elapsed_time = 0.0f;

    registerMemberReplication(&scanning_complexity);
    registerMemberReplication(&hacking_difficulty);
    registerMemberReplication(&hacking_games);
    registerMemberReplication(&global_message);
    registerMemberReplication(&global_message_timeout, 1.0);
    registerMemberReplication(&banner_string);
    registerMemberReplication(&victory_faction);
    registerMemberReplication(&use_beam_shield_frequencies);
    registerMemberReplication(&use_system_damage);
    registerMemberReplication(&use_repair_crew);
    registerMemberReplication(&allow_main_screen_tactical_radar);
    registerMemberReplication(&allow_main_screen_long_range_radar);
    registerMemberReplication(&allow_main_screen_global_range_radar);
    registerMemberReplication(&allow_main_screen_ship_state);
    registerMemberReplication(&gm_callback_names);
    registerMemberReplication(&intercept_all_comms_to_gm);
    registerMemberReplication(&allow_main_screen_target_analysis);
    registerMemberReplication(&use_nano_repair_crew);
    registerMemberReplication(&use_long_range_for_relay);
    registerMemberReplication(&use_complex_radar_signatures);
    registerMemberReplication(&hack_efficiency_ratio);
    registerMemberReplication(&ai_missile_attack_range);
    registerMemberReplication(&gm_control_code);
    registerMemberReplication(&elapsed_time, 0.1);

    for(unsigned int n=0; n<factionInfo.size(); n++)
        reputation_points.push_back(0);
    registerMemberReplication(&reputation_points, 1.0);
}

//due to a suspected compiler bug this deconstructor needs to be explicitly defined
GameGlobalInfo::~GameGlobalInfo()
{
}

P<PlayerSpaceship> GameGlobalInfo::getPlayerShip(int index)
{
    SDL_assert(index >= 0 && index < max_player_ships);
    if (game_server)
        return game_server->getObjectById(playerShipId[index]);
    return game_client->getObjectById(playerShipId[index]);
}

void GameGlobalInfo::setPlayerShip(int index, P<PlayerSpaceship> ship)
{
    SDL_assert(index >= 0 && index < max_player_ships);
    SDL_assert(game_server);

    if (ship)
        playerShipId[index] = ship->getMultiplayerId();
    else
        playerShipId[index] = -1;
}

int GameGlobalInfo::findPlayerShip(P<PlayerSpaceship> ship)
{
    for(int n=0; n<max_player_ships; n++)
        if (getPlayerShip(n) == ship)
            return n;
    return -1;
}

int GameGlobalInfo::insertPlayerShip(P<PlayerSpaceship> ship)
{
    for(int n=0; n<max_player_ships; n++)
    {
        if (!getPlayerShip(n))
        {
            setPlayerShip(n, ship);
            return n;
        }
    }
    return -1;
}

void GameGlobalInfo::update(float delta)
{
    if (global_message_timeout > 0.0f)
    {
        global_message_timeout -= delta;
    }
    if (my_player_info)
    {
        //Set the my_spaceship variable based on the my_player_info->ship_id
        if ((my_spaceship && my_spaceship->getMultiplayerId() != my_player_info->ship_id) || (my_spaceship && my_player_info->ship_id == -1) || (!my_spaceship && my_player_info->ship_id != -1))
        {
            if (game_server)
                my_spaceship = game_server->getObjectById(my_player_info->ship_id);
            else
                my_spaceship = game_client->getObjectById(my_player_info->ship_id);
        }
    }
    elapsed_time += delta;
}

string GameGlobalInfo::getNextShipCallsign()
{
    callsign_counter += 1;
    switch(irandom(0, 9))
    {
    case 0: return "S" + string(callsign_counter);
    case 1: return "NC" + string(callsign_counter);
    case 2: return "CV" + string(callsign_counter);
    case 3: return "SS" + string(callsign_counter);
    case 4: return "VS" + string(callsign_counter);
    case 5: return "BR" + string(callsign_counter);
    case 6: return "CSS" + string(callsign_counter);
    case 7: return "UTI" + string(callsign_counter);
    case 8: return "VK" + string(callsign_counter);
    case 9: return "CCN" + string(callsign_counter);
    }
    return "SS" + string(callsign_counter);
}

void GameGlobalInfo::addScript(P<Script> script)
{
    script_list.update();
    script_list.push_back(script);
}

void GameGlobalInfo::reset()
{
    if (state_logger)
        state_logger->destroy();

    gm_callback_functions.clear();
    gm_messages.clear();
    on_gm_click = nullptr;

    flushDatabaseData();
    FactionInfo::reset();

    foreach(SpaceObject, o, space_object_list)
        o->destroy();
    if (engine->getObject("scenario"))
        engine->getObject("scenario")->destroy();

    foreach(Script, s, script_list)
    {
        s->destroy();
    }
    for(unsigned int n=0; n<reputation_points.size(); n++)
        reputation_points[n] = 0;
    elapsed_time = 0.0f;
    callsign_counter = 0;
    victory_faction = -1;
    allow_new_player_ships = true;
    global_message = "";
    global_message_timeout = 0.0f;

    //Pause the game
    engine->setGameSpeed(0.0);

    foreach(PlayerInfo, p, player_info_list)
    {
        p->reset();
    }
}

void GameGlobalInfo::startScenario(string filename)
{
    reset();

    i18n::reset();
    i18n::load("locale/main." + PreferencesManager::get("language", "en") + ".po");
    i18n::load("locale/comms_ship." + PreferencesManager::get("language", "en") + ".po");
    i18n::load("locale/comms_station." + PreferencesManager::get("language", "en") + ".po");
    i18n::load("locale/factionInfo." + PreferencesManager::get("language", "en") + ".po");
    i18n::load("locale/science_db." + PreferencesManager::get("language", "en") + ".po");
    i18n::load("locale/" + filename.replace(".lua", "." + PreferencesManager::get("language", "en") + ".po"));

    P<ScriptObject> factionInfoScript = new ScriptObject("factionInfo.lua");
    if (factionInfoScript->getError() != "") exit(1);
    factionInfoScript->destroy();

    fillDefaultDatabaseData();

    P<ScriptObject> scienceInfoScript = new ScriptObject("science_db.lua");
    if (scienceInfoScript->getError() != "") exit(1);
    scienceInfoScript->destroy();

    P<ScriptObject> script = new ScriptObject();
    int max_cycles = PreferencesManager::get("script_cycle_limit", "0").toInt();
    if (max_cycles > 0)
        script->setMaxRunCycles(max_cycles);
    script->run(filename);
    engine->registerObject("scenario", script);

    if (PreferencesManager::get("game_logs", "1").toInt())
    {
        state_logger = new GameStateLogger();
        state_logger->start();
    }
}

void GameGlobalInfo::destroy()
{
    reset();
    MultiplayerObject::destroy();
}


std::regex sector_rgx("([a-zA-Z]+)(\\d+)([a-dA-D])");
std::regex location_rgx("([a-zA-Z]+\\d+[a-dA-D]):(\\d+):(\\d+)");

bool isValidSectorName(string sectorName)
{
    return std::regex_match(sectorName, sector_rgx);
}

bool isValidPositionString(string positionStr)
{
    if (isValidSectorName(positionStr))
        return true;
    std::smatch matches;
    if(std::regex_match(positionStr, matches, location_rgx))
    {
        return std::stoi(matches.str(2)) < GameGlobalInfo::sector_size
            && std::stoi(matches.str(3)) < GameGlobalInfo::sector_size;
    } else {
        return false;
    }
}

glm::vec2 getSectorPosition(string sectorName, float correction_x, float correction_y)
{
    std::smatch matches;
    if(std::regex_match(sectorName, matches, sector_rgx))
    {
        string row = string(matches.str(1)).upper();
        int sector_y = 0;
        for(unsigned int i=0; i<row.size(); i++)
            sector_y = sector_y + std::pow(26, row.size() - i - 1) * (row.at(i) - 'A' + 1);
        int sector_x = std::stoi(matches.str(2));
        sector_y = sector_y - 1;
         int quadrant = std::toupper(matches.str(3).at(0)) - 'A';
        if (quadrant % 2)
            sector_x = -1 - sector_x;
        if ((quadrant /2) % 2)
            sector_y = -1 - sector_y;
        return glm::vec2(sector_x * GameGlobalInfo::sector_size + correction_x, sector_y * GameGlobalInfo::sector_size + correction_y);
    }
    else
    {
        return glm::vec2(0,0);
    }
}

glm::vec2 getPositionFromSring(string positionStr, float correction_x, float correction_y)
{
     if (isValidSectorName(positionStr))
        return getSectorPosition(positionStr, correction_x, correction_y);
    std::smatch matches;
    if(std::regex_match(positionStr, matches, location_rgx))
    {
        glm::vec2 sectorPosition = getSectorPosition(matches.str(1), correction_x, correction_y);
        return sectorPosition + glm::vec2(std::stoi(matches.str(2)), std::stoi(matches.str(3)));
    } else {
        return glm::vec2(correction_x,correction_y);
    }
}

string getStringFromPosition(glm::vec2 position, float correction_x, float correction_y)
{
    int offset_x = fmod(fmod(position.x, GameGlobalInfo::sector_size) + GameGlobalInfo::sector_size, GameGlobalInfo::sector_size);
    int offset_y = fmod(fmod(position.y, GameGlobalInfo::sector_size) + GameGlobalInfo::sector_size, GameGlobalInfo::sector_size);
    if (offset_x < 1 && offset_y < 1) {
        return getSectorName(position, correction_x, correction_y);
    } else {
        //return getSectorName(position) + ":" + string(offset_x,0) + ':' + string(offset_y,0);
        return getSectorName(position, correction_x, correction_y);
    }
}

string getSectorName(glm::vec2 position, float correction_x, float correction_y)
{
    position.x = position.x - correction_x;
    position.y = position.y - correction_y;

    int sector_x = floorf(position.x / GameGlobalInfo::sector_size);
    int sector_y = floorf(position.y / GameGlobalInfo::sector_size);
    int quadrant = 0;
    string row = "";
    if (sector_y < 0)
    {
        quadrant += 2;
        sector_y = -1 - sector_y;
    }
    if (sector_x < 0)
    {
        quadrant += 1;
        sector_x = -1 - sector_x;
    }
    while (sector_y > -1)
    {
        row = string(char('A' + (sector_y % 26))) + row;
        sector_y = int(sector_y / 26) - 1;
    }
    return row + string(sector_x) + string(char('A' +quadrant));
}

int getSectorName(lua_State* L)
{
    float x = luaL_checknumber(L, 1);
    float y = luaL_checknumber(L, 2);
    lua_pushstring(L, getSectorName(glm::vec2(x, y)).c_str());
    return 1;
}
/// string getSectorName(float x, float y)
/// Return the sector name for the point with coordinates (x, y). Compare SpaceObject:getSectorName().
REGISTER_SCRIPT_FUNCTION(getSectorName);

glm::vec2 sectorToXY(string sector)
{
    constexpr float sector_size = 20000;
    int x, y, intpart;

    if(sector.length() < 2){
        return glm::vec2(0,0);
    }

    // Y axis is complicated
    if(sector[0] >= char('A') && sector[1] >= char('A')){
        // Case with two letters
        char a1 = sector[0];
        char a2 = sector[1];
        try{
            intpart = stoi(sector.substr(2));
        }
        catch(const std::exception& e){
            return glm::vec2(0,0);
        }
        if(a1 > char('a')){
            // Case with two lowercase letters (zz10) counting down towards the North
            y = (((char('z') - a1) * 26) + (char('z') - a2 + 6)) * -sector_size; // 6 is the offset from F5 to zz5
        }else{
            // Case with two uppercase letters (AB20) counting up towards the South
            y = (((a1 - char('A')) * 26) + (a2 - char('A') + 21)) * sector_size; // 21 is the offset from F5 to AA5
        }
    }else{
        //Case with just one letter (A9/a9 - these are the same sector, as case only matters in the two-letter sectors)
        char alphaPart = toupper(sector[0]);
        try{
            intpart = stoi(sector.substr(1));
        }catch(const std::exception& e){
            return glm::vec2(0,0);
        }
        y = (alphaPart - char('F')) * sector_size;
    }
    // X axis is simple
    x = (intpart - 5) * sector_size; // 5 is the numeric component of the F5 origin
    return glm::vec2(x, y);
}

int sectorToXY(lua_State* L)
{
    glm::vec2 v = sectorToXY(luaL_checklstring(L, 1, NULL));
    lua_pushinteger(L, v.x);
    lua_pushinteger(L, v.y);
    return 2;
}
/// glm::vec2 sectorToXY(string sector_name)
/// Convert a sector name to x,y coordinates for the top-left of the sector
/// sectorToXY("A0") sectorToXY("zz-23") sectorToXY("BA12")
REGISTER_SCRIPT_FUNCTION(sectorToXY);

static int victory(lua_State* L)
{
    gameGlobalInfo->setVictory(luaL_checkstring(L, 1));
    if (engine->getObject("scenario"))
        engine->getObject("scenario")->destroy();
    engine->setGameSpeed(0.0);
    return 0;
}
/// void victory(string faction_name)
/// Called with a faction name as parameter, sets a certain faction as victor and ends the game.
/// (The GM can unpause the game, but the scenario with its update function is destroyed.)
REGISTER_SCRIPT_FUNCTION(victory);

static int globalMessage(lua_State* L)
{
    gameGlobalInfo->global_message = luaL_checkstring(L, 1);
    gameGlobalInfo->global_message_timeout = luaL_optnumber(L, 2, 5.0);
    return 0;
}
/// void globalMessage(string message, std::optional<float> timeout)
/// Show a global message on the main screens of all active player ships.
/// The message is shown for 5 sec; new messages replace the old immediately.
REGISTER_SCRIPT_FUNCTION(globalMessage);

static int setBanner(lua_State* L)
{
    gameGlobalInfo->banner_string = luaL_checkstring(L, 1);
    return 0;
}
/// void setBanner(string banner)
/// Show a scrolling banner containing this text on the cinematic and top down views.
REGISTER_SCRIPT_FUNCTION(setBanner);

static int getScenarioTime(lua_State* L)
{
    lua_pushnumber(L, gameGlobalInfo->elapsed_time);
    return 1;
}
/// float getScenarioTime()
/// Return the elapsed time of the scenario.
REGISTER_SCRIPT_FUNCTION(getScenarioTime);

static int getPlayerShip(lua_State* L)
{
    int index = luaL_checkinteger(L, 1);
    if (index == -1)
    {
        for(index = 0; index<GameGlobalInfo::max_player_ships; index++)
        {
            P<PlayerSpaceship> ship = gameGlobalInfo->getPlayerShip(index);
            if (ship)
                return convert<P<PlayerSpaceship> >::returnType(L, ship);
        }
        return 0;
    }
    if (index < 1 || index > GameGlobalInfo::max_player_ships)
        return 0;
    P<PlayerSpaceship> ship = gameGlobalInfo->getPlayerShip(index - 1);
    if (!ship)
        return 0;
    return convert<P<PlayerSpaceship> >::returnType(L, ship);
}
/// P<PlayerSpaceship> getPlayerShip(int index)
/// Return the player's ship, use -1 to get the first active player ship.
REGISTER_SCRIPT_FUNCTION(getPlayerShip);

static int getPlayerShips(lua_State* L)
{
    PVector<PlayerSpaceship> ships;
    for(int index = 0; index<GameGlobalInfo::max_player_ships; index++)
    {
        P<PlayerSpaceship> ship = gameGlobalInfo->getPlayerShip(index);
        if (ship)
            ships.push_back(ship);
    }
    return convert<PVector<PlayerSpaceship> >::returnType(L, ships);
}
/// getPlayerShip()
/// Return the vector of player's ships.
REGISTER_SCRIPT_FUNCTION(getPlayerShips);
static int getActivePlayerShips(lua_State* L)
{
    PVector<PlayerSpaceship> ships;
    ships.reserve(GameGlobalInfo::max_player_ships);
    for (auto index = 0; index < GameGlobalInfo::max_player_ships; ++index)
    {
        auto ship = gameGlobalInfo->getPlayerShip(index);
        
        if (ship)
        {
            ships.emplace_back(std::move(ship));
        }
    }

    return convert<PVector<PlayerSpaceship>>::returnType(L, ships);
}
/// PVector<PlayerSpaceship> getActivePlayerShips()
/// Return a list of active player ships.
REGISTER_SCRIPT_FUNCTION(getActivePlayerShips);

static int getObjectsInRadius(lua_State* L)
{
    float x = luaL_checknumber(L, 1);
    float y = luaL_checknumber(L, 2);
    float r = luaL_checknumber(L, 3);

    glm::vec2 position(x, y);

    PVector<SpaceObject> objects;
    PVector<Collisionable> objectList = CollisionManager::queryArea(position - glm::vec2(r, r), position + glm::vec2(r, r));
    foreach(Collisionable, obj, objectList)
    {
        P<SpaceObject> sobj = obj;
        if (sobj && glm::length2(sobj->getPosition() - position) < r*r)
            objects.push_back(sobj);
    }

    return convert<PVector<SpaceObject> >::returnType(L, objects);
}
/// PVector<SpaceObject> getObjectsInRadius(float x, float y, float radius)
/// Return a list of all space objects at the x,y location within a certain radius.
REGISTER_SCRIPT_FUNCTION(getObjectsInRadius);

static int getAllObjects(lua_State* L)
{
    return convert<PVector<SpaceObject> >::returnType(L, space_object_list);
}
/// PVector<SpaceObject> getAllObjects()
/// Return a list of all space objects. (Use with care, this could return a very long list which could slow down the game when called every update)
REGISTER_SCRIPT_FUNCTION(getAllObjects);

static int getScenarioVariation(lua_State* L)
{
    if (gameGlobalInfo->scenario_settings.find("variation") != gameGlobalInfo->scenario_settings.end())
        lua_pushstring(L, gameGlobalInfo->scenario_settings["variation"].c_str());
    else
        lua_pushstring(L, "None");
    return 1;
}

// this returns the "variation" scenario setting for backwards compatibility
/// string getScenarioVariation()
/// Returns the currently used scenario variation.
/// Deprecated: Scenario settings are the replacement
REGISTER_SCRIPT_FUNCTION(getScenarioVariation);

static int getScenarioSetting(lua_State* L)
{
    auto key = luaL_checkstring(L, 1);
    if (gameGlobalInfo->scenario_settings.find(key) != gameGlobalInfo->scenario_settings.end())
        lua_pushstring(L, gameGlobalInfo->scenario_settings[key].c_str());
    else
        lua_pushstring(L, "");
    return 1;
}
/// string getScenarioSetting(string key)
/// Returns a scenario setting, or an empty string if the setting is not found.
REGISTER_SCRIPT_FUNCTION(getScenarioSetting);

static int getGameLanguage(lua_State* L)
{
    lua_pushstring(L, PreferencesManager::get("language", "en").c_str());
    return 1;
}
/// string getGameLanguage()
/// Returns the language as the string set in game preferences under language key
REGISTER_SCRIPT_FUNCTION(getGameLanguage);

/** Short lived object to do a scenario change on the update loop. See "setScenario" for details */
class ScenarioChanger : public Updatable
{
public:
    ScenarioChanger(string script_name, const std::unordered_map<string, string>& settings)
    : script_name(script_name), settings(settings)
    {
    }

    virtual void update(float delta) override
    {
        gameGlobalInfo->scenario_settings = settings;
        gameGlobalInfo->startScenario(script_name);
        destroy();
    }
private:
    string script_name;
    std::unordered_map<string, string> settings;
};

static int setScenario(lua_State* L)
{
    string script_name = luaL_checkstring(L, 1);
    string variation = luaL_optstring(L, 2, "");
    //This could be called from a currently active scenario script.
    // Calling GameGlobalInfo::startScenario is unsafe at this point,
    // as this will destroy the lua state that this function is running in.
    //So use the ScenarioChanger object which will do the change in the update loop. Which is safe.
    new ScenarioChanger(script_name, {{"variation", variation}});
    return 0;
}
/// void setScenario(string script_name, std::optional<string> variation_name)
/// Change the current scenario to a different one.
REGISTER_SCRIPT_FUNCTION(setScenario);

static int shutdownGame(lua_State* L)
{
    engine->shutdown();
    return 0;
}
/// void shutdownGame()
/// Shutdown the game.
/// Calling this function will close the game. Mainly useful for a headless server setup.
REGISTER_SCRIPT_FUNCTION(shutdownGame);

static int pauseGame(lua_State* L)
{
    engine->setGameSpeed(0.0);
    return 0;
}
/// void pauseGame()
/// Pause the game
/// Calling this function will pause the game. Mainly useful for a headless server setup.
REGISTER_SCRIPT_FUNCTION(pauseGame);

static int unpauseGame(lua_State* L)
{
    engine->setGameSpeed(1.0);
    return 0;
}
/// void unpauseGame()
/// Pause the game
/// Calling this function will pause the game. Mainly useful for a headless server setup. As the scenario functions are not called when paused.
REGISTER_SCRIPT_FUNCTION(unpauseGame);

static int playSoundFile(lua_State* L)
{
    string filename = luaL_checkstring(L, 1);
    int n = filename.rfind(".");
    if (n > -1)
    {
        string filename_with_locale = filename.substr(0, n) + "." + PreferencesManager::get("language", "en") + filename.substr(n);
        if (getResourceStream(filename_with_locale)) {
            soundManager->playSound(filename_with_locale);
            return 0;
        }
    }
    soundManager->playSound(filename);
    return 0;
}
/// void playSoundFile(string filename)
/// Play a sound file on the server. Will work with any file supported by SFML (.wav, .ogg, .flac)
/// Note that the sound is only played on the server. Not on any of the clients.
REGISTER_SCRIPT_FUNCTION(playSoundFile);

template<> int convert<EScanningComplexity>::returnType(lua_State* L, EScanningComplexity complexity)
{
    switch(complexity)
    {
    case SC_None:
        lua_pushstring(L, "none");
        return 1;
    case SC_Simple:
        lua_pushstring(L, "simple");
        return 1;
    case SC_Normal:
        lua_pushstring(L, "normal");
        return 1;
    case SC_Advanced:
        lua_pushstring(L, "advanced");
        return 1;
    default:
        return 0;
    }
}

static int getScanningComplexity(lua_State* L)
{
    return convert<EScanningComplexity>::returnType(L, gameGlobalInfo->scanning_complexity);
}
/// EScanningComplexity getScanningComplexity()
/// Get the scanning complexity setting
REGISTER_SCRIPT_FUNCTION(getScanningComplexity);

static int getHackingDifficulty(lua_State* L)
{
    lua_pushinteger(L, gameGlobalInfo->hacking_difficulty);
    return 1;
}
/// int getHackingDifficulty()
/// Get the hacking difficulty setting (returns an integer between 0 and 3)
REGISTER_SCRIPT_FUNCTION(getHackingDifficulty);

template<> int convert<EHackingGames>::returnType(lua_State* L, EHackingGames game)
{
    switch(game)
    {
    case HG_Mine:
        lua_pushstring(L, "mines");
        return 1;
    case HG_Lights:
        lua_pushstring(L, "lights");
        return 1;
    case HG_All:
        lua_pushstring(L, "all");
        return 1;
    default:
        return 0;
    }
}

static int getHackingGames(lua_State* L)
{
    return convert<EHackingGames>::returnType(L, gameGlobalInfo->hacking_games);
}
/// EHackingGames getHackingGames()
/// Get the hacking games setting
REGISTER_SCRIPT_FUNCTION(getHackingGames);

static int areBeamShieldFrequenciesUsed(lua_State* L)
{
    lua_pushboolean(L, gameGlobalInfo->use_beam_shield_frequencies);
    return 1;
}
/// bool areBeamShieldFrequenciesUsed()
/// returns if the "Beam/Shield Frequencies" setting is enabled
REGISTER_SCRIPT_FUNCTION(areBeamShieldFrequenciesUsed);

static int isPerSystemDamageUsed(lua_State* L)
{
    lua_pushboolean(L, gameGlobalInfo->use_system_damage);
    return 1;
}
/// bool isPerSystemDamageUsed()
/// returns if the "Per-System Damage" setting is enabled
REGISTER_SCRIPT_FUNCTION(isPerSystemDamageUsed);

static int isTacticalRadarAllowed(lua_State* L)
{
    lua_pushboolean(L, gameGlobalInfo->allow_main_screen_tactical_radar);
    return 1;
}
/// bool isTacticalRadarAllowed()
/// returns if the "Tactical Radar" setting is enabled
REGISTER_SCRIPT_FUNCTION(isTacticalRadarAllowed);

static int isLongRangeRadarAllowed(lua_State* L)
{
    lua_pushboolean(L, gameGlobalInfo->allow_main_screen_long_range_radar);
    return 1;
}
/// bool isLongRangeRadarAllowed()
/// returns if the "Long Range Radar" setting is enabled
REGISTER_SCRIPT_FUNCTION(isLongRangeRadarAllowed);

static int onNewPlayerShip(lua_State* L)
{
    int idx = 1;
    convert<ScriptSimpleCallback>::param(L, idx, gameGlobalInfo->on_new_player_ship);
    return 0;
}
/// Register a callback function that is called when a new player ship is created.
REGISTER_SCRIPT_FUNCTION(onNewPlayerShip);

static int onNewShip(lua_State* L)
{
    int idx = 1;
    convert<ScriptSimpleCallback>::param(L, idx, gameGlobalInfo->on_new_ship);
    return 0;
}
/// Register a callback function that is called when a new ship is created.
REGISTER_SCRIPT_FUNCTION(onNewShip);


static int allowNewPlayerShips(lua_State* L)
{
    gameGlobalInfo->allow_new_player_ships = lua_toboolean(L, 1);
    return 0;
}
/// void allowNewPlayerShips(bool allow)
/// Set if the server is allowed to create new player ships from the ship creation screen.
REGISTER_SCRIPT_FUNCTION(allowNewPlayerShips);

static int getEEVersion(lua_State* L)
{
    lua_pushinteger(L, VERSION_NUMBER);
    return 1;
}
/// string getEEVersion()
/// Get a string with the current version number, like "20191231"
REGISTER_SCRIPT_FUNCTION(getEEVersion);
