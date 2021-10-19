#ifndef SERVER_CREATION_SCREEN_H
#define SERVER_CREATION_SCREEN_H

#include "gui/gui2_canvas.h"

class GuiScrollText;
class GuiAutoLayout;
class GuiSelector;
class GuiTextEntry;
class GuiListbox;
class GuiButton;


class ServerSetupScreen : public GuiCanvas
{
public:
    ServerSetupScreen();

private:
    GuiTextEntry* server_name;
    GuiTextEntry* server_password;
    GuiTextEntry* gm_password;
    GuiSelector* server_visibility;
};

class ServerScenarioSelectionScreen : public GuiCanvas
{
public:
    ServerScenarioSelectionScreen();

private:
    GuiListbox* category_list;
    GuiListbox* scenario_list;
    GuiScrollText* description_text;
    GuiButton* start_button;
};

class ServerScenarioOptionsScreen : public GuiCanvas
{
public:
    ServerScenarioOptionsScreen(string filename);

private:
    GuiButton* start_button;
    std::unordered_map<string, GuiScrollText*> description_per_setting;
};

#endif//SERVER_CREATION_SCREEN_H
