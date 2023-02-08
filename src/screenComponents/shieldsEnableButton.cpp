#include <i18n.h>
#include "shieldsEnableButton.h"
#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "powerDamageIndicator.h"
#include "gameGlobalInfo.h"

#include "gui/gui2_togglebutton.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_label.h"
#include <string>

GuiShieldsEnableButton::GuiShieldsEnableButton(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship)
: GuiElement(owner, id), target_spaceship(targetSpaceship)
{
    button = new GuiToggleButton(this, id + "_BUTTON", "Bouclier: ON", [this](bool value) {
        if (target_spaceship)
            target_spaceship->commandSetShields(!target_spaceship->shields_active);
    });
    button->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    bar = new GuiProgressbar(this, id + "_BAR", 0.0, PlayerSpaceship::shield_calibration_time, 0);
    bar->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    (new GuiLabel(bar, id + "_CALIBRATING_LABEL", tr("shields","Calibrating"), 30))->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

    pdi = new GuiPowerDamageIndicator(this, id + "_PDI", SYS_FrontShield, sp::Alignment::CenterLeft, target_spaceship);
    pdi->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
}

void GuiShieldsEnableButton::setTargetSpaceship(P<PlayerSpaceship> targetSpaceship){
    target_spaceship = targetSpaceship;
    pdi->setTargetSpaceship(target_spaceship);
}

void GuiShieldsEnableButton::onDraw(sp::RenderTarget& target)
{
    if (target_spaceship)
    {
        if (target_spaceship->getShieldCount() == 0)
        {
            hide();
        }
        else if (target_spaceship->shield_calibration_delay > 0.0f)
        {
            show();
            button->hide();
            bar->show();
            bar->setValue(target_spaceship->shield_calibration_delay);
        }
        else
        {
            show();
            button->show();
            button->setValue(target_spaceship->shields_active);
            bar->hide();
            string shield_status=target_spaceship->shields_active ? tr("shields","ON") : tr("shields","OFF");
            if (gameGlobalInfo->use_beam_shield_frequencies)
                button->setText(tr("{frequency} Shields: {status}").format({{"frequency", frequencyToString(target_spaceship->shield_frequency)}, {"status", shield_status}}));
            else
                button->setText(tr("Shields: {status}").format({{"status", shield_status}}));
        }
    }
}

void GuiShieldsEnableButton::onUpdate()
{
    if (target_spaceship && isVisible())
    {
        if (keys.weapons_toggle_shields.getDown())
            target_spaceship->commandSetShields(!target_spaceship->shields_active);
        if (keys.weapons_enable_shields.getDown())
            target_spaceship->commandSetShields(true);
        if (keys.weapons_disable_shields.getDown())
            target_spaceship->commandSetShields(false);
    }
}
