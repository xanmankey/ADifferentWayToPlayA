from __future__ import print_function
import XInput
from inputs import get_gamepad
import inputs
import time
import threading
import random
import vgamepad as vg

# Array of the buttons (using 0 for LT and 1 for RT)
button = [None] * 10
button = [vg.XUSB_BUTTON.XUSB_GAMEPAD_A, vg.XUSB_BUTTON.XUSB_GAMEPAD_Y, vg.XUSB_BUTTON.XUSB_GAMEPAD_B, 
          vg.XUSB_BUTTON.XUSB_GAMEPAD_X, vg.XUSB_BUTTON.XUSB_GAMEPAD_LEFT_SHOULDER,
          vg.XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_SHOULDER, 0, 1]
# Array of axis possibilities (I only decided to include normal and
# reversed controls, anything more was too much)
axis = [None] * 2
axis = [0, 1]

# The Vgamepads will always be related by user_index + numControllers
def randomize(controllerNum):
    Vgamepad = vg.VX360Gamepad()
    global flag
    while True:
        events = get_gamepad(controllerNum)
        for event in events:
            if event.code == 'ABS_X' or event.code == 'ABS_Y':
                state = XInput.get_state(controllerNum)
                thumbValues = XInput.get_thumb_values(state)
                # analogX = analogState.Gamepad.sThumbLX
                # analogY = analogState.Gamepad.sThumbLY
                analogX = thumbValues[0][0]
                analogY = thumbValues[0][1]
                # There are 2 combinations, (x, y) and (-x, -y)
                if axis[0] == 0:
                    Vgamepad.left_joystick_float(analogX, analogY)
                elif axis[0] == 1:
                    Vgamepad.left_joystick_float(-analogX, -analogY)
                Vgamepad.update()
            elif event.code == 'BTN_SOUTH' and event.state == 1:
                # Checking if the button is LT or RT
                if button[0] == 0:
                    Vgamepad.left_trigger(255)
                elif button[0] == 1:
                    Vgamepad.right_trigger(255)
                else:
                    Vgamepad.press_button(button=button[0])
                Vgamepad.update()
            elif event.code == 'BTN_SOUTH' and event.state == 0:
                if button[0] == 0:
                    Vgamepad.left_trigger(0)
                elif button[0] == 1:
                    Vgamepad.right_trigger(0)
                else:
                    Vgamepad.release_button(button=button[0])
                Vgamepad.update()
            elif event.code == 'BTN_NORTH' and event.state == 1:
                if button[1] == 0:
                    Vgamepad.left_trigger(255)
                elif button[1] == 1:
                    Vgamepad.right_trigger(255)
                else:
                    Vgamepad.press_button(button=button[1])
                Vgamepad.update()
            elif event.code == 'BTN_NORTH' and event.state == 0:
                if button[1] == 0:
                    Vgamepad.left_trigger(0)
                elif button[1] == 1:
                    Vgamepad.right_trigger(0)
                else:
                    Vgamepad.release_button(button=button[1])
                Vgamepad.update()
            elif event.code == 'BTN_EAST' and event.state == 1:
                if button[2] == 0:
                    Vgamepad.left_trigger(255)
                elif button[2] == 1:
                    Vgamepad.right_trigger(255)
                else:
                    Vgamepad.press_button(button=button[2])
                Vgamepad.update()
            elif event.code == 'BTN_EAST' and event.state == 0:
                if button[2] == 0:
                    Vgamepad.left_trigger(0)
                elif button[2] == 1:
                    Vgamepad.right_trigger(0)
                else:
                    Vgamepad.release_button(button=button[2])
                Vgamepad.update()
            elif event.code == 'BTN_WEST' and event.state == 1:
                if button[3] == 0:
                    Vgamepad.left_trigger(255)
                elif button[3] == 1:
                    Vgamepad.right_trigger(255)
                else:
                    Vgamepad.press_button(button=button[3])
                Vgamepad.update()
            elif event.code == 'BTN_WEST' and event.state == 0:
                if button[3] == 0:
                    Vgamepad.left_trigger(0)
                elif button[3] == 1:
                    Vgamepad.right_trigger(0)
                else:
                    Vgamepad.release_button(button=button[3])
                Vgamepad.update()
            elif event.code == 'BTN_TL' and event.state == 1:
                if button[4] == 0:
                    Vgamepad.left_trigger(255)
                elif button[4] == 1:
                    Vgamepad.right_trigger(255)
                else:
                    Vgamepad.press_button(button=button[4])
                Vgamepad.update()
            elif event.code == 'BTN_TL' and event.state == 0:
                if button[4] == 0:
                    Vgamepad.left_trigger(0)
                elif button[4] == 1:
                    Vgamepad.right_trigger(0)
                else:
                    Vgamepad.release_button(button=button[4])
                Vgamepad.update()
            elif event.code == 'BTN_TR' and event.state == 1:
                if button[5] == 0:
                    Vgamepad.left_trigger(255)
                elif button[5] == 1:
                    Vgamepad.right_trigger(255)
                else:
                    Vgamepad.press_button(button=button[5])
                Vgamepad.update()
            elif event.code == 'BTN_TR' and event.state == 0:
                if button[5] == 0:
                    Vgamepad.left_trigger(0)
                elif button[5] == 1:
                    Vgamepad.right_trigger(0)
                else:
                    Vgamepad.release_button(button=button[5])
                Vgamepad.update()
            elif event.code == 'ABS_Z' and event.state != 0:
                if button[6] == 0:
                    Vgamepad.left_trigger(255)
                elif button[6] == 1:
                    Vgamepad.right_trigger(255)
                else:
                    Vgamepad.press_button(button=button[6])
                Vgamepad.update()
            elif event.code == 'ABS_Z' and event.state == 0:
                if button[6] == 0:
                    Vgamepad.left_trigger(0)
                elif button[6] == 1:
                    Vgamepad.right_trigger(0)
                else:
                    Vgamepad.release_button(button=button[6])
                Vgamepad.update()
            elif event.code == 'ABS_RZ' and event.state != 0:
                if button[7] == 0:
                    Vgamepad.left_trigger(255)
                elif button[7] == 1:
                    Vgamepad.right_trigger(255)
                else:
                    Vgamepad.press_button(button=button[7])
                Vgamepad.update()
            elif event.code == 'ABS_RZ' and event.state == 0:
                if button[7] == 0:
                    Vgamepad.left_trigger(0)
                elif button[7] == 1:
                    Vgamepad.right_trigger(0)
                else:
                    Vgamepad.release_button(button=button[7])
                Vgamepad.update()
            # Start isn't randomized cuz that's dumb
            elif event.code == 'BTN_START' and event.state == 1:
                Vgamepad.press_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_START)
                Vgamepad.update()
            elif event.code == 'BTN_START' and event.state == 0:
                Vgamepad.release_button(button=vg.XUSB_BUTTON.XUSB_GAMEPAD_START)
                Vgamepad.update()

