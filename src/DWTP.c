#define WIN32_LEAN_AND_MEAN
#include <windows.h>

#include <Xinput.h>
#include <ViGEm/Client.h>
#include <stdio.h>
/// Pragma turns on or off some features of the compiler
/// This pragma adds the setupapi.lib library to the list of library dependencies
#pragma comment(lib, "setupapi.lib")


// Allocate for a connection to the ViGEm driver
/// const auto means the variable's type is determined at runtime
const auto client = vigem_alloc();

if (client == nullptr) {
    std::cerr << "Uh, not enough memory to do that?!" << std::endl;
    return -1;
}

const auto retval = vigem_connect(client);

if (!VIGEM_SUCCESS(retval)) {
    /// Right shifts stdcerr (standard character err) and appends helpful info 
    std::cerr << "ViGEm Bus connection failed with error code: 0x" << std::hex << retval << std::endl;
    return -1;
}

//
// Spawn a 360 controller
//
const auto pad = vigem_target_x360_alloc();

//
// Add client to the bus (i.e. plugging in the virtual controller)
//
const auto pir = vigem_target_add(client, pad);

if (!VIGEM_SUCCESS(pir)) {
    std::cerr << "Target plugin failed with error code: 0x" << std::hex << pir << std::endl;
    return -1;
}

//
// Retrieve the state of a physical controller
//
XINPUT_STATE state;
XInputGetState(0, &state);

//
// Update the virtual controller with the state of the physical controller
//
vigem_target_x360_update(client, pad, *reinterpret_cast<XUSB_REPORT*>(&state.Gamepad));

//
// Free gamepad resources (disconnect the virtual controller)
//
vigem_target_remove(client, pad);
vigem_target_free(pad);

//
// Disconnect from the ViGEm bus
//
vigem_disconnect(client);
vigem_free(client);

printf("End of the program\n");