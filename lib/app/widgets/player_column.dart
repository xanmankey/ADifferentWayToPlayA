// Each player_column has a couple things:
// 1. a scrollable (Horiz) character selector
// 2. a scrollable (Horiz) team selector
// 3. a scrollable (Horiz) program selector
// 4. a specific background color and location depending on gamepad index

// When everybody has their player set up accordingly, you can run the code

// If a controller is disconnected at ANY TIME, the code won't pause, 
// but an event is sent to remove that controller and replace the value with null
// as well as disconnect the virtual gamepad (meaning the DWTP programs need 
// to be event-driven), basically allowing the code to still run but removing 
// that person's input. They can join back in because if they reconnect the controller
// their index will be saved
// If all the controllers are disconnected, the program will close though
// (because then the index order resets in the gamepad API)