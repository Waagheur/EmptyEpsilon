#include "hotkeyConfig.h"
#include "preferenceManager.h"
#include "shipTemplate.h"

HotkeyConfig hotkeys;

HotkeyConfig::HotkeyConfig()
{  // this list includes all Hotkeys and their standard configuration
    newCategory("GENERAL", "General");
    newKey("NEXT_STATION", std::make_tuple("Station suivante", "Tab"));
    newKey("PREV_STATION", std::make_tuple("Station precedente", ""));
    newKey("STATION_HELMS", std::make_tuple("Station pilote", "F2"));
    newKey("STATION_WEAPONS", std::make_tuple("Station artilleur", "F3"));
    newKey("STATION_ENGINEERING", std::make_tuple("Station ingenieur", "F4"));
    newKey("STATION_SCIENCE", std::make_tuple("Station Analyste", "F5"));
    newKey("STATION_RELAY", std::make_tuple("Station relais", "F6"));
    
    newCategory("HELMS", "Pilote");
    newKey("INC_IMPULSE", std::make_tuple("Augmenter Impulsion", "Up"));
    newKey("DEC_IMPULSE", std::make_tuple("Diminuer Impulsion", "Down"));
    newKey("ZERO_IMPULSE", std::make_tuple("Impulsion nulle", "Space"));
    newKey("MAX_IMPULSE", std::make_tuple("Impulsion max", ""));
    newKey("MIN_IMPULSE", std::make_tuple("Impulsion max inverse", ""));
    newKey("TURN_LEFT", std::make_tuple("Tourner a gauche", "Gauche"));
    newKey("TURN_RIGHT", std::make_tuple("Tourner a droite", "Droite"));
    newKey("WARP_0", std::make_tuple("WARP 0", ""));
    newKey("WARP_1", std::make_tuple("Warp 1", ""));
    newKey("WARP_2", std::make_tuple("Warp 2", ""));
    newKey("WARP_3", std::make_tuple("Warp 3", ""));
    newKey("WARP_4", std::make_tuple("Warp 4", ""));
    newKey("DOCK_ACTION", std::make_tuple("Actions dock", "D"));
    newKey("DOCK_REQUEST", std::make_tuple("Demander dock", ""));
    newKey("DOCK_ABORT", std::make_tuple("Annuler demande dock", ""));
    newKey("UNDOCK", std::make_tuple("Se Dedocker", "D"));
    newKey("INC_JUMP", std::make_tuple("Augmentation distance JUMP", ""));
    newKey("DEC_JUMP", std::make_tuple("Diminution distance JUMP", ""));
    newKey("JUMP", std::make_tuple("Activer JUMP", ""));
    //newKey("COMBAT_LEFT", "Manoeuvre de combat gauche");
    //newKey("COMBAT_RIGHT", "Manoeuvre de combat droite");
    //newKey("COMBAT_BOOST", "Manoeuvre de combat avant");

    newCategory("WEAPONS", "Artilleur");
    newKey("SELECT_MISSILE_TYPE_HOMING", std::make_tuple("Selectionner TCC", "Num1"));
    newKey("SELECT_MISSILE_TYPE_NUKE", std::make_tuple("Selectionner TCN", "Num2"));
    newKey("SELECT_MISSILE_TYPE_MINE", std::make_tuple("Selectionner Mine", "Num3"));
    newKey("SELECT_MISSILE_TYPE_EMP", std::make_tuple("Selectionner TCI", "Num4"));
    newKey("SELECT_MISSILE_TYPE_HVLI", std::make_tuple("Selectionner TBHV", "Num5"));
    for(int n=0; n<max_weapon_tubes; n++)
        newKey(std::string("LOAD_TUBE_") + string(n+1), std::make_tuple(std::string("Load tube ") + string(n+1), ""));
    for(int n=0; n<max_weapon_tubes; n++)
        newKey(std::string("UNLOAD_TUBE_") + string(n+1), std::make_tuple(std::string("Unload tube ") + string(n+1), ""));
    for(int n=0; n<max_weapon_tubes; n++)
        newKey(std::string("FIRE_TUBE_") + string(n+1), std::make_tuple(std::string("Fire tube ") + string(n+1), ""));
    newKey("NEXT_ENEMY_TARGET", std::make_tuple("Cible ennemie suivante", ""));
    newKey("NEXT_TARGET", std::make_tuple("Select next target (any)", ""));
    newKey("TOGGLE_SHIELDS", std::make_tuple("Action boucliers", "S"));
    newKey("ENABLE_SHIELDS", std::make_tuple("Activer Boucliers", ""));
    newKey("DISABLE_SHIELDS", std::make_tuple("Desactiver Boucliers", ""));
    newKey("BEAM_SUBSYSTEM_TARGET_NEXT", std::make_tuple("systeme cible suivant", ""));
    newKey("BEAM_SUBSYSTEM_TARGET_PREV", std::make_tuple("systeme cible precedent", ""));
    newKey("BEAM_FREQUENCY_INCREASE", std::make_tuple("augmenter frequence lasers", ""));
    newKey("BEAM_FREQUENCY_DECREASE", std::make_tuple("Diminuer frequence lasers", ""));
    newKey("TOGGLE_AIM_LOCK", std::make_tuple("Action visee manuelle", ""));
    newKey("ENABLE_AIM_LOCK", std::make_tuple("activer visee manuelle", ""));
    newKey("DISABLE_AIM_LOCK", std::make_tuple("desactiver visee manuelle", ""));
    newKey("AIM_MISSILE_LEFT", std::make_tuple("visee manuelle a gauche", ""));
    newKey("AIM_MISSILE_RIGHT", std::make_tuple("visee manuelle a droite", ""));
    
    newCategory("ENGINEERING", "Ingenieur");
    newKey("SELECT_REACTOR", std::make_tuple("Selectionner systeme reacteur", "Num1"));
    newKey("SELECT_BEAM_WEAPONS", std::make_tuple("Selectionner systeme lasers", "Num2"));
    newKey("SELECT_MISSILE_SYSTEM", std::make_tuple("Selectionner systeme missiles", "Num3"));
    newKey("SELECT_MANEUVER", std::make_tuple("Selectionner systeme manoeuvre", "Num4"));
    newKey("SELECT_IMPULSE", std::make_tuple("Selectionner systeme impulsion", "Num5"));
    newKey("SELECT_WARP", std::make_tuple("Selectionner systeme WARP", "Num6"));
    newKey("SELECT_JUMP_DRIVE", std::make_tuple("Selectionner systeme JUMP", "Num7"));
    newKey("SELECT_FRONT_SHIELDS", std::make_tuple("Selectionner systeme boucliers avants", "Num8"));
    newKey("SELECT_REAR_SHIELDS", std::make_tuple("Selectionner systeme boucliers arrieres", "Num9"));
    newKey("INCREASE_POWER", std::make_tuple("Augmenter puissance du systeme", "Up"));
    newKey("DECREASE_POWER", std::make_tuple("Diminuer puissance du systeme", "Down"));
    newKey("INCREASE_COOLANT", std::make_tuple("Augmenter refroidissement du systeme", "Droite"));
    newKey("DECREASE_COOLANT", std::make_tuple("Diminuer refroidissement du systeme", "Gauche"));
    newKey("NEXT_REPAIR_CREW", std::make_tuple("Equipe de reparation suivante", ""));
    newKey("REPAIR_CREW_MOVE_UP", std::make_tuple("Deplacer equipe de reparation haut", ""));
    newKey("REPAIR_CREW_MOVE_DOWN", std::make_tuple("Deplacer equipe de reparation bas", ""));
    newKey("REPAIR_CREW_MOVE_LEFT", std::make_tuple("Deplacer equipe de reparation gauche", ""));
    newKey("REPAIR_CREW_MOVE_RIGHT", std::make_tuple("Deplacer equipe de reparation droite", ""));
    newKey("SHIELD_CAL_INC", std::make_tuple("Augmenter frequence boucliers", ""));
    newKey("SHIELD_CAL_DEC", std::make_tuple("Diminuer frequence boucliers", ""));
    newKey("SHIELD_CAL_START", std::make_tuple("Calibrer les boucliers", ""));
    newKey("SELF_DESTRUCT_START", std::make_tuple("Activer l'auto destruction", ""));
    newKey("SELF_DESTRUCT_CONFIRM", std::make_tuple("Confirmer l'auto destruction", ""));
    newKey("SELF_DESTRUCT_CANCEL", std::make_tuple("Annuler l'auto destruction", ""));

}

