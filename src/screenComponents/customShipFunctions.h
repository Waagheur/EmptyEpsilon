#ifndef CUSTOM_SHIP_FUNCTIONS_H
#define CUSTOM_SHIP_FUNCTIONS_H

#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "gui/gui2_element.h"

class GuiCustomShipFunctions : public GuiElement
{
public:
    GuiCustomShipFunctions(GuiContainer* owner, ECrewPosition position, string id, P<PlayerSpaceship> targetSpaceship);

    virtual void onDraw(sp::RenderTarget& target) override;

    bool hasEntries();

    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship);
private:
    class Entry
    {
    public:
        string name;
        GuiElement* element;
    };

    ECrewPosition position;
    std::vector<Entry> entries;
    P<PlayerSpaceship> target_spaceship;
    void checkEntries();
    void createEntries();
};

#endif//CUSTOM_SHIP_FUNCTIONS_H
