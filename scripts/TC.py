from discord import channel
from discord.ext import commands
import vgamepad as vg
import os
import sys
from dotenv import load_dotenv
import threading

# First CL argument is main, second is text channel, third is a boolean list of commands
# Although I don't know why you would want to run the programs independently via CL over via GUI
args = sys.argv
if len(args) != 3:
    print("Invalid number of arguments")

load_dotenv('.env')

# client = discord.Client()
bot = commands.Bot(command_prefix='/', description="Text Commands to Game Input")

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
    channel = bot.get_channel(int(args[1]))
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
    if Message == 'UP' and args[2][1] == "True":
        Vgamepad.left_joystick(0, 30000)
        Vgamepad.update()
        return
    elif Message == 'LU' and args[2][2] == "True":
        Vgamepad.left_joystick(0, 30000)
        Vgamepad.update()
        threading.Timer(0.3, LU).start()
        return
    elif Message == 'DOWN' and args[2][3] == "True":
        Vgamepad.left_joystick(0, -30000)
        Vgamepad.update()
        return
    elif Message == 'LD' and args[2][4] == "True":
        Vgamepad.left_joystick(0, -30000)
        Vgamepad.update()
        threading.Timer(0.3, LD).start()
        return
    elif Message == 'LEFT' and args[2][5] == "True":
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.update()
        return
    elif Message == 'LL' and args[2][6] == "True":
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.update()
        threading.Timer(0.3, LL).start()
        return
    elif Message == 'RIGHT' and args[2][7] == "True":
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.update()
        return
    elif Message == 'LR' and args[2][8] == "True":
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.update()
        threading.Timer(0.3, LR).start()
        return
    elif Message == 'LUMP' and args[2][9] == "True":
        Vgamepad.left_joystick(-30000, 0)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        threading.Timer(0.3, LUMP).start()
        return
    elif Message == 'RUMP' and args[2][10] == "True":
        Vgamepad.left_joystick(30000, 0)
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        threading.Timer(0.3, RUMP).start()
        return
    elif Message == 'START' and args[2][11] == "True":
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_START)
        Vgamepad.update()
        threading.Timer(0.2, START).start()
        return
    elif Message == 'STOP' and args[2][12] == "True":
        Vgamepad.reset()
        Vgamepad.update()
        return
    elif Message == 'A' and args[2][13] == "True":
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
        Vgamepad.update()
        threading.Timer(0.5, A).start()
        return
    elif Message == 'HOLDA' and args[2][14] == "True":
        # Making a toggle button w/ vgamepad
        global toggleA
        if toggleA == 0:
            Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_A)
            Vgamepad.update()
            toggleA = 1
        else:
            threading.Timer(0.2, HOLDA).start()
        return
    elif Message == 'B' and args[2][15] == "True":
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_B)
        Vgamepad.update()
        threading.Timer(0.2, B).start()
        return
    elif Message == 'HOLDB' and args[2][16] == "True":
        # Making a toggle button w/ vgamepad
        global toggleB
        if toggleB == 0:
            Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_B)
            Vgamepad.update()
            toggleB = 1
        else:
            threading.Timer(0.2, HOLDB).start()
        return
    elif Message == 'X' and args[2][17] == "True":
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_X)
        Vgamepad.update()
        threading.Timer(0.2, X).start()
        return
    elif Message == 'LTHUMB' and args[2][18] == "True":
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_LEFT_THUMB)
        Vgamepad.update()
        threading.Timer(0.2, LTHUMB).start()
        return
    elif Message == 'Y' and args[2][19] == "True":
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_Y)
        Vgamepad.update()
        threading.Timer(0.2, Y).start()
        return
    elif Message == 'BACK' and args[2][20] == "True":
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_BACK)
        Vgamepad.update()
        threading.Timer(0.2, BACK).start()
        return
    elif Message == 'LT' and args[2][21] == "True":
        Vgamepad.left_trigger(255)
        Vgamepad.update()
        threading.Timer(1.01, LT).start()
        return
    elif Message == 'HOLDLT' and args[2][22] == "True":
        # Making a toggle button w/ vgamepad
        global toggleLT
        if toggleLT == 0:
            Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_LT)
            Vgamepad.update()
            toggleLT = 1
        else:
            threading.Timer(0.2, HOLDLT).start()
        return
    elif Message == 'RT' and args[2][23] == "True":
        Vgamepad.right_trigger(255)
        Vgamepad.update()
        threading.Timer(0.2, RT).start()
        return
    elif Message == 'HOLDRT' and args[2][24] == "True":
        Vgamepad.right_trigger(255)
        Vgamepad.update()
        threading.Timer(0.2, HOLDRT).start()
        return
    elif Message == 'LB' and args[2][25] == "True":
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_LEFT_SHOULDER)
        Vgamepad.update()
        threading.Timer(0.2, LB).start()
        return
    elif Message == 'RB' and args[2][26] == "True":
        Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_SHOULDER)
        Vgamepad.update()
        threading.Timer(0.2, RB).start()
        return
    # If you want a screenshot cmd I left it in strings
    """
    elif Message == 'SCREENSHOT':
        Didn't import the python module, I'll only use this to bail me out if I'm losing
        keyboard.press('/')
        time.sleep(0.2)
        keyboard.release('/')
    """
    #############################################
    # I also decided to make specific cmds for certain games
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

# A message to indicate the bot is offline
@bot.event
async def logout():
    channel = bot.get_channel(int(args[1]))
    await channel.send("Logging off")
    await bot.logout()


# token is the ID of the discord bot
# One special thing about .env files are that they are only visible to you
bot.run(os.getenv('CLIENT_TOKEN'))