static std::vector<std::pair<string, sf::Keyboard::Key> > sfml_key_names = {
    {"A", sf::Keyboard::A},
    {"B", sf::Keyboard::B},
    {"C", sf::Keyboard::C},
    {"D", sf::Keyboard::D},
    {"E", sf::Keyboard::E},
    {"F", sf::Keyboard::F},
    {"G", sf::Keyboard::G},
    {"H", sf::Keyboard::H},
    {"I", sf::Keyboard::I},
    {"J", sf::Keyboard::J},
    {"K", sf::Keyboard::K},
    {"L", sf::Keyboard::L},
    {"M", sf::Keyboard::M},
    {"N", sf::Keyboard::N},
    {"O", sf::Keyboard::O},
    {"P", sf::Keyboard::P},
    {"Q", sf::Keyboard::Q},
    {"R", sf::Keyboard::R},
    {"S", sf::Keyboard::S},
    {"T", sf::Keyboard::T},
    {"U", sf::Keyboard::U},
    {"V", sf::Keyboard::V},
    {"W", sf::Keyboard::W},
    {"X", sf::Keyboard::X},
    {"Y", sf::Keyboard::Y},
    {"Z", sf::Keyboard::Z},
    {"Num0", sf::Keyboard::Num0},
    {"Num1", sf::Keyboard::Num1},
    {"Num2", sf::Keyboard::Num2},
    {"Num3", sf::Keyboard::Num3},
    {"Num4", sf::Keyboard::Num4},
    {"Num5", sf::Keyboard::Num5},
    {"Num6", sf::Keyboard::Num6},
    {"Num7", sf::Keyboard::Num7},
    {"Num8", sf::Keyboard::Num8},
    {"Num9", sf::Keyboard::Num9},
    {"Escape", sf::Keyboard::Escape},
    {"LControl", sf::Keyboard::LControl},
    {"LShift", sf::Keyboard::LShift},
    {"LAlt", sf::Keyboard::LAlt},
    {"LSystem", sf::Keyboard::LSystem},
    {"RControl", sf::Keyboard::RControl},
    {"RShift", sf::Keyboard::RShift},
    {"RAlt", sf::Keyboard::RAlt},
    {"RSystem", sf::Keyboard::RSystem},
    {"Menu", sf::Keyboard::Menu},
    {"LBracket", sf::Keyboard::LBracket},
    {"RBracket", sf::Keyboard::RBracket},
    {"SemiColon", sf::Keyboard::SemiColon},
    {"Comma", sf::Keyboard::Comma},
    {"Period", sf::Keyboard::Period},
    {"Quote", sf::Keyboard::Quote},
    {"Slash", sf::Keyboard::Slash},
    {"BackSlash", sf::Keyboard::BackSlash},
    {"Tilde", sf::Keyboard::Tilde},
    {"Equal", sf::Keyboard::Equal},
    {"Dash", sf::Keyboard::Dash},
    {"Space", sf::Keyboard::Space},
    {"Retour", sf::Keyboard::Return},
    {"BackSpace", sf::Keyboard::BackSpace},
    {"Tab", sf::Keyboard::Tab},
    {"PageUp", sf::Keyboard::PageUp},
    {"PageDown", sf::Keyboard::PageDown},
    {"End", sf::Keyboard::End},
    {"Home", sf::Keyboard::Home},
    {"Insert", sf::Keyboard::Insert},
    {"Delete", sf::Keyboard::Delete},
    {"Add", sf::Keyboard::Add},
    {"Subtract", sf::Keyboard::Subtract},
    {"Multiply", sf::Keyboard::Multiply},
    {"Divide", sf::Keyboard::Divide},
    {"Gauche", sf::Keyboard::Left},
    {"Droite", sf::Keyboard::Right},
    {"Up", sf::Keyboard::Up},
    {"Down", sf::Keyboard::Down},
    {"Numpad0", sf::Keyboard::Numpad0},
    {"Numpad1", sf::Keyboard::Numpad1},
    {"Numpad2", sf::Keyboard::Numpad2},
    {"Numpad3", sf::Keyboard::Numpad3},
    {"Numpad4", sf::Keyboard::Numpad4},
    {"Numpad5", sf::Keyboard::Numpad5},
    {"Numpad6", sf::Keyboard::Numpad6},
    {"Numpad7", sf::Keyboard::Numpad7},
    {"Numpad8", sf::Keyboard::Numpad8},
    {"Numpad9", sf::Keyboard::Numpad9},
    {"F1", sf::Keyboard::F1},
    {"F2", sf::Keyboard::F2},
    {"F3", sf::Keyboard::F3},
    {"F4", sf::Keyboard::F4},
    {"F5", sf::Keyboard::F5},
    {"F6", sf::Keyboard::F6},
    {"F7", sf::Keyboard::F7},
    {"F8", sf::Keyboard::F8},
    {"F9", sf::Keyboard::F9},
    {"F10", sf::Keyboard::F10},
    {"F11", sf::Keyboard::F11},
    {"F12", sf::Keyboard::F12},
    {"F13", sf::Keyboard::F13},
    {"F14", sf::Keyboard::F14},
    {"F15", sf::Keyboard::F15},
    {"Pause", sf::Keyboard::Pause},
};

