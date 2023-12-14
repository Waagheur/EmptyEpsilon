#include "dockMasterScreen.h"

#include "playerInfo.h"
#include "spaceObjects/shipTemplateBasedObject.h"
#include "spaceObjects/playerSpaceship.h"
#include "screenComponents/shipsLogControl.h"
#include "screenComponents/customShipFunctions.h"

#include "gui/gui2_listbox.h"
#include "gui/gui2_element.h"
#include "gui/gui2_panel.h"
#include "gui/gui2_label.h"
#include "gui/gui2_keyvaluedisplay.h"
#include "gui/gui2_slider.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_button.h"
#include "gui/gui2_selector.h"
#include "screenComponents/powerDamageIndicator.h"

#include "screenComponents/rotatingModelView.h"

const int ROW_SIZE = 4;
const int ROW_HEIGHT = 200;
const int BOX_WIDTH = 290;
const int COLUMN_WIDTH = 400;

DockMasterScreen::DockMasterScreen(GuiContainer *owner)
    : GuiOverlay(owner, "DOCK_MASTER_SCREEN", colorConfig.background)
{
    GuiOverlay *background_crosses = new GuiOverlay(this, "BACKGROUND_CROSSES", glm::u8vec4(255,255,255,255));
    background_crosses->setTextureTiled("gui/background/crosses.png");

    auto rootLayout = new GuiElement(this, "ROOT_LAYOUT");
    rootLayout->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax)->setPosition(0, 0, sp::Alignment::TopLeft)->setAttribute("layout", "horizaontal");;

    docks = new GuiListbox(rootLayout, "DOCKS_LIST", [this](unsigned int index_dock, string value) {
        selectDock(index_dock);
    });
    docks->setMargins(20, 20, 20, 20)->setSize(COLUMN_WIDTH / 2, GuiElement::GuiSizeMax);
    docks->setPosition(0, 0, sp::Alignment::TopLeft);

    // the index in the button list is assumed to equal the index of the dock
    for (int n = 0; n < 10; n++)
        docks->addEntry(tr("dock") +"-"+string(n+1), tr("Empty"));

    bays = new GuiListbox(rootLayout, "DOCKS_LIST", [this](unsigned int index_bay, string value) {
        if (index_bay < 3)
            selectBay(index_bay);
    });
    bays->setMargins(20, 20, 20, 20)->setSize(COLUMN_WIDTH / 2, GuiElement::GuiSizeMax);
    bays->setPosition(0, 0, sp::Alignment::TopRight);

    // the index in the button list is assumed to equal the index of the dock
    for (int n = 0; n < 3; n++)
        bays->addEntry(tr("dock") +"-"+string(n+1), tr("Empty"));

    mainPanel = new GuiElement(rootLayout, "TOP_PANEL");
    mainPanel->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax)->setAttribute("layout", "horizontal");;
    mainPanel->setPosition(0, 0, sp::Alignment::TopCenter);
    mainPanel->setMargins(20, 20, 20, 20);

    topPanel = new GuiElement(mainPanel, "TOP_PANEL");
    topPanel->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax / 2.f)->setAttribute("layout", "vertical");;
    topPanel->setPosition(0, 0, sp::Alignment::TopRight);
