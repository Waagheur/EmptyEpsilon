#include <i18n.h>
#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "impulseControls.h"
#include "soundManager.h"
#include "powerDamageIndicator.h"
#include "gui/gui2_keyvaluedisplay.h"
#include "gui/gui2_slider.h"

GuiImpulseControls::GuiImpulseControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship)
: GuiElement(owner, id), target_spaceship(targetSpaceship)
{
    slider = new GuiSlider(this, id + "_SLIDER", 1.0, -1.0, 0.0, [this](float value) {
        if (target_spaceship)
            target_spaceship->commandImpulse(value);
    });
    slider->addSnapValue(0.0, 0.1)->setPosition(0, 0, sp::Alignment::TopLeft)->setSize(50, GuiElement::GuiSizeMax);

    label = new GuiKeyValueDisplay(this, id, 0.5, tr("slider", "Impulse"), "0%");
    label->setTextSize(30)->setPosition(50, 0, sp::Alignment::TopLeft)->setSize(40, GuiElement::GuiSizeMax);

    pdi = new GuiPowerDamageIndicator(this, id + "_DPI", SYS_Impulse, sp::Alignment::TopCenter, target_spaceship);
    pdi->setSize(50, GuiElement::GuiSizeMax);
}

void GuiImpulseControls::setTargetSpaceship(P<PlayerSpaceship> targetSpaceship){
    target_spaceship = targetSpaceship;
    pdi->setTargetSpaceship(target_spaceship);
}

void GuiImpulseControls::onDraw(sp::RenderTarget& target)
{
    if (target_spaceship)
    {
        label->setValue(string(int(target_spaceship->current_impulse * 100)) + "%");
        slider->setValue(target_spaceship->impulse_request);
        soundManager->setMusicVolume(abs(int(target_spaceship->current_impulse * 100)/2+10));

        setVisible(target_spaceship->hasSystem(SYS_Impulse));
    }
}

void GuiImpulseControls::onUpdate()
{
    if (target_spaceship && isVisible())
    {
        float change = keys.helms_increase_impulse.getValue() - keys.helms_decrease_impulse.getValue();
        if (change != 0.0f)
            target_spaceship->commandImpulse(std::min(1.0f, slider->getValue() + change * 0.1f));
        if (keys.helms_zero_impulse.getDown())
            target_spaceship->commandImpulse(0.0f);
        if (keys.helms_max_impulse.getDown())
            target_spaceship->commandImpulse(1.0f);
        if (keys.helms_min_impulse.getDown())
            target_spaceship->commandImpulse(-1.0f);
        
        float set_value = keys.helms_set_impulse.getValue();
        if (set_value != target_spaceship->impulse_request && (set_value != 0.0f || set_active))
        {
            target_spaceship->commandImpulse(set_value);
            set_active = set_value != 0.0f; //Make sure the next update is send, even if it is back to zero.
        }
    }
}
