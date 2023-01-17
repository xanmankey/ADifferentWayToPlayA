import XInput
from vgamepad import XUSB_BUTTON, VX360Gamepad
import time

# TODO: possibly building MIOP, RC, and FC into ONE script
# (controller programs)

# 4 real, 4 virtual gamepads
GAMEPADS = [None] * 8
GAMEPADTHREADS = [None] * 4

# FC stands for filtered controls
# It leverages XInput-Pythons filter functionality to restrict certain buttons/triggers/joysticks
# (dependent on how masochistic you feel) at certain intervals 

class FilterController(XInput.EventHandler):
    # def __init__(self, *controllers):
    #     super().__init__(*controllers)
    def process_button_event(self, event):
        # parse button events (handling press and release)
        if event == XInput.EVENT_BUTTON_PRESSED:
            match event.button:
                case "DPAD_UP":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_DPAD_UP)
                case "DPAD_DOWN":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_DPAD_DOWN)
                case "DPAD_LEFT":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_DPAD_LEFT)
                case "DPAD_RIGHT":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_DPAD_RIGHT)
                case "LEFT_THUMB":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_LEFT_THUMB)
                case "RIGHT_THUMB":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_THUMB)
                case "LEFT_SHOULDER":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_LEFT_SHOULDER)
                case "RIGHT_SHOULDER":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_SHOULDER)
                case "A":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_A)
                case "B":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_B)
                case "X":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_X)
                case "Y":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_Y)
                case "START":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_START)
                case "BACK":
                    GAMEPADS[event.user_index].press_button(button=XUSB_BUTTON.XUSB_GAMEPAD_BACK)
        elif event == XInput.EVENT_BUTTON_RELEASED:
            match event.button:
                case "DPAD_UP":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_DPAD_UP)
                case "DPAD_DOWN":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_DPAD_DOWN)
                case "DPAD_LEFT":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_DPAD_LEFT)
                case "DPAD_RIGHT":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_DPAD_RIGHT)
                case "LEFT_THUMB":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_LEFT_THUMB)
                case "RIGHT_THUMB":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_THUMB)
                case "LEFT_SHOULDER":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_LEFT_SHOULDER)
                case "RIGHT_SHOULDER":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_RIGHT_SHOULDER)
                case "A":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_A)
                case "B":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_B)
                case "X":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_X)
                case "Y":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_Y)
                case "START":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_START)
                case "BACK":
                    GAMEPADS[event.user_index].release_button(button=XUSB_BUTTON.XUSB_GAMEPAD_BACK)
        GAMEPADS[event.user_index].update()

    def process_trigger_event(self, event):
        # parse trigger events (takes event.value)
        match event.trigger:
            case XInput.LEFT:
                GAMEPADS[event.user_index].left_trigger_float(event.value)
            case XInput.RIGHT:
                GAMEPADS[event.user_index].right_trigger_float(event.value)
        GAMEPADS[event.user_index].update()

    def process_stick_event(self, event):
        # parse stick events (takes x, y, value, AND direction)
        match event.stick:
            case XInput.LEFT:
                GAMEPADS[event.user_index].left_joystick_float(event.x, event.y)
            case XInput.RIGHT:
                GAMEPADS[event.user_index].right_joystick_float(event.x, event.y)
        GAMEPADS[event.user_index].update()

    def process_connection_event(self, event):
        pass


class CreateGamepadThreads(XInput.EventHandler):
    # Defining custom controller index handling
    # def __init__():
    #     self.controllers = 
    def create_thread(self, *controllers, input_handler=FilterController):
        if input_handler != FilterController:
            print("creating manager thread")
            # For handling the managerial thread
            handler = input_handler(0, 1, 2, 3)
            return XInput.GamepadThread(handler)
        else:
            print("Creating controller " + str(controllers) + " thread!")
            # Create GAMEPADS[self.user_index] instance
            GAMEPADS[controllers[0]] = VX360Gamepad()
            # Create XInput event handler thread
            handler = input_handler(controllers[0])
            # NOTE: gamepad threads automatically start upon creation
            GAMEPADTHREADS[controllers[0]] = XInput.GamepadThread(handler)

    @staticmethod
    def destroy_thread(controllerNum):
        print("destroying thread " + str(controllerNum))
        # Stop the specified gamepad thread
        GAMEPADTHREADS[controllerNum].stop()
        # Overwrite GAMEPADS[self.user_index] instance
        del GAMEPADS[controllerNum]

    @staticmethod
    def check_threads():
        # Check if ONE thread is alive
        for thread in GAMEPADTHREADS:
            if thread:
                return True
        return False
    
    def process_button_event(self, event):
        pass
    
    def process_trigger_event(self, event):
        pass

    def process_stick_event(self, event):
        pass

    def process_connection_event(self, event):
        # parse gamepad status events
        match event.type:
            case XInput.EVENT_CONNECTED:
                self.create_thread(event.user_index)
            case XInput.EVENT_DISCONNECTED:
                self.destroy_thread(event.user_index)


def timeFilters(interval):
    pass

def main():  
    # Create handler thread
    # TODO: figure out a solution with add_controller(), remove_controller(), and get_connected()
    manager = CreateGamepadThreads.create_thread(0, input_handler=CreateGamepadThreads)
    # Sleeping to avoid a race condition
    time.sleep(3)

    # Loop the main thread until one of two signals is received
    try:
        while True:
            if CreateGamepadThreads.check_threads():
                time.sleep(1)
            else:
                print("No threads, exiting")
                manager.stop()
                exit()
    except KeyboardInterrupt:
        manager.stop()
        controllerNum = 0
        for controller in GAMEPADS:
            if controller:
                CreateGamepadThreads.destroy_thread(controllerNum)
            controllerNum += 1
        exit()

# For calling standalone
if __name__ == "__main__":
    import json       # Call main using default values from config file
    with open("configs/config.json") as f:
        config = json.load(f)
    main()