void HotkeyConfig::load()
{
    for(HotkeyConfigCategory& cat : categories)
    {
        for(HotkeyConfigItem& item : cat.hotkeys)
        {
            string key_config = PreferencesManager::get(std::string("HOTKEY.") + cat.key + "." + item.key, std::get<1>(item.value));
            item.load(key_config);
        }
    }
}

std::vector<HotkeyResult> HotkeyConfig::getHotkey(sf::Event::KeyEvent key)
{
    std::vector<HotkeyResult> results;
    for(HotkeyConfigCategory& cat : categories)
    {
        for(HotkeyConfigItem& item : cat.hotkeys)
        {
            if (item.hotkey.code == key.code && item.hotkey.alt == key.alt && item.hotkey.control == key.control && item.hotkey.shift == key.shift && item.hotkey.system == key.system)
            {
                results.emplace_back(cat.key, item.key);
            }
        }
    }
    return results;
}

void HotkeyConfig::newCategory(string key, string name)
{
    categories.emplace_back();
    categories.back().key = key;
    categories.back().name = name;
}

void HotkeyConfig::newKey(string key, std::tuple<string, string> value)
{
    categories.back().hotkeys.emplace_back(key, value);
}

std::vector<string> HotkeyConfig::getCategories()
{
    // Initialize return value.
    std::vector<string> ret;

    // Add each category to the return value.
    for(HotkeyConfigCategory& cat : categories)
    {
        ret.push_back(cat.name);
    }

    return ret;
}

