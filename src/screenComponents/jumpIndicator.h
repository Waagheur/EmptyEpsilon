#ifndef GUI_JUMP_INDICATOR_H
#define GUI_JUMP_INDICATOR_H

#include "gui/gui2_element.h"

class GuiPanel;
class GuiLabel;

class GuiJumpIndicator : public GuiElement
{
private:
    GuiPanel* box;
    GuiLabel* label;
public:
    GuiJumpIndicator(GuiContainer* owner);

    virtual void onDraw(sf::RenderTarget& window);
};

#endif//GUI_SELF_DESTRUCT_INDICATOR_H