# Timer thread, randomizes the buttons every __ seconds
def timing(randomization):
    # Once this randomization occurs the length of the button inputs becomes incorrect
    if randomization == "button":
        random.shuffle(button)
    elif randomization == "axis":
        random.shuffle(axis)
    elif randomization == "both":
        random.shuffle(button)
        random.shuffle(axis)

def main(randomization, seconds):
    global devices
    devices = inputs.DeviceManager()
    global numControllers
    numControllers = 0
    # Check the number of controllers
    for device in devices.gamepads:
        devices.gamepads[numControllers] = device
        numControllers += 1
        print("numControllers: " + str(numControllers))

    for i in range(numControllers):
        p = threading.Thread(target=randomize, args=[i], daemon=True)
        p.start()
    # Infinite loop for the timer and randomizer
    while True:
        timer = threading.Timer(seconds, timing(randomization))
        timer.daemon = True
        timer.start()
        time.sleep(seconds)


if __name__ == "__main__":
    # Call main using default values from config file
    import json

    # Read config settings
    with open("configs/config.json") as f:
        config = json.load(f)
    randomConfig = config["RANDOM"]

    # Set config settings
    for randomization in randomConfig["randomization"]:
        if randomConfig["randomization"][str(randomization)] == str(True):
            randomization = randomConfig["randomization"][str(randomization)]

    if randomization is False:
        print("At least one gamemode must be chosen")
        quit()

    # Load config settings
    main(randomization, float(randomConfig['seconds']))
