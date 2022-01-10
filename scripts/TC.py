from discord import channel, Client
from discord.ext import commands
import vgamepad as vg
import os
import json
from dotenv import load_dotenv
import threading


load_dotenv('.env')

bot = commands.Bot(command_prefix='/', description="Text Commands to Game Input", case_insensitive=True)

# Check if the bot is joined
joined = 0

# Terminate the bot by stopping the code (ctrl-c) or just pressing the button if using the GUI

@bot.event
async def on_ready():
    global Vgamepad
    Vgamepad = vg.VX360Gamepad()
    global channel
    global toggleA
    toggleA = 0
    global toggleB
    toggleB = 0
    global toggleLT
    toggleLT = 0
    global toggleRT
    toggleRT = 0
    # Log in to corresponding Discord text channel
    channel = bot.get_channel(int(id))
    await channel.send("Logged in")

# Run an input cmd on discord message
@bot.event
async def on_message(message):
    Message = message.content.strip()
    Message = Message.upper()
    if not channel:
        return

        #####################################
        # Still adding more cmds
        # Current command List
        # WHITESPACE AND CAPITILIZATION INSENSITIVE
        # UP
        # LU
        # DOWN
        # LD
        # LEFT
        # LL
        # RIGHT
        # LR
        # LUMP (left + A)
        # RUMP (right + A)
        # START
        # STOP
        # A
        # HOLDA
        # B
        # HOLDB
        # X
        # LTHUMB
        # Y
        # BACK
        # LT
        # HOLDLT
        # RT
        # HOLDRT
        # LT
        # LB
        # RB

    ###################################
    # Universal 2D game profile (you may need to change the button pressed based on your game controller configurations though)
    # However, commands will still need to be figured out on a game-by-game basis
    if Message == 'UP' and commandList[1] is True:
        Vgamepad.left_joystick(0, 30000)
        Vgamepad.update()
        return
    elif Message == 'LU' and commandList[2] is True:
        Vgamepad.left_joystick(0, 30000)
        Vgamepad.update()
        timer = threading.Timer(commandLength[0], LU)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'DOWN' and commandList[3] is True:
        Vgamepad.left_joystick(0, -30000)
        Vgamepad.update()
        return
    elif Message == 'LD' and commandList[4] is True:
        Vgamepad.left_joystick(0, -30000)
        Vgamepad.update()
        timer = threading.Timer(commandLength[1], LD)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'LEFT' and commandList[5] is True:
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.update()
        return
    elif Message == 'LL' and commandList[6] is True:
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.update()
        timer = threading.Timer(commandLength[2], LL)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'RIGHT' and commandList[7] is True:
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.update()
        return
    elif Message == 'LR' and commandList[8] is True:
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.update()
        timer = threading.Timer(commandLength[3], LR)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'LUMP' and commandList[9] is True:
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        timer = threading.Timer(commandLength[4], LUMP)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'RUMP' and commandList[10] is True:
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        timer = threading.Timer(commandLength[5], RUMP)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'START' and commandList[11] is True:
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_START)
        Vgamepad.update()
        timer = threading.Timer(commandLength[6], START)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'STOP' and commandList[12] is True:
        Vgamepad.reset()
        Vgamepad.update()
        return
    elif Message == 'A' and commandList[13] is True:
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        timer = threading.Timer(commandLength[7], A)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'HOLDA' and commandList[14] is True:
        # Making a toggle button w/ vgamepad
        global toggleA
        if toggleA == 0:
            Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
            Vgamepad.update()
            toggleA = 1
        else:
            timer = threading.Timer(commandLength[8], HOLDA)
            timer.daemon = True
            timer.start()
        return
    elif Message == 'B' and commandList[15] is True:
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_B)
        Vgamepad.update()
        timer = threading.Timer(commandLength[9], B)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'HOLDB' and commandList[16] is True:
        # Making a toggle button w/ vgamepad
        global toggleB
        if toggleB == 0:
            Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_B)
            Vgamepad.update()
            toggleB = 1
        else:
            timer = threading.Timer(commandLength[10], HOLDB)
            timer.daemon = True
            timer.start()
        return
    elif Message == 'X' and commandList[17] is True:
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.update()
        timer = threading.Timer(commandLength[11], X)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'LTHUMB' and commandList[18] is True:
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_LEFT_THUMB)
        Vgamepad.update()
        timer = threading.Timer(commandLength[12], LTHUMB)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'Y' and commandList[19] is True:
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_Y)
        Vgamepad.update()
        timer = threading.Timer(commandLength[13], Y)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'BACK' and commandList[20] is True:
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_BACK)
        Vgamepad.update()
        timer = threading.Timer(commandLength[14], BACK)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'LT' and commandList[21] is True:
        Vgamepad.left_trigger(255)
        Vgamepad.update()
        timer = threading.Timer(commandLength[15], LT)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'HOLDLT' and commandList[22] is True:
        # Making a toggle button w/ vgamepad
        global toggleLT
        if toggleLT == 0:
            Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_LT)
            Vgamepad.update()
            toggleLT = 1
        else:
            timer = threading.Timer(commandLength[16], HOLDLT)
            timer.daemon = True
            timer.start()
        return
    elif Message == 'RT' and commandList[23] is True:
        Vgamepad.right_trigger(255)
        Vgamepad.update()
        timer = threading.Timer(commandLength[17], RT)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'HOLDRT' and commandList[24] is True:
        global toggleRT
        if toggleRT == 0:
            Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_RT)
            Vgamepad.update()
            toggleRT = 1
        else:
            timer = threading.Timer(commandLength[18], HOLDRT)
            timer.daemon = True
            timer.start()
        return
    elif Message == 'LB' and commandList[25] is True:
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_LEFT_SHOULDER)
        Vgamepad.update()
        timer = threading.Timer(commandLength[19], LB)
        timer.daemon = True
        timer.start()
        return
    elif Message == 'RB' and commandList[26] is True:
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_SHOULDER)
        Vgamepad.update()
        timer = threading.Timer(commandLength[20], RB)
        timer.daemon = True
        timer.start()
        return
    # If you want a screenshot cmd I left it in strings
    """
    elif Message == 'SCREENSHOT':
        # If '/' is your screenshot hotkey.
        keyboard.press('/')
        time.sleep(0.2)
        keyboard.release('/')
    """
    #############################################
    # I also decided to make specific cmds for certain games
    # The code is not as updated as the universal code, it is in a prior version right now 
    # IN-PROGRESS Smash Bros Brawl Cmds

    # COMMANDS
    # WHITESPACE AND CAPITILIZATION INSENSITIVE
    # right jab (also item)
    # left jab (also item)
    # up air
    # down air
    # right special
    # left special
    # up special
    # down special
    # up
    # down
    # right
    # left
    # LR:light right
    # LL:light left
    # rump
    # lump
    # shield
    # start
    # screenshot (commented out rn, also unfinished)

    """
    if Message.replace(" ", "") == 'RIGHTJAB':
        # Hopefully this command works for smash
        # I also removed some .update() calls
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        time.sleep(0.3)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.update()
        return
    elif Message.replace(" ", "") == 'LEFTJAB':
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        time.sleep(0.3)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.update()
        return
    elif Message.replace(" ", "") == 'UPAIR':
        Vgamepad.left_joystick(0, 30000)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.update()
        return
    elif Message.replace(" ", "") == 'DOWNAIR':
        Vgamepad.left_joystick(0, -30000)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.update()
        return
    elif Message.replace(" ", "") == 'RIGHTSPECIAL':
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.update()
        return
    elif Message.replace(" ", "") == 'LEFTSPECIAL':
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.update()
        return
    elif Message.replace(" ", "") == 'UPSPECIAL':
        Vgamepad.left_joystick(0, 30000)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.update()
        return
    elif Message.replace(" ", "") == 'DOWNSPECIAL':
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.update()
        return
    # Dunno if thumb L counts as a button in vgamepad docs
    elif Message == 'Z' or Message == 'NUNCHUCKSHAKE':
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_LEFT_THUMB)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_LEFT_THUMB)
        Vgamepad.update()
        return
    elif Message == 'UP':
        Vgamepad.left_joystick(0, 30000)
        Vgamepad.update()
        return
    elif Message == 'LEFT':
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.update()
        return
    elif Message == 'RIGHT':
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.update()
        return
    # Left jump and right jump
    elif Message == 'LUMP':
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        time.sleep(0.3)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        return
    elif Message == 'RUMP':
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        time.sleep(0.3)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        return
    # Light left and light right
    elif Message == 'LR':
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.update()
        time.sleep(0.4)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.update()
        return
    elif Message == 'LL':
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.update()
        time.sleep(0.4)
        Vgamepad.left_joystick(0, 0)
        Vgamepad.update()
        return
    elif Message == 'DOWN':
        Vgamepad.left_joystick(0, -30000)
        Vgamepad.update()
        return
    elif Message == 'STOP':
        Vgamepad.reset()
        Vgamepad.update()
        return
    elif Message == 'X' or message.content == '1':
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_Y)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_Y)
        Vgamepad.update()
        return
    elif Message == 'Y' or message.content == '2':
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_B)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_B)
        Vgamepad.update()
        return
    # Spot dodge code I believe
    elif Message == 'RT' or Message == 'NUNCHUCKZ':
        Vgamepad.right_trigger(255)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.right_trigger(0)
        Vgamepad.update()
        return
    # I think shake is shield
    elif Message == 'LT' or Message == 'SHAKE':
        Vgamepad.left_trigger(255)
        Vgamepad.update()
        time.sleep(0.2)
        Vgamepad.left_trigger(0)
        Vgamepad.update()
        return
    elif Message == 'START':
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_START)
        Vgamepad.update()
        time.sleep(0.5)
        Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_START)
        Vgamepad.update()
        return
    """
    #############################################

    #############################################
    # IN-PROGRESS Tetris Commands
    # WHITESPACE AND CAPITILIZATION INSENSITIVE
    # up
    # down
    # right
    # left
    # rotate
    # drop
    # start
    # screenshot (commented out rn, also unfinished)
    """
    if (Message == 'up'):
        keyboard.press("E")
        time.sleep(0.5)
        keyboard.release('E')

    elif (Message == 'down'):
        keyboard.press("D")
        time.sleep(0.5)
        keyboard.release('D')

    elif (Message == 'right'):
        keyboard.press("F")
        time.sleep(0.5)
        keyboard.release('F')

    elif (Message == 'left'):
        keyboard.press("S")
        time.sleep(0.5)
        keyboard.release('S')

    elif (Message == 'start'):
        keyboard.press("T")
        time.sleep(0.5)
        keyboard.release('T')

    # Still need to figure out a few of these
    elif (Message == 'drop'):

    elif (Message == 'rotate'):
    """

    #############################################

    await bot.process_commands(message)