//    mainPanel->setMargins(20, 20, 20, 20);

    // Dock actions
    (new GuiLabel(topPanel, "TITLE", "Transfert des Vaisseaux", 30))
        ->addBackground()
        ->setAlignment(sp::Alignment::Center)
        ->setPosition(0, 0, sp::Alignment::BottomCenter)
        ->setSize(GuiElement::GuiSizeMax, 50);

    layout_move = new GuiElement(topPanel, "ACTION_MOVE");
    layout_move->setSize(GuiElement::GuiSizeMax, 50)->setPosition(0, 50, sp::Alignment::TopCenter)->setAttribute("layout", "vertical");;

    action_move_button = new GuiButton(layout_move, "MOVE_BUTTON", "Transferer", [this]() {
        if (my_spaceship)
            if (my_spaceship->getSystemEffectiveness(SYS_Docks) > 0)
            {
                if (selected_ship)
                {
                    for (int n = 0; n < 3; n++)
                        if (bays->getEntryName(n) == selected_ship->callsign)
                            bays->setEntryName(n,tr("dock")+"-"+string(n+1));
                    selected_ship->setDockId(index_bay + 1);
                    bays->setEntryName(index_bay,selected_ship->callsign);
                    my_spaceship->addToSpecificShipLog(tr("Ship transfer ") + selected_ship->callsign + tr(" To docking bay ") + string(index_bay+1),colorConfig.log_generic,"docks");
                    return;
                }
            }
    });
    action_move_button->setSize(COLUMN_WIDTH, 40);

    action_empty_button = new GuiButton(layout_move, "EMPTY_BUTTON", tr("Release"), [this]() {
        if (my_spaceship)
            if (my_spaceship->getSystemEffectiveness(SYS_Docks) > 0)
            {
                bays->setEntryName(index_bay,tr("dock")+"-"+string(index_bay+1));
                if (selected_ship)
                    selected_ship->setDockId("");
            }
    });
    action_empty_button->setSize(COLUMN_WIDTH, 40);
    (new GuiPowerDamageIndicator(action_move_button, "DOCKS_DPI", SYS_Docks, sp::Alignment::TopCenter, my_spaceship))->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

    droneTitle = new GuiLabel(topPanel, "DRONE_TITLE", tr("Airship x"), 30);
    droneTitle->addBackground()
        ->setAlignment(sp::Alignment::Center)
        ->setPosition(0, 0, sp::Alignment::TopCenter)
        ->setSize(GuiElement::GuiSizeMax, 50);

    model = new GuiRotatingModelView(topPanel, "MODEL_VIEW", nullptr);
    model->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax)->setMargins(0, -100, 0, 0);

    (new GuiCustomShipFunctions(this, dockMaster, "CUSTOM_FUNCTIONS", my_spaceship))->setPosition(20, 550, sp::Alignment::TopLeft)->setSize(360, GuiElement::GuiSizeMax);

    selectDock(0);
    model->moveToBack();
    background_crosses->moveToBack();

    new ShipsLog(this,"docks");
}

void DockMasterScreen::selectDock(unsigned int index_dock)
{
    this->index_dock = index_dock;
    docks->setSelectionIndex(index_dock);
    layout_move->setVisible(true);
}

void DockMasterScreen::selectBay(unsigned int index_bay)
{
    this->index_bay = index_bay;
    bays->setSelectionIndex(index_bay);
    layout_move->setVisible(true);
}

void DockMasterScreen::onDraw(sp::RenderTarget& renderer)
{
    GuiOverlay::onDraw(renderer);
    for (int n = 0; n < 10; n++)
        docks->setEntryName(n, tr("Empty"));
    if (my_spaceship)
    {
        int n = 0;
        PVector<SpaceShip> list_ships;
        PVector<SpaceObject> list_objs = my_spaceship->getObjectsInRange(5000);
        foreach(SpaceObject, obj, list_objs)
        {
            P<SpaceShip> ship = obj;
            if (!ship)
                continue;
            if (ship == my_spaceship)
                continue;
            if (ship->docking_state != DS_Docked)
                continue;
            if (n > 10)
                return;

            // OK
            list_ships.push_back(ship);
            docks->setEntryName(n,ship->callsign);
            n +=1;
        }

        if (index_dock < list_ships.size())
            selected_ship = list_ships[index_dock];

        mainPanel->setVisible(false);
        foreach(SpaceShip,obj,list_ships){
            P<SpaceShip> ship = obj;
            if (ship->callsign == docks->getEntryName(index_dock)){
                displayShipDetails(ship);
                mainPanel->setVisible(true);
                return;
            }
        }
    }
}

void DockMasterScreen::displayShipDetails(P<SpaceShip> ship)
{
    P<ShipTemplate> st = ship->ship_template;
    model->setModel(st->model_data);
    if (ship->id_dock == "")
        droneTitle->setText(tr("No docking bay"));
    else
        droneTitle->setText(tr("Docking bay ") + ship->id_dock );
}

