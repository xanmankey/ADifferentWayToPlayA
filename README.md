# A Different Way To Play
Three different programs allowing you to play video games in 100% intended ways. Discord text-channel commands, randomized controls, and mapping input from multiple controllers to one or more controllers are included. Have fun, and feel free to use this to play video games in whatever way you see fit! Windows ONLY (due to the current nature of the vgamepad library).
## Usage
Download and unzip the repository. Then, run GUI.exe (in the scripts folder), and navigate the explorer as you see fit. Click the image to run the script when you are happy with your settings! If you wish to change the default options, then edit the config.json file in the configs directory according to how you want to play!
### Discord Text Commands to Input
##### 🛈 In order to use the Discord bot, you will need to create a Discord bot of your own and copy the value of your client token into the .env file.
This program uses discord's bot functionality to read the messages of a text channel and output messages accordingly on an emulated gamepad. There are 3 different sections in the GUI: a permanent invite link for the bot, an input field for the text channel ID (in order to get the ID of a text channel, you need to enable Discord developer mode, right click the channel, and select "copy channel ID"), and a list of checkboxes for the desired text commands. As of right now, the GUI only lets you enable or disable text commands, to change the time a command takes to run you would need to edit config.json and to add a command you would need to edit TC.py. Also, there is one bot specific command, /stop, which can be used to logout the bot. The script will continue running if you use the /stop command, so you will need to either Ctrl + C (if running it standalone) or toggle the GUI button.
### Control Randomization
This program uses a timer function to shuffle an array of controller inputs. In the GUI, there are two options, one to select which inputs you want randomized, and one to determine how many seconds there are in-between controller randomizations.
### Multiple Inputs One Port
This program takes in all controller input and maps it to either one or two controllers (primarily because I didn't anticipate this code being used with more than 4 controllers. If there is demand for more controller options, I might add functionality for it). There are 2 different options in the GUI: gamemode (all controller inputs mapped to one controller or users divided into teams, 2v2 or 3v1 as of right now) and, if the teams gamemode is selected, you can specify which controller indexes you want on which team. If you aren't sure of your controller index, or you just want to test the programs out, https://gamepad-tester.com is a good option.
## New Features?
Some current features that I might add (no guarantees though):
- Simple GUI-compatible custom text command creation
- Greater customizability with the GUI and config file (for all 3 scripts; ideally making it easier to create custom commands and new ways to use each script)
- Dualshock (and not just XInput) support
- Multiprocessing in conjunction with threading and subprocesses (to try and get efficiency as high as possible)
- A method inside the GUI to change controller order (because certain games will not allow you to set controller number in the settings. Most emulators will though)
  - For most games this *hopefully* shouldn't matter, but there are workarounds based on the game service you are using. For example, to reorder XInput controllers in Steam, you may find this tutorial helpful: https://wooting.helpscoutdocs.com/article/59-game-profile-sekiro-shadows-die-twice
## Dev Notes
### Pythonic TODOs
I want to make this application more pythonic and developer-friendly, specifically by:
- Improving my threading (I don't think the program allocates CPU as effectively as it could)
- Reduce unnecessary code (by dividing my programs into smaller modules and not COPY-PASTING. This would also be helpful for testing, as seen below)
- Implementing a system for unit-testing (probably using a mix of pyautogui, pytest, and the gamepad-tester API)
- Find a better balance between interdependence and dependence between the programs (I feel like they may be too reliant on each other right now) 
- Find an alternative to some of the global variables I used (either by passing variables around or creating classes)
- Get better at the deployment process (specifically I want to improve at using Git, as well as learn how to use Github Actions to automate the build process and employ CI or CD, whatever I end up finding more useful)
### Other scripts
All the source python files are provided (shown below). Python version 3.9.6 was used for this project: 
- Demo_Base64_Image_Encoder.py: a PySimpleGUI demo file used to add button functionality to images 
- inputs.py: also in the requirements.txt file, but I made a few changes (specifically adding arguments to the get_gamepad function) under the BSD 3-Clause "New" or "Revised" License
### Requirements
- Requirements.txt contains the files necessary to run the project
- Requirements-dev.txt contains testing (which I have yet to do; unit testing is a concept I was introduced to after the conclusion of this project and something I'm still trying to wrap my head around) and linting software that I used periodically during the project.
## Final Remarks
Overall, I had a great time with this project. I'm constantly learning new concepts and things about programming, and I'm excited to continue adding to this in the future. After some exploratory testing I was able to get this software working on multiple different devices, and had a great time using it after it was done, so I figured I'd upload it for others to try and use! However, I haven't done extensive testing yet, so it is in an early stage, and there WILL be bugs that I haven't found (there always are) but they'll be good for learning how to update and manage a public Github repo. Anyway, I hope you enjoy this project, and thanks for reading my rambling (I like personalizing my ReadMes). Since you made it this far, have some <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Comic_Sans_font.svg/2560px-Comic_Sans_font.svg.png" width="80" height="20" />