# Threading functions to call as many inputs as possible and make sure they last the proper amount of time
def LU():
    Vgamepad.left_joystick(0, 0)
    Vgamepad.update()
    return

def LD():
    Vgamepad.left_joystick(0, 0)
    Vgamepad.update()
    return

def LL():
    Vgamepad.left_joystick(0, 0)
    Vgamepad.update()
    return

def LR():
    Vgamepad.left_joystick(0, 0)
    Vgamepad.update()
    return

def LUMP():
    Vgamepad.left_joystick(0, 0)
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
    Vgamepad.update()

def RUMP():
    Vgamepad.left_joystick(0, 0)
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
    Vgamepad.update()


def START():
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_START)
    Vgamepad.update()
    return

def A():
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
    Vgamepad.update()
    return

# Toggle Holding A
def HOLDA():
    global toggleA
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
    Vgamepad.update()
    toggleA = 0
    return

def B():
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_B)
    Vgamepad.update()
    return

def HOLDB():
    global toggleB
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_B)
    Vgamepad.update()
    toggleB = 0
    return

def X():
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
    Vgamepad.update()
    return

def LTHUMB():
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_LEFT_THUMB)
    Vgamepad.update()
    return

def Y():
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_Y)
    Vgamepad.update()
    return

def BACK():
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_BACK)
    Vgamepad.update()
    return

