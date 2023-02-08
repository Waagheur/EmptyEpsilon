#ifndef VIEWPORT_MAIN_SCREEN_H
#define VIEWPORT_MAIN_SCREEN_H

#include "viewport3d.h"
#include "spaceObjects/scanProbe.h" //Tdelc
#include "engine.h"

class GuiViewportMainScreen : public GuiViewport3D//, public Updatable
{
public:
    GuiViewportMainScreen(GuiContainer* owner, string id);

    ~GuiViewportMainScreen() {}
    virtual void onDraw(sp::RenderTarget& target) override;
    virtual void update(float delta);

    bool first_person = false;

    //Tdelc
    float angle;
    float rotatetime;
    P<ScanProbe> probe;

    constexpr static uint8_t flag_callsigns = 0x04;
    constexpr static uint8_t flag_headings  = 0x02;
    constexpr static uint8_t flag_spacedust = 0x01;
};

#endif//VIEWPORT_MAIN_SCREEN_H
