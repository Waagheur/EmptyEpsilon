#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "spaceObjects/spaceship.h"
#include "hackDialog.h"
#include "random.h"
#include "gui/gui2_panel.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_button.h"
#include "gui/gui2_label.h"
#include "gui/gui2_scrolltext.h"
#include "gui/gui2_listbox.h"
#include "gui/gui2_textentry.h"
#include "gui/gui2_element.h"
#include "gui/gui2_togglebutton.h"

#include "onScreenKeyboard.h"

GuiHackDialog::GuiHackDialog(GuiContainer* owner, string id)
: GuiOverlay(owner, id, glm::u8vec4(64,0,0,64))
{

    setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    hide();

    // Panel de titre
    hack_title = new GuiPanel(this, "HACK_TITLE_BOX");
    hack_title->setSize(600, 50)->setPosition(0, -720, sp::Alignment::BottomCenter);

    hack_label = new GuiLabel(hack_title, "", "", 30);
    hack_label->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    hack_label->setText(tr("hacking","Command prompt"));

    // Button to close chat comms.
    hack_close_button = new GuiButton(hack_title, "CLOSE_BUTTON", tr("button", "Close"), [this]() {
        hack_step = 0;
        if (my_spaceship)
            my_spaceship -> hack_protect = false;
        hide();
    });
    hack_close_button->setTextSize(20)->setPosition(-10, 10, sp::Alignment::TopRight)->setSize(60, 30);

    hack_minimize_button = new GuiToggleButton(hack_title, "", "_", [this](bool value)
    {
        minimize(value);
    });
    hack_minimize_button->setPosition(-70, 10, sp::Alignment::TopRight)->setSize(60, 30);

    minimized = false;

    // Panel for chat communications with GMs and other player ships.
    hack_box = new GuiPanel(this, "HACK_CHAT_BOX");
    hack_box->setSize(800, 600)->setPosition(0, -120, sp::Alignment::BottomCenter);

    // Message entry field for chat.
    hack_message_entry = new GuiTextEntry(hack_box, "HACK_CHAT_MESSAGE_ENTRY", "");
    hack_message_entry ->setPosition(20, -20, sp::Alignment::BottomLeft)->setSize(640, 50);
    hack_message_entry ->enterCallback([this](string text){
        hack_delay = random(1,5);
        if (my_spaceship)
            my_spaceship->hack_time = 0.001;
    });

    // Progress bar
    progress = new GuiProgressbar(hack_box, "HACK_PROGRESS", 0, hack_delay, 0.0);
    progress->setPosition(20, 30, sp::Alignment::TopLeft)->setSize(GuiElement::GuiSizeMax, 30);
    progress->setColor(colorConfig.log_receive_enemy)->setDrawBackground(false)->setText(tr("hacking","Access in progress"));

    // Text of incoming chat messages.
    hack_comms_text = new GuiScrollText(hack_box, "HACK_CHAT_TEXT", "");
    hack_comms_text->enableAutoScrollDown()->setPosition(20, 50, sp::Alignment::TopLeft)->setSize(760, 500);

    // Button to send a message.
    hack_send_button = new GuiButton(hack_box, "SEND_BUTTON", tr("button","Send"), [this]() {
        hack_delay = random(1,5);
        if (my_spaceship)
            my_spaceship->hack_time = 0.001;
    });
    hack_send_button->setPosition(-20, -20, sp::Alignment::BottomRight)->setSize(120, 50);

    if (!engine->getObject("mouseRenderer")) //If we are a touch screen, add a on screen keyboard.
    {
        OnScreenKeyboardControl* keyboard = new OnScreenKeyboardControl(hack_box, hack_message_entry);
        keyboard->setPosition(20, -20, sp::Alignment::BottomLeft)->setSize(760, 200);
        hack_message_entry ->setPosition(20, -220, sp::Alignment::BottomLeft);
        hack_send_button->setPosition(-20, -220, sp::Alignment::BottomRight);
        hack_comms_text->setSize(hack_comms_text->getSize().x, hack_comms_text->getSize().y - 200);
    }

}