std::vector<std::pair<string, string>> HotkeyConfig::listHotkeysByCategory(string hotkey_category)
{
    std::vector<std::pair<string, string>> ret;

    for(HotkeyConfigCategory& cat : categories)
    {
        if (cat.name == hotkey_category)
        {
            for(HotkeyConfigItem& item : cat.hotkeys)
            {
                for(auto key_name : sfml_key_names)
                {
                    if (key_name.second == item.hotkey.code)
                        ret.push_back({std::get<0>(item.value), key_name.first});
                }
            }
        }
    }

    return ret;
}

HotkeyConfigItem::HotkeyConfigItem(string key, std::tuple<string, string> value)
{
    this->key = key;
    this->value = value;
    hotkey.code = sf::Keyboard::KeyCount;
    hotkey.alt = false;
    hotkey.control = false;
    hotkey.shift = false;
    hotkey.system = false;
}

void HotkeyConfigItem::load(string key_config)
{
    for(const string& config : key_config.split(";"))
    {
        if (config == "[alt]")
            hotkey.alt = true;
        else if (config == "[control]")
            hotkey.control = true;
        else if (config == "[shift]")
            hotkey.shift = true;
        else if (config == "[system]")
            hotkey.system = true;
        else
        {
            for(auto key_name : sfml_key_names)
            {
                if (key_name.first == config)
                {
                    hotkey.code = key_name.second;
                    break;
                }
            }
        }
    }
}