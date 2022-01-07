# Python code for generating the config file for A Different Way To Play
import configparser

filename = 'config.ini'

config_file = configparser.ConfigParser()

# Default settings
config_file["DISCORD"] = {
    "TextChannelID": "(Type Text Channel ID here)",
    "Up": "True",
    "LightUp": "True",
    "Down": "True",
    "LightDown": "True",
    "Left": "True",
    "LightLeft": "True",
    "Right": "True",
    "LightRight": "True",
    "Lump": "False",
    "Rump": "False",
    "Start": "True",
    "RESET": "True",
    "A": "True",
    "HoldA": "True",
    "B": "True",
    "HoldB": "True",
    "X": "False",
    "LThumb": "False",
    "Y": "False",
    "Select": "False",
    "LT": "True",
    "HoldLT": "False",
    "RT": "True",
    "HoldRT": "False",
    "LB": "True",
    "RB": "True"
}

config_file["RANDOM"] = {
    "randomization":"both",
    "seconds":"20"
}

config_file["MIOP"] = {
    "allTogether": "True",
    "teams": "False", 
    "P1-1": "True",
    "P1-2": "True",
    "P1-3": "False",
    "P1-4": "False",
    "P2-1": "True",
    "P2-2": "True",
    "P2-3": "False",
    "P2-4": "False"
}


# Write configuration to config.ini file
with open(filename, 'w') as configFile:
    config_file.write(configFile)