void GuiHackDialog::minimize(bool minimize)
{
    hack_minimize_button->setValue(minimize);
    if (minimize != minimized)
    {
        if (minimize)
        {
            hack_box->hide();
            original_height = getSize().y;
            setSize(getSize().x, original_height);
        }else{
            hack_box->show();
            setSize(getSize().x, original_height);
        }
    }
    minimized = minimize;
}

void GuiHackDialog::open()
{
    //this->target = target;
    hack_step = 0;
    hack_message = "\n>";
    hack_message += tr("hacking","Launching command prompt");
    hack_message += "\n>";
    hack_message += tr("hacking","Choose type of action");
    hack_message += "\n>";
    hack_message += tr("hacking","Intrusion or protection");
    show();
}

void GuiHackDialog::onDraw(sp::RenderTarget& renderer)
{
//    if (!target)
//    {
//        hide();
//        return;
//    }
    GuiOverlay::onDraw(renderer);

    if (my_spaceship)
    {
        hack_time = my_spaceship->hack_time;

        if (my_spaceship->hack_time > hack_delay)
        {
            my_spaceship->hack_time = 0.0;
            commandHack();
        }
    }

    if (hack_target && hack_target -> hack_protect)
    {
        hack_message  = "\n>";
        hack_message += tr("hacking", "Intrusion detected by ") + hack_target -> getCallSign();
        hack_message += "\n>";
        hack_message += tr("hacking","Kicked from system");
        hack_step = 0;
    }

    if (hack_time > 0.f)
    {
        progress->setValue(hack_time);
        hack_message_entry->disable();
        hack_message_entry->hide();
        progress->show();
    }
    else
    {
        progress->setValue(0.0);
        hack_message_entry->enable();
        hack_message_entry->show();
        progress->hide();
    }

    // If we're on a ship, show comms activity on draw.
    if (my_spaceship)
    {
        hack_comms_text->setText(hack_message);
    }

    // Si fini
    if (hack_step == 9 && my_spaceship && hack_target)
    {
        hack_message  += "\n>";
        hack_message +=tr("hacking","Hack succeeded in : ") + hack_target -> getCallSign();
        hack_step = 99;

        if (target_system == tr("hacking","reactor"))
            my_spaceship->commandHackingFinished(hack_target, tr("system","Reactor"),"");
        else if (target_system == tr("hacking","beam"))
            my_spaceship->commandHackingFinished(hack_target, tr("system","Beam Weapons"),"");
        else if (target_system == tr("hacking","missile"))
            my_spaceship->commandHackingFinished(hack_target, tr("system","Missile System"),"");
        else if (target_system == tr("hacking","maneuver"))
            my_spaceship->commandHackingFinished(hack_target, tr("system","Maneuvering"),"");
        else if (target_system == tr("hacking","impulse"))
            my_spaceship->commandHackingFinished(hack_target, tr("system","Impulse Engines"),"");
        else if (target_system == tr("hacking","warp"))
            my_spaceship->commandHackingFinished(hack_target, tr("system","Warp Drive"),"");
        else if (target_system == tr("hacking","jump"))
            my_spaceship->commandHackingFinished(hack_target, tr("system","Jump Drive"),"");
        else if (target_system == tr("hacking","fwdshield"))
            my_spaceship->commandHackingFinished(hack_target, tr("system","Front Shield Generator"),"");
        else if (target_system == tr("hacking","rearshield"))
            my_spaceship->commandHackingFinished(hack_target, tr("system","Rear Shield Generator"),"");
        else
            hack_message  += "\n>" + tr("hacking","Unknown target system");
    }
    // Si fini (federation)
    if (hack_step == 91 && my_spaceship && hack_target)
    {
        hack_step = 99;

        my_spaceship->commandHackingFinished(hack_target, "",target_system);

        P<PlayerSpaceship> player_target = hack_target;
        if (player_target)
        {
            player_target -> addToShipLog(tr("hacking","Faction signature hacking attempt"),colorConfig.log_receive_enemy);
            player_target -> addToSpecificShipLog(tr("hacking","Faction signature hacking attempt"),colorConfig.log_receive_enemy,"intern");
        }

        hack_message  += "\n>" + tr("hacking","Hack succeeded in : ") + hack_target -> getCallSign();
        hack_message  += "\n>" + tr("hacking","Transform signature to :") + target_system;
    }
}

