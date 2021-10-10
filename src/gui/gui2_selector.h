#ifndef GUI2_SELECTOR_H
#define GUI2_SELECTOR_H

#include "gui2_entrylist.h"

class GuiArrowButton;

class GuiSelector : public GuiEntryList
{
protected:
    float text_size;
    string label;
    sp::Alignment text_alignment;
    GuiArrowButton* left;
    GuiArrowButton* right;
    GuiElement* popup;
    std::vector<GuiButton*> popup_buttons;
public:
    GuiSelector(GuiContainer* owner, string id, func_t func);

    virtual void onDraw(sp::RenderTarget& window) override;
    virtual bool onMouseDown(sp::io::Pointer::Button button, glm::vec2 position, int id) override;
    virtual void onMouseUp(glm::vec2 position, int id) override;

    GuiSelector* setTextSize(float size);
    GuiSelector* setLabel(string text);
};

#endif//GUI2_SELECTOR_H
