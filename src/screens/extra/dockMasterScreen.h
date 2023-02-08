#ifndef DOCK_MASTER_SCREEN_H
#define DOCK_MASTER_SCREEN_H

#include "gui/gui2_overlay.h"
#include "spaceObjects/shipTemplateBasedObject.h"

class GuiPanel;
class GuiSlider;
class GuiButton;
class GuiLabel;
class GuiElement;
class GuiEntryList;
class GuiSelector;
class GuiProgressbar;
class GuiKeyValueDisplay;
class GuiListbox;
class GuiRotatingModelView;
class GuiOverlay;
class GuiElement;
class Dock;
class DockMasterScreen : public GuiOverlay
{
  private:

    P<SpaceShip> selected_ship;

    GuiListbox* docks;
    GuiListbox* bays;
    unsigned int index_dock = 0;
    unsigned int index_bay = 0;
    GuiLabel *dockTitle;
    GuiLabel *droneTitle;

    GuiElement *mainPanel;
    GuiElement *topPanel;
    GuiElement *bottomPanel;
    GuiElement *dronePanel;

    GuiElement* layout_move;

    GuiElement* layout_actions;
    GuiListbox* actions;

    GuiElement* cargoInfo;
    GuiElement* shipCargoInfo;
    std::vector<GuiKeyValueDisplay*> cargoInfoItems;
    std::vector<GuiKeyValueDisplay*> shipCargoInfoItems;
    GuiRotatingModelView* model;

    GuiElement* dronePanel_col1;
    GuiElement* dronePanel_col2;
    GuiElement* dronePanel_col3;

    GuiButton* action_launch_button;
    GuiButton* action_move_button;
    GuiButton* action_empty_button;
    GuiElement* action_move_dest;

    GuiSelector* action_move_selector;
    GuiOverlay* overlay;
    GuiLabel *overlay_label;
    GuiProgressbar *distance_bar;
    GuiButton *cancel_move_button;

  public:
    DockMasterScreen(GuiContainer *owner);

    void onDraw(sp::RenderTarget &renderer) override;
  private:
    void selectDock(unsigned int index_dock);
    void selectBay(unsigned int index_bay);
  private:
    void displayShipDetails(P<SpaceShip> ship);
};
#endif //DOCK_MASTER_SCREEN_H

