#ifndef NO_RADAR_POPUP_H
#define NO_RADAR_POPUP_H

#include "gui/gui2_element.h"

class GuiPanel;
class GuiContainer;
class GuiOverlay;

class GuiNoRadarPopup : public GuiElement
{
private:
    GuiOverlay* no_radar_overlay;
    GuiContainer* owner;

public:
    GuiNoRadarPopup(GuiContainer* owner);

    virtual void onDraw(sp::RenderTarget& renderer) override;
};

#endif//NO_RADAR_POPUP_H