void GuiHackDialog::clearElements()
{
    // Force all panels to hide, in case hiding the overlay doesn't hide its
    // contents on draw.
    hack_box->hide();
}

void GuiHackDialog::commandHack()
{
    if (!my_spaceship)
        return;

    string hack_text = hack_message_entry -> getText();
    string hack_test = "";
    hack_text = hack_text.lower();
    hack_message_entry ->setText("");
//    if (target)
//    {
        // Connect to ship
        if (hack_step == 0)
        {
            if (hack_text == "intrusion")
            {
                hack_message  = "\n>" + tr("hacking","Intrusion module turned on");
                hack_message  = "\n>" + tr("hacking","Possible intrusion in a 50U radius");
                hack_message  += "\n>" + tr("hacking","Enter target callsign : ");
                hack_step = 1;
            }
            else if (hack_text == "protection")
            {
                hack_message  = "\n>" + tr("hacking","Protection module turned on");
                hack_message  += "\n>" + tr("hacking","Confirm launch of protection module : yes");
                hack_step = 10;
            }
            else
            {
                hack_message = "\n>" + tr("hacking","Command prompt startup");
                hack_message += "\n>" + tr("hacking","Choose next action : ");
                hack_message += "\n>" + tr("hacking","Intrusion or protection");
                hack_step = 0;
            }
        }
        // Connect to ship
        else if (hack_step == 1)
        {
            foreach(SpaceObject, obj, space_object_list)
            {
                P<SpaceShip> ship = obj;

                if (!ship)
                    continue;

                if (glm::length(obj->getPosition() - my_spaceship->getPosition()) > 50000.f)
                    continue;

                hack_test = obj -> getCallSign();
                hack_test = hack_test.lower();

                //if (hack_text.startswith(hack_test))
                if (hack_text == hack_test)
                {
                    hack_message  = "\n>" + tr("hacking","Connection to ") + obj -> getCallSign() + tr("hacking"," succeeded");

                    hack_target = obj;

                    hack_message += "\n>" + tr("hacking","Access code to computer system :");
                    hack_message += "\n>" + tr("hacking","(Code consists of ") + string(hack_target -> getHackDiff()) + tr("hacking"," bits)");

                    defineHackCode(hack_target -> getHackDiff());

                    P<PlayerSpaceship> player_target = obj;
                    if (player_target)
                        player_target -> addToSpecificShipLog(tr("hacking","Computer intrusion in progress"),colorConfig.log_receive_enemy,"intern");
                    hack_step = 2;
                    break;
                }
            }
            if (hack_step != 2)
            {
                hack_message  += "\n>" + tr("hacking","No target reached");
                hack_message  += "\n>" + tr("hacking"," Hack failed");
                hack_step = 99;
            }
        }
        // Give ship hack code
        else if (hack_step == 2)
        {
            if (hack_text == hack_code)
            {
                hack_message  = "\n>" + tr("hacking","Complete access to interface");
                hack_message  += "\n>" + tr("hacking","Choose system to hack");
                hack_message  += "\n>" +  tr("hacking","reactor") + "|" +tr("hacking","beam") + "|" +tr("hacking","missile")+"|" 
                + tr("hacking","maneuver") +"|" + tr("hacking","impulse") +"|" +tr("hacking","warp") +"|" 
                + tr("hacking","jump") +"|" + tr("hacking","fwdshield") +"|" + tr("hacking","rearshield");
                hack_step = 5;
            }
            else if (hack_text.length() != hack_target -> getHackDiff())
            {
                hack_message  += "\n>" + tr("hacking","Incorrect number of bits");
            }
            else
            {
                hack_message  += "\n>" + tr("hacking","Code ") + hack_text + tr("hacking"," incorrect");
                hack_message  += "\n> " + string(verifHackCode(hack_target -> getHackDiff(), hack_text, hack_code)) + tr("hacking","correct bits");
            }
        }
        else if (hack_step == 5)
        {
            if (hack_text == "spay")
            {
                hack_message  = "\n> Acces au service S-PAY";
                hack_message += "\n> Indiquez le Code d'acces du S-PAY :";
                hack_message += "\n> (Le code est en 6 bits)";
                defineHackCode(6);
                hack_step = 6;
            }else if (hack_text == "signature")
            {
                hack_message  = "\n> Acces au service de perturbation de signature";
                hack_message += "\n> Indiquez le Code d'acces pour modifier la signature :";
                hack_message += "\n> (Le code est en 6 bits)";
                defineHackCode(6);
                hack_step = 7;
            }else
            {
                target_system = hack_text;
                hack_step = 9;
            }
        }
        else if (hack_step == 6)
        {
            if (hack_text == hack_code)
            {
                hack_message  = "\n> Acces complet au S-PAY";
                hack_message  += "\n> Retrait de 200 Q obtenu";
                hack_message  += "\n> Somme verse sur votre compte S-PAY";
                my_spaceship -> addToShipLog("Obtention de 200Q par hack du S-PAY",colorConfig.log_receive_enemy);
                P<PlayerSpaceship> player_target = hack_target;
                if (player_target)
                    player_target -> addToSpecificShipLog("Perte de 200Q par hack du S-PAY",colorConfig.log_receive_enemy,"intern");
                hack_step = 99;
            }
            else if (hack_text.length() != 6)
            {
                hack_message  += "\n> Nombre de bits incorrect";
            }
            else
            {
                hack_message  += "\n> Code " + hack_text + " incorrect";
                hack_message  += "\n> " + string(verifHackCode(6, hack_text, hack_code)) + "bits corrects";
            }
        }
        else if (hack_step == 7)
        {
            if (hack_text == hack_code)
            {
                hack_message  = "\n> Acces complet au piratage signature";
                hack_message  += "\n> quelle est la signature a attribuer";
                hack_message  += "\n> luxa | arroya | trente nebuleuses | gcg | gusm | systemes souverains | ganima";
                hack_step = 8;
            }
            else if (hack_text.length() != 6)
            {
                hack_message  += "\n> Nombre de bits incorrect";
            }
            else
            {
                hack_message  += "\n> Code " + hack_text + " incorrect";
                hack_message  += "\n> " + string(verifHackCode(6, hack_text, hack_code)) + " bits corrects";
            }
        }
        else if (hack_step == 8)
        {
            target_system = hack_text;
            hack_step = 91;
        }
        // Protection
        else if (hack_step == 10)
        {
            if (hack_text == tr("hacking","yes"))
            {
                hack_message  = "\n>" + tr("hacking","Protection is active, potential intruders are kicked out.");
                my_spaceship -> hack_protect = true;
            }
            else
            {
                hack_message  += "\n>" + tr("hacking","Protection system cancelled");
                hack_step = 99;
                my_spaceship -> hack_protect = false;
            }
        }
        else if (hack_step == 99)
        {
            hack_message = "\n>";
            hack_message += tr("hacking","Launching command prompt");
            hack_message += "\n>";
            hack_message += tr("hacking","Choose type of action");
            hack_message += "\n>";
            hack_message += tr("hacking","Intrusion or protection");
            hack_step = 0;
        }
//    }
}

void GuiHackDialog::defineHackCode(int hackDiff)
{
    hack_code = "";
    for(int n=0; n<hackDiff; n++)
        hack_code += string(irandom(0, 1));
}

int GuiHackDialog::verifHackCode(int hackDiff, string hack_text, string hack_code)
{
    int n_correct = 0;
    for(int n=0; n<hackDiff; n++)
    {
        if (hack_text[n] == hack_code[n])
            n_correct += 1;
    }
    return n_correct;
}

