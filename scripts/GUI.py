import webbrowser
import PySimpleGUI as sg
from dotenv.main import load_dotenv
import inputs
import images
import TC
import RC
import MIOP
import json
import multiprocessing
from dotenv import load_dotenv
import os
# LINKS
# PySimpleGUI
# https://pypi.org/project/PySimpleGUI/
# https://pysimplegui.readthedocs.io/en/latest/call%20reference/

# TODOs (if demand):
# Dualshock functionality
# Upgrade GUI and config_file options
# Custom Text Command Creation
# Custom (and provided) templates for ease of use
# Greater scale for MIOP (more player and team options)
# Text Commands for 3D movement?

# Because multiprocessing runs recursively, and I don't want recursive variable declarations, window creations, ect.
# The program is wrapped in a if __name__ == "__main__":
if __name__ == "__main__":
    # To allow for pyinstaller exe creation
    multiprocessing.freeze_support()
    load_dotenv()

    discordIMG = images.discordIMG
    arrowIMG = images.arrowIMG
    miopIMG = images.miopIMG

    sg.theme("reddit")

    # Read config settings
    with open("configs/config.json") as f:
        config = json.load(f)

    # Setting configuration settings
    discordConfig = config["DISCORD"]
    randomConfig = config["RANDOM"]
    miopConfig = config["MIOP"]

    def create_mainWindow():
        layout = [
            [sg.Text('A Different Way To Play', font=('Comic Sans MS', 48), pad=(20, 0))],
            [sg.Text('Brought to you by ofGameImportance', font=('Comic Sans MS', 14), pad=(230, 0))],
            [sg.Image(filename="static/BasicControllerLarger.png", size=(300, 300), pad=(240, 0))],
            [sg.Button('Discord Text to Game Input', size=(23, 5)), sg.Button('Randomized Controls', size=(23, 5)),
            sg.Button('Multiple Players One Controller', size=(23, 5)),
            sg.Button('Quit', size=(19, 5), pad=((25, 0), (0, 0)), button_color=('red'))]
        ]
        return sg.Window('ADifferentWayToPlay.exe', layout, resizable=False, finalize=True)


    def create_window1():
        layout = [[sg.Text('Discord Text to Game Input', font=('Comic Sans MS', 24), pad=(160, 0))],
                [sg.Button('', image_data=discordIMG, size=(300, 300), pad=(
                    200, 20), button_color=('red'), key=('DISCORD'))],
                [sg.Radio('All Together', "textRadio", pad=((250, 0), (0, 0)), key=("textTogether"), default=eval(discordConfig["textTeams"]['1']), enable_events=True), sg.Radio(
                    'Teams', "textRadio", pad=((25, 0), (0, 0)), enable_events=True, key=("textTeams2"), default=eval(discordConfig["textTeams"]['2']))],
                [sg.Input(discordConfig['textchannelid'], key=('TCID'), pad=(220, 5))],
                [sg.Input(discordConfig['textchannelid2'], key=('TCID2'), pad=(220, 5), visible=False)],
                [sg.Text("COMMANDS", font=('Comic Sans MS', 18), pad=(295, 10))],
                [sg.Checkbox("Up", pad=(25, 0), key="1", default=eval(discordConfig["commands"]["up"])), sg.Checkbox("LightUp (lu)", key="2", default=eval(discordConfig["commands"]["lightup"])), 
                sg.Checkbox("Down", key="3", default=eval(discordConfig["commands"]["down"])), sg.Checkbox("LightDown (ld)", key="4", default=eval(discordConfig["commands"]["lightdown"])), 
                sg.Checkbox("Left", key="5", default=eval(discordConfig["commands"]["left"])), sg.Checkbox("LightLeft (ll)", key="6", default=eval(discordConfig["commands"]["lightleft"])), 
                sg.Checkbox("Right", key="7", default=eval(discordConfig["commands"]["right"])), sg.Checkbox("LightRight (lr)", key="8", default=eval(discordConfig["commands"]["lightright"])), 
                sg.Checkbox("Lump", key="9", default=eval(discordConfig["commands"]["lump"]))],
                [sg.Checkbox("Rump", pad=((30, 0), (0, 0)), key="10", default=eval(discordConfig["commands"]["rump"])), sg.Checkbox("Start", key="11", default=eval(discordConfig["commands"]["start"])), 
                sg.Checkbox("RESET (stop)", key="12", default=eval(discordConfig["commands"]["reset"])), sg.Checkbox("A", key="13", default=eval(discordConfig["commands"]["a"])), 
                sg.Checkbox("HoldA", key="14", default=eval(discordConfig["commands"]["holda"])), sg.Checkbox("B", key="15", default=eval(discordConfig["commands"]["b"])), 
                sg.Checkbox("HoldB", key="16", default=eval(discordConfig["commands"]["holdb"])), sg.Checkbox("X", key="17", default=eval(discordConfig["commands"]["x"])), 
                sg.Checkbox("LThumb", key="18", default=eval(discordConfig["commands"]["lthumb"])), sg.Checkbox("Y", key="19", default=eval(discordConfig["commands"]["y"])), 
                sg.Checkbox("Select", key="20", default=eval(discordConfig["commands"]["select"]))],
                [sg.Checkbox("LT", pad=((200, 0), (0, 0)), key="21", default=eval(discordConfig["commands"]["lt"])), sg.Checkbox("HoldLT", key="22", default=eval(discordConfig["commands"]["holdlt"])), 
                sg.Checkbox("RT", key="23", default=eval(discordConfig["commands"]["rt"])), sg.Checkbox("HoldRT", key="24", default=eval(discordConfig["commands"]["holdrt"])), sg.Checkbox(
                    "LB", key="25", default=eval(discordConfig["commands"]["lb"])), sg.Checkbox("RB", key="26", default=eval(discordConfig["commands"]["rb"]))]
                ]
        return sg.Window('DISCORDWINDOW', layout, resizable=False, finalize=True)


    def create_window2():
        layout = [[sg.Text('Randomized Controls', font=('Comic Sans MS', 24), pad=(190, 0))],
                [sg.Button('', image_data=arrowIMG, size=(300, 300), pad=(
                    200, 0), button_color=('red'), key=('RANDOM'))],
                [sg.Radio('Axis Randomization', "Radio", pad=((150, 0), (0, 0)), enable_events=True, default=eval(randomConfig["randomization"]['axis'])), sg.Radio(
                    'Button Randomization', "Radio", enable_events=True, default=eval(randomConfig["randomization"]['button'])), sg.Radio('Both Randomized', "Radio", enable_events=True, default=eval(randomConfig["randomization"]['both']))],
                [sg.Text('Seconds per randomization', font=(
                    'Comic Sans MS', 18), pad=(200, 0))],
                [sg.Slider(range=(1, 100), orientation='h', size=(50, 25), default_value=int(randomConfig['seconds']), pad=(
                    140, 0), background_color="blue", text_color="white", key=("timer"), enable_events=True)]
                ]
        return sg.Window('RANDOMWINDOW', layout, resizable=False, finalize=True)


    def create_window3():
        layout = [[sg.Text('Multiple Players One Controller', font=('Comic Sans MS', 24), pad=(135, 0))],
                [sg.Button('', image_data=miopIMG, size=(300, 1), pad=(
                    220, 0), button_color=('red'), key=('MIOP'))],
                [sg.Text('Gamemode', font=(
                    'Comic Sans MS', 18), pad=(290, 0))],
                [sg.Radio('All Together', "miopRadio", pad=((250, 0), (0, 0)), key=("allTogether"), default=eval(miopConfig["gamemode"]['alltogether']), enable_events=True), sg.Radio(
                    'Teams', "miopRadio", pad=((25, 0), (0, 0)), enable_events=True, key=("teams"), default=eval(miopConfig["gamemode"]['teams']))],
                [sg.Text('                   Team1                                    Team2', font=(
                    'Comic Sans MS', 18), pad=(20, 0), key="teamsText", visible=False)],
                [sg.Column([[sg.Checkbox("1", key="1", pad=((100, 0), (0, 0)), visible=False, default=eval(miopConfig["players"]['p1-1']))]]), sg.Column([[sg.Checkbox("2", key="2", visible=False, default=eval(miopConfig["players"]['p1-2']))]]), 
                sg.Column([[sg.Checkbox("3", key="3", visible=False, default=eval(miopConfig["players"]['p1-3']))]]), sg.Column([[sg.Checkbox("4", key="4", visible=False, default=eval(miopConfig["players"]['p1-4']))]]), 
                sg.Column([[sg.Checkbox("1", key="5", pad=((120, 0), (0, 0)), visible=False, default=eval(miopConfig["players"]['p2-1']))]]), sg.Column([[sg.Checkbox("2", key="6", visible=False, default=eval(miopConfig["players"]['p2-2']))]]), 
                sg.Column([[sg.Checkbox("3", key="7", visible=False, default=eval(miopConfig["players"]['p2-3']))]]), sg.Column([[sg.Checkbox("4", key="8", visible=False, default=eval(miopConfig["players"]['p2-4']))]])]
                ]
        return sg.Window('MIOPWINDOW', layout, resizable=False, finalize=True)


    # Initialize windows and open main window
    mainWindow, window1, window2, window3 = create_mainWindow(), None, None, None

    # Var declarations that I don't want happening inside the event loop
    color1 = 'red'
    color2 = 'red'
    color3 = 'red'
    i = 0
    j = 0
    m = 0
    numCommands = 0
    players = [None] * len(miopConfig["players"])
    commands = [None] * len(discordConfig["commands"])
    time = [None] * len(discordConfig["time"])
    numOnTeam = 0
    error = 0
    textTeams = 1


    # Event Loop
    while True:
        # window.read() is a tuple of (events, values) (read_all_windows() reads all)
        # Where events are WHY the read completed
        # And values are just a dict of return values
        window, event, values = sg.read_all_windows()
        # Check if user wants to quit or window was closed (if user clicks x or quit)
        if event == sg.WINDOW_CLOSED or event == 'Quit':
            window.close()
            if window == window1:
                window1 = None  # Mark the window as closed
                try:
                    textCommands.terminate()
                except NameError:
                    continue
                try:
                    textCommands2.terminate()
                except NameError:
                    continue
            elif window == window2:
                window2 = None
                try:
                    randomControls.terminate()
                except NameError:
                    continue
            elif window == window3:
                window3 = None
                try:
                    miop.terminate()
                except NameError:
                    continue
            elif window == mainWindow:
                break
            if window == mainWindow:
                break
        # Check if window 1, 2, or 3 is being launched from the main window
        elif event == 'Discord Text to Game Input' and not window1:
            # Create the windows
            window1 = create_window1()
        elif event == 'Randomized Controls' and not window2:
            window2 = create_window2()
        elif event == 'Multiple Players One Controller' and not window3:
            window3 = create_window3()

        # Dealing with events and values for individual windows
        # When the button is pressed, the corresponding script is run, passing the
        # set values of the buttons in as command line args.
        if window1:
            if event == "textTeams2":
                window.Element('TCID2').update(visible=True)
            if event == "textTogether":
                window.Element('TCID2').update(visible=False)
            # Change button color and run program
            if event == 'DISCORD':
                if color1 == 'red':
                    window['DISCORD'].update(button_color=('green'))
                    color1 = 'green'
                    textID = values["TCID"]
                    textID2 = values["TCID2"]
                    # Discord text channel IDs are 18 digits I believe
                    if len(textID) != 18:
                        sg.popup(
                            "Invalid text channel ID, enable Discord developer mode and copy the ID of the text channel you want to use for the input bot.")
                        window['DISCORD'].update(button_color=('red'))
                        color1 = 'red'
                        error = 1
                    # Initialize + base case for commands (uses GUI)
                    for j in range(len(discordConfig["commands"])):
                        commands[j] = values[str(j + 1)]
                        if commands[j] is True:
                            numCommands += 1
                    # Initialize + base case for length of a command (seconds, config only as of rn)
                    for key in discordConfig["time"].keys():
                        if discordConfig["time"][key] <= 0:
                            sg.popup("A command must run for > 0 seconds!")
                            window['DISCORD'].update(button_color=('red'))
                            color1 = 'red'
                            error = 2
                        time[m] = discordConfig["time"][key]
                        m += 1
                    m = 0
                    if numCommands == 0:
                        sg.popup("You must have more than one command enabled! Try again after enabling some commands")
                        window['DISCORD'].update(button_color=('red'))
                        color1 = 'red'
                        error = 3
                    if os.getenv('CLIENT_TOKEN') == 'PASTE_YOUR_TOKEN_HERE':
                        sg.popup("You need to create a bot and paste your token into the .env file to use this script!")
                        window['DISCORD'].update(button_color=('red'))
                        color1 = 'red'
                        error = 4
                    if values["textTeams2"] is True:
                        textTeams = 2
                        if os.getenv('CLIENT_TOKEN2') == 'PASTE_YOUR_TOKEN_HERE':
                            sg.popup("If you want to play teams, you will need two bots, and thus two tokens. Don't forget to update the .env file!")
                            window['DISCORD'].update(button_color=('red'))
                            color1 = 'red'
                            error = 5
                        if len(textID2) != 18:
                            sg.popup("Invalid second text channel ID, enable Discord developer mode and copy the ID of the text channel you want to use for the second input bot.")
                            window['DISCORD'].update(button_color=('red'))
                            color1 = 'red'
                            error = 6
                    # Run script if all prereqs pass
                    if error == 0:
                        # Threading in the GUI event loop is a little precarious; I learned that the hard way
                        # I might look for a better solution, but this works for now
                        if textTeams != 1:
                            textCommands2 = multiprocessing.Process(target=TC.main, args=[int(textID), int(textID2), commands, time, textTeams])
                            textCommands2.start()
                        else:
                            textCommands = multiprocessing.Process(target=TC.main, args=[int(textID), int(textID2), commands, time, textTeams])
                            textCommands.start()
                elif color1 == 'green':
                    # Exit the textCommands script
                    window['DISCORD'].update(button_color=('red'))
                    color1 = 'red'
                    if textTeams != 1:
                        textCommands2.terminate()
                        textCommands2.join()
                    else:
                        textCommands.terminate()
                        # To fully close the thread once the GUI closes
                        textCommands.join()
        elif window2:
            if event == 'RANDOM':
                if color2 == 'red':
                    window['RANDOM'].update(button_color=('green'))
                    color2 = 'green'
                    # If the event is "RANDOM" check the values of the page
                    if values[0] is True:
                        randomization = "axis"
                    elif values[1] is True:
                        randomization = "buttons"
                    elif values[2] is True:
                        randomization = "both"
                    # Get timer value
                    seconds = values["timer"]
                    randomControls = multiprocessing.Process(target=RC.main, args=[randomization, float(seconds)])
                    randomControls.start()
                elif color2 == 'green':
                    window['RANDOM'].update(button_color=('red'))
                    color2 = 'red'
                    randomControls.terminate()
                    randomControls.join()
        elif window3:
            if event == "teams":
                window['teamsText'].update(visible=True)
                for i in range(8):
                    window[str(i + 1)].update(visible=True)
            elif event == "allTogether":
                window['teamsText'].update(visible=False)
                for i in range(8):
                    window[str(i + 1)].update(visible=False)
            if event == 'MIOP':
                if color3 == 'red':
                    window['MIOP'].update(button_color=('green'))
                    color3 = 'green'
                    # Gamemode = all together or teams
                    if values["allTogether"] is True:
                        devices = inputs.DeviceManager()
                        numControllers = 0
                        for device in devices.gamepads:
                            # Initialization of each object of class GamePad
                            devices.gamepads[numControllers] = device
                            numControllers += 1
                        gamemode = "together"
                    elif values["teams"] is True:
                        devices = inputs.DeviceManager()
                        numOnTeam = 0
                        numControllers = 0
                        for device in devices.gamepads:
                            # Initialization of each object of class GamePad
                            devices.gamepads[numControllers] = device
                            numControllers += 1
                        # Create a list for generating teams using the checkboxes
                        for i in range(8):
                            players[i] = values[str(i + 1)]
                            if str(players[i]) == "True":
                                numOnTeam += 1
                        # Notices regarding players on teams and number of connected controllers
                        if numOnTeam < numControllers:
                            sg.popup("Not everybody has been assigned a team")
                        if numOnTeam > numControllers:
                            sg.popup("More team members than connected controllers?")
                        gamemode = "teams"
                    miop = multiprocessing.Process(target=MIOP.main, args=[gamemode, players])
                    miop.start()
                elif color3 == 'green':
                    window['MIOP'].update(button_color=('red'))
                    color3 = 'red'
                    miop.terminate()
                    miop.join()
