#include <i18n.h>
#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "jumpControls.h"
#include "powerDamageIndicator.h"

#include "gui/gui2_slider.h"
#include "gui/gui2_keyvaluedisplay.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_button.h"

GuiJumpControls::GuiJumpControls(GuiContainer* owner, string id, P<PlayerSpaceship> targetSpaceship)
: GuiElement(owner, id), target_spaceship(targetSpaceship)
{
    slider = new GuiSlider(this, id + "_SLIDER", 5000.0, 50000.0, 10000.0, nullptr);
    slider->setPosition(0, -50, sp::Alignment::BottomLeft)->setSize(50, GuiElement::GuiSizeMax);

    charge_bar = new GuiProgressbar(this, id + "_CHARGE", 0.0, 50000.0, 0.0);
    charge_bar->setPosition(0, -50, sp::Alignment::BottomLeft)->setSize(50, GuiElement::GuiSizeMax);
    charge_bar->hide();

    label = new GuiKeyValueDisplay(this, id + "_LABEL", 0.5, tr("jumpcontrol", "Distance"), "10.0");
    label->setTextSize(30)->setPosition(50, -50, sp::Alignment::BottomLeft)->setSize(40, GuiElement::GuiSizeMax);

    button = new GuiButton(this, id + "_BUTTON", tr("jumpcontrol", "Jump"), [this]() {
        target_spaceship->commandJump(slider->getValue());
    });
    button->setPosition(0, 0, sp::Alignment::BottomLeft)->setSize(GuiElement::GuiSizeMax, 50);

    pdi = new GuiPowerDamageIndicator(this, id + "_DPI", SYS_JumpDrive, sp::Alignment::TopCenter, target_spaceship);
    pdi->setPosition(0, -50, sp::Alignment::BottomLeft)->setSize(50, GuiElement::GuiSizeMax);
}

void GuiJumpControls::setTargetSpaceship(P<PlayerSpaceship> targetSpaceship){
    target_spaceship = targetSpaceship;
    pdi->setTargetSpaceship(target_spaceship);
}

void GuiJumpControls::onDraw(sp::RenderTarget& target)
{
    if (target_spaceship)
    {
        if (target_spaceship->jump_delay > 0.0f)
        {
            label->setKey(tr("jumpcontrol","Jump in"));
            label->setValue(string(int(ceilf(target_spaceship->jump_delay / target_spaceship->getJumpDriveRechargeRate()))) + " S");
            slider->disable();
            button->disable();
            charge_bar->hide();
        }else if (target_spaceship->jump_drive_charge < target_spaceship->jump_drive_max_distance)
        {
            float time = target_spaceship->jump_drive_charge_time / target_spaceship->getJumpDriveRechargeRate() * (target_spaceship->jump_drive_max_distance - target_spaceship->jump_drive_charge) / target_spaceship->jump_drive_max_distance;
            if (time < 0)
            {
                label->setKey(tr("jumpcontrol","charging"));
                label->setValue(tr("jumpcontrol","impossible"));
            }else{
                label->setKey(tr("jumpcontrol","Charge :"));
                label->setValue(string(int(ceilf(time))) + " S");
            }
            slider->hide();
            button->disable();
            charge_bar->setRange(0.0, target_spaceship->jump_drive_max_distance);
            charge_bar->setValue(target_spaceship->jump_drive_charge)->show();
        }else{
            label->setKey(tr("jumpcontrol", "Distance"));
            label->setValue(string(slider->getValue() / 1000.0f, 0) + " " + DISTANCE_UNIT_1K);
            slider->enable()->show();
            //float factor_jump = std::max(1.0f,target_spaceship->getSystemEffectiveness(SYS_JumpDrive));
            slider->setRange(target_spaceship->jump_drive_max_distance, target_spaceship->jump_drive_min_distance);
            button->enable();
            charge_bar->hide();
        }
    }
}

void GuiJumpControls::onUpdate()
{
    if (target_spaceship && isVisible())
    {
        auto adjust = keys.helms_increase_jump_distance.getValue() - keys.helms_decrease_jump_distance.getValue();
        slider->setValue(slider->getValue() + 1000.0f * adjust);
        if (keys.helms_execute_jump.getDown())
            target_spaceship->commandJump(slider->getValue());
    }
}
