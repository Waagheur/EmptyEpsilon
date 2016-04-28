#ifndef SHIP_SELECTION_SCREEN_H
#define SHIP_SELECTION_SCREEN_H

#include "playerInfo.h"
#include "gui/gui2_canvas.h"

class GuiLabel;
class GuiListbox;
class GuiSelector;
class GuiButton;
class GuiToggleButton;

class ShipSelectionScreen : public GuiCanvas, public Updatable
{
private:
    GuiLabel* no_ships_label;
    GuiListbox* player_ship_list;
    GuiButton* ready_button;
    GuiSelector* crew_type_selector;
    
    GuiToggleButton* main_screen_button;
    GuiToggleButton* crew_position_button[max_crew_positions];
    GuiToggleButton* main_screen_controls_button;
    GuiToggleButton* game_master_button;
    GuiToggleButton* window_button;
    GuiSelector* window_angle;
    GuiToggleButton* topdown_button;
    
public:
    ShipSelectionScreen();

    virtual void update(float delta);
private:
    /**!
     * \brief check if this console can be mainscreen.
     * Being a main screen requires a bit more than the normal GUI, so we need to do some checks.
     */
    bool canDoMainScreen() { return PostProcessor::isEnabled() && sf::Shader::isAvailable(); }
    
    void updateButtonStatus(GuiToggleButton* toggled);
    void updateReadyButton();
    void updateCrewTypeOptions();
    
    void onReadyClick();
};

#endif//SHIP_SELECTION_SCREEN_H