def LT():
    Vgamepad.left_trigger(0)
    Vgamepad.update()
    return

def HOLDLT():
    global toggleLT
    Vgamepad.left_trigger(0)
    Vgamepad.update()
    toggleLT = 0
    return

def RT():
    Vgamepad.right_trigger(0)
    Vgamepad.update()
    return

def HOLDRT():
    global toggleRT
    Vgamepad.right_trigger(0)
    Vgamepad.update()
    toggleRT = 0
    return

def LB():
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_LEFT_SHOULDER)
    Vgamepad.update()
    return

def RB():
    Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_SHOULDER)
    Vgamepad.update()
    return


# On script termination notify users in Discord channel
# A cmd to logout the bot. Alternatively, you can just break out of the script
# THIS MUST BE RUN W/ A / in front (/stop)
@bot.command(name="stop")
@commands.is_owner()
async def logout(ctx):
    await channel.send("Logging off")
    # This turned out to be depricated, so I just closed an instance of client
    # await ctx.bot.logout()
    c = Client()
    await c.close()


def main(textid, TC, length):
    # Base cases
    try: 
        int(textid)
    except ValueError:
        print("Improper channel id")
        exit()

    if len(str(textid)) != 18:
        print("Improper channel id length")
        exit()

    global id
    id = textid
    global commandList
    commandList = TC
    global commandLength
    commandLength = length

    # token is the ID of the discord bot
    # Run the bot, indicate if the bot is offline, then exit the program (if stop is True is a GUI toggle)
    bot.run(os.getenv('CLIENT_TOKEN'))

# If standalone
if __name__ == "__main__":
    # Read config settings
    with open("configs/config.json") as f:
        config = json.load(f)
    discordConfig = config["DISCORD"]

    # Set config settings
    id = discordConfig["textchannelid"]
    Commands = []
    Length = []

    for command in discordConfig["commands"]:
        Commands.append(bool(discordConfig["commands"][str(command)]))

    for value in discordConfig["time"].values():
        Length.append(value)
    
    # Send config settings
    main(id, Commands, Length)
