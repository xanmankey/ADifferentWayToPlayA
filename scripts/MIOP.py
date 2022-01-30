from __future__ import print_function
import XInput
from inputs import get_gamepad
import inputs
import threading
from vgamepad import XUSB_BUTTON, VX360Gamepad


# Get all controller input and map it to one gamepad using a while loop and threading
def AllInOne(controller):
    while True:
        events = get_gamepad(controller)
        for event in events:
            if event.code == 'ABS_Y' or event.code == 'ABS_X':
                analogState = XInput.get_state(controller)
                XInput.get_thumb_values(analogState)
                analogX = analogState.Gamepad.sThumbLX
                analogY = analogState.Gamepad.sThumbLY
                Vgamepad.left_joystick(analogX, analogY)
                Vgamepad.update()
            elif event.code == 'BTN_SOUTH' and event.state == 1:
                Vgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_A)
                Vgamepad.update()
            elif event.code == 'BTN_SOUTH' and event.state == 0:
                Vgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_A)
                Vgamepad.update()
            elif event.code == 'BTN_NORTH' and event.state == 1:
                Vgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_Y)
                Vgamepad.update()
            elif event.code == 'BTN_NORTH' and event.state == 0:
                Vgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_Y)
                Vgamepad.update()
            elif event.code == 'BTN_EAST' and event.state == 1:
                Vgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_B)
                Vgamepad.update()
            elif event.code == 'BTN_EAST' and event.state == 0:
                Vgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_B)
                Vgamepad.update()
            elif event.code == 'BTN_WEST' and event.state == 1:
                Vgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_X)
                Vgamepad.update()
            elif event.code == 'BTN_WEST' and event.state == 0:
                Vgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_X)
                Vgamepad.update()
            elif event.code == 'BTN_TL' and event.state == 1:
                Vgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_LEFT_SHOULDER)
                Vgamepad.update()
            elif event.code == 'BTN_TL' and event.state == 0:
                Vgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_LEFT_SHOULDER)
                Vgamepad.update()
            elif event.code == 'BTN_TR' and event.state == 1:
                Vgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_SHOULDER)
                Vgamepad.update()
            elif event.code == 'BTN_TR' and event.state == 0:
                Vgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_SHOULDER)
                Vgamepad.update()
            elif event.code == 'ABS_RZ' and event.state != 0:
                Vgamepad.right_trigger(255)
                Vgamepad.update()
            elif event.code == 'ABS_RZ' and event.state == 0:
                Vgamepad.right_trigger(0)
                Vgamepad.update()
            elif event.code == 'ABS_Z' and event.state != 0:
                Vgamepad.left_trigger(255)
                Vgamepad.update()
            elif event.code == 'ABS_Z' and event.state == 0:
                Vgamepad.left_trigger(0)
                Vgamepad.update()
            elif event.code == 'BTN_START' and event.state == 1:
                Vgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_START)
                Vgamepad.update()
            elif event.code == 'BTN_START' and event.state == 0:
                Vgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_START)
                Vgamepad.update()
            elif event.code == 'BTN_SELECT' and event.state == 1:
                Vgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_BACK)
                Vgamepad.update()
            elif event.code == 'BTN_SELECT' and event.state == 0:
                Vgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_BACK)
                Vgamepad.update()

