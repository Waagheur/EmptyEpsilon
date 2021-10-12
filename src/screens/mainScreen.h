#include <memory>
#ifndef MAIN_SCREEN_H
#define MAIN_SCREEN_H

#include "engine.h"
#include "screenComponents/helpOverlay.h"
#include "gui/gui2_canvas.h"
#include "threatLevelEstimate.h"

class GuiViewportMainScreen;
class GuiRadarView;
class GuiCommsOverlay;
class GuiHelpOverlay;
class ImpulseSound;
//tdelc
class GuiPanel;
class GuiLabel;
class DamageControlScreen;
class RelayScreen;
class TargetAnalysisScreen;

class ScreenMainScreen : public GuiCanvas, public Updatable
{
    P<ThreatLevelEstimate> threat_estimate;
private:
    GuiViewportMainScreen* viewport;
    GuiHelpOverlay* keyboard_help;
    string keyboard_general = "";
    GuiRadarView* tactical_radar;
    GuiRadarView* long_range_radar;
    GuiRadarView* global_range_radar;
    GuiPanel* dock_comms;
    GuiLabel* label_dock;
    DamageControlScreen*ship_state;
    TargetAnalysisScreen* target_analysis;
    GuiCommsOverlay* onscreen_comms;
    std::unique_ptr<ImpulseSound> impulse_sound;
public:
    ScreenMainScreen();

    virtual void destroy() override;

    virtual void update(float delta) override;

    virtual bool onPointerDown(sp::io::Pointer::Button button, glm::vec2 position, int id) override;
    virtual void onHotkey(const HotkeyResult& key) override;
};

#endif//MAIN_SCREEN_H
