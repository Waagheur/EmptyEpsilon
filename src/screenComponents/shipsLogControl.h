#ifndef SHIPS_LOG_CONTROL_H
#define SHIPS_LOG_CONTROL_H

#include "gui/gui2_element.h"

class GuiPanel;
class GuiAdvancedScrollText;

class ShipsLog : public GuiElement
{
public:
    string station;
    ShipsLog(GuiContainer* owner, const string& station = "generic");

    virtual void onDraw(sp::RenderTarget& window) override;
    virtual void onHotkey(const HotkeyResult& key) override;
    virtual bool onMouseDown(sp::io::Pointer::Button button, glm::vec2 position, int id) override;
private:
    bool open;
    GuiAdvancedScrollText* log_text;
};

#endif//SHIPS_LOG_CONTROL_H
