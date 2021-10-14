#ifndef POWER_DAMAGE_INDICATOR_H
#define POWER_DAMAGE_INDICATOR_H

#include "gui/gui2_element.h"
#include "shipTemplate.h"

class PlayerSpaceship;
class GuiPowerDamageIndicator : public GuiElement
{
public:
    GuiPowerDamageIndicator(GuiContainer* owner, string name, ESystem system, sp::Alignment icon_align, P<PlayerSpaceship> targetSpaceship);

    virtual void onDraw(sp::RenderTarget& window) override;
    void setTargetSpaceship(P<PlayerSpaceship> targetSpaceship){target_spaceship = targetSpaceship;}

private:
    ESystem system;
    float text_size;
    sp::Alignment icon_align;
    P<PlayerSpaceship> target_spaceship;

    glm::vec2 icon_position;
    glm::vec2 icon_offset;
    float icon_size;

    void drawIcon(sp::RenderTarget& window, string icon_name, glm::u8vec4 color);

};

#endif//POWER_DAMAGE_INDICATOR_H