# Get all controller input and map it to 2 different gamepads (divided into teams)
def Teams(controller):
    while True:
        events = get_gamepad(controller)
        for event in events:
            if event.code == 'ABS_Y' or event.code == 'ABS_X':
                analogState = XInput.get_state(controller)
                XInput.get_thumb_values(analogState)
                analogX = analogState.Gamepad.sThumbLX
                analogY = analogState.Gamepad.sThumbLY
                Tgamepad.left_joystick(analogX, analogY)
                Tgamepad.update()
            elif event.code == 'BTN_SOUTH' and event.state == 1:
                Tgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_A)
                Tgamepad.update()
            elif event.code == 'BTN_SOUTH' and event.state == 0:
                Tgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_A)
                Tgamepad.update()
            elif event.code == 'BTN_NORTH' and event.state == 1:
                Tgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_Y)
                Tgamepad.update()
            elif event.code == 'BTN_NORTH' and event.state == 0:
                Tgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_Y)
                Tgamepad.update()
            elif event.code == 'BTN_EAST' and event.state == 1:
                Tgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_B)
                Tgamepad.update()
            elif event.code == 'BTN_EAST' and event.state == 0:
                Tgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_B)
                Tgamepad.update()
            elif event.code == 'BTN_WEST' and event.state == 1:
                Tgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_X)
                Tgamepad.update()
            elif event.code == 'BTN_WEST' and event.state == 0:
                Tgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_X)
                Tgamepad.update()
            elif event.code == 'BTN_TL' and event.state == 1:
                Tgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_LEFT_SHOULDER)
                Tgamepad.update()
            elif event.code == 'BTN_TL' and event.state == 0:
                Tgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_LEFT_SHOULDER)
                Tgamepad.update()
            elif event.code == 'BTN_TR' and event.state == 1:
                Tgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_SHOULDER)
                Tgamepad.update()
            elif event.code == 'BTN_TR' and event.state == 0:
                Tgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_SHOULDER)
                Tgamepad.update()
            elif event.code == 'ABS_RZ' and event.state != 0:
                Tgamepad.right_trigger(255)
                Tgamepad.update()
            elif event.code == 'ABS_RZ' and event.state == 0:
                Tgamepad.right_trigger(0)
                Tgamepad.update()
            elif event.code == 'ABS_Z' and event.state != 0:
                Tgamepad.left_trigger(255)
                Tgamepad.update()
            elif event.code == 'ABS_Z' and event.state == 0:
                Tgamepad.left_trigger(0)
                Tgamepad.update()
            elif event.code == 'BTN_START' and event.state == 1:
                Tgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_START)
                Tgamepad.update()
            elif event.code == 'BTN_START' and event.state == 0:
                Tgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_START)
                Tgamepad.update()
            elif event.code == 'BTN_SELECT' and event.state == 1:
                Tgamepad.press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_BACK)
                Tgamepad.update()
            elif event.code == 'BTN_SELECT' and event.state == 0:
                Tgamepad.release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_BACK)
                Tgamepad.update()

def main(gamemode, cont_index):
    global devices
    devices = inputs.DeviceManager()
    global numControllers
    numControllers = 0
    for device in devices.gamepads:
        # Initialization of each object of class GamePad
        devices.gamepads[numControllers] = device
        numControllers += 1
        print("numControllers: " + str(numControllers))

    # Base case: 0 controllers
    if numControllers == 0:
        print("No controllers recognized. If the controller is plugged in, try testing it at https://gamepad-tester.com")
        quit()

    # Initialize first controller
    global Vgamepad
    Vgamepad = VX360Gamepad()

    # Begin sending all input to the one controller
    if gamemode == "alltogether":
        for i in range(numControllers):
            p = threading.Thread(target=AllInOne, args=[i], daemon=True)
            p.start()

    # Assumes max of 4 controllers
    # Assign players to a controller according to GUI (or CL input)
    elif gamemode == "teams":
        # Initialize second controller for teams
        # If 3 v 1, you could use your original controller, but I figured it'd only be fair if you use the virtual one
        global Tgamepad
        Tgamepad = VX360Gamepad()
        i = 0
        for controller in cont_index:
            if controller is True and i <= 3:
                index = i + 1
                p = threading.Thread(target=Teams, args=[index], daemon=True)
                p.start()
            elif controller == "True" and i > 3:
                index = i - 3
                p = threading.Thread(target=AllInOne, args=[index], daemon=True)
                p.start()
            i += 1

    # In order for the controller threads to continue running, the main thread must be stuck in limbo. Thus, a while True loop until termination
    while True:
        if not KeyboardInterrupt:
            exit()

if __name__ == "__main__":
    # Call main using default values from config file
    import json

    players = [False] * 8
    i = 0
    mode = False

    # Read config settings
    with open("configs/config.json") as f:
        config = json.load(f)
    miopConfig = config["MIOP"]

    # Set config settings
    for gamemode in miopConfig["gamemode"]:
        if miopConfig["gamemode"][str(gamemode)] == str(True):
            mode = gamemode
    
    for player in miopConfig["players"]:
        players[i] = bool(miopConfig["players"][str(player)])
        i += 1 

    # Base cases
    if mode is False:
        print("At least one gamemode must be chosen")
        quit()
    
    # Remember that True evaluates to 1
    if sum(players) <= 1:
        print("At least 2 players must be selected")

    # Load config settings
    main(mode, players)
