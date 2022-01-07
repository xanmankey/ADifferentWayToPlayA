# GUI unit testing is tough, but can probably be done w/ PyAutoGUI (https://pyautogui.readthedocs.io/en/latest/index.html)
# The goal is to create automated tests that run if anybody forks anything
# If somebody adds anything new to the GUI, then they should also add a respective test to this file
# Otherwise, this file is just for ensuring that the base code works in new forks and help debugging if the tests fail
import pytest
import pyautogui
import webbrowser

from GUI import test_buttons
import TC
import RC
import MIOP

# Link all buttons in GUI (via __init__.py and using the events from PySimpleGUI), and link them w/ corr. actions
# ONLY the buttons are tested for the proper action (they are the main function of the GUI)
# This is tested first, as the GUI is the first thing users see
# Using pyautogui
def test_GUI():
    buttons = test_buttons()

    # How can I use the buttons array for testing?
    assert


# LAST: testing to make sure the subprocesses run the correct file


# Get the array of cmds and test every cmd one by one
# Using gamepad-tester; tests holding inputs and pressing inputs respectively
def test_Discord():
    # LOOK INTO GAMEPAD TESTER API
    webbrowser.open("https://gamepad-tester.com")

    # I need to get all text command functions
    # I can get the number of selected commands by using args possibly, but that's not the total


    assert

# FOR RANDOM AND MIOP ALL I REALLY NEED TO DO IS RUN THE FILE, EDIT THE INPUTS AND RECORD INPUTS RESPECTIVELY
# Get the array of buttons and test each cmd twice
# Using gamepad-tester; tests holding inputs and pressing inputs respectively
def test_Random():
    # LOOK INTO GAMEPAD TESTER API
    webbrowser.open("https://gamepad-tester.com")


    assert
# Send threaded inputs from multiple controllers using Vgamepad
# Using gamepad-tester for the MIOP controller;
# Tests AllTogether first w/ 4 controllers and then teams in a 2v2
def test_Miop():


    assert
