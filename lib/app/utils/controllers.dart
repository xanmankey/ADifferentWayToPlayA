/*
// A file that I'm experimenting with to handle device input
import 'dart:ffi';
// For time purposes
import 'dart:core';

List<Device> getAllConnectedInputDevices() {
  throw UnimplementedError();
}

Input getInput(Device device) {
  // Listen for and return input
  // Or exit after a short period of time
  throw UnimplementedError();
}

String convertInput(Input input) {
  // Convert an input to a human-readable format
  throw UnimplementedError();
}

// TODO: Ill search the internet a bit and consult ChatGPT on thoughts
// I'm going to do some reading HERE: https://dart.dev/guides/libraries/c-interop

final h = DynamicLibrary.open('user32.dll');
final registerRawInputDevices = h.lookupFunction<
    Uint32 Function(Pointer<RAWINPUTDEVICE> pRawInputDevices, Uint32 uiNumDevices, Uint32 cbSize),
    int Function(Pointer<RAWINPUTDEVICE> pRawInputDevices, int uiNumDevices, int cbSize)>('RegisterRawInputDevices');
final getRawInputData = h.lookupFunction<Uint32 Function(IntPtr hRawInput, Uint32 uiCommand, Pointer<RAWINPUT> pData, Pointer<Uint32> pcbSize),
    int Function(int hRawInput, int uiCommand, Pointer<RAWINPUT> pData, Pointer<Uint32> pcbSize)>('GetRawInputData');

final device = allocate<RAWINPUTDEVICE>();
device.ref.usUsagePage = 0x01;
device.ref.usUsage = 0x02;
device.ref.dwFlags = 0;
device.ref.hwndTarget = nullptr;

registerRawInputDevices(device, 1, sizeOf<RAWINPUTDEVICE>());

final input = allocate<RAWINPUT>();
final inputSize = allocate<Uint32>();
inputSize.value = sizeOf<RAWINPUT>();

final result = getRawInputData(input, RID_INPUT, input, inputSize);
*/

import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/provider/events.dart';
import 'package:tuple/tuple.dart';
import 'package:xinput_gamepad/xinput_gamepad.dart';

/// A simple class for defining how all controllers should operate
class DWTPController {
  /// A function for returning a controller
  static Controller createController({
    required int index,
  }) {
    Controller controller = Controller(index: index);
    // A - select
    // B - back
    // Left analog stick - directions
    // The rest aren't handled
    controller.buttonsMapping = {
      // Emit select event
      ControllerButton.A_BUTTON: () {
        selectEvent.broadcast();
        return;
      },
      // Emit back event
      ControllerButton.B_BUTTON: () {
        backEvent.broadcast();
        return;
      },
    };
    controller.variableKeysMapping = {
      // Emit event to move the cursor horizontally
      VariableControllerKey.THUMB_LX: (value) {
        List<Tuple2<int, int>> cursors = dwtpProvider.cursors;
        cursors[index] = cursors[index].withItem1(value);
        dwtpProvider.updateCursors(cursors);
      },
      // Emit event to move the cursor vertically
      VariableControllerKey.THUMB_LY: (value) {
        List<Tuple2<int, int>> cursors = dwtpProvider.cursors;
        cursors[index] = cursors[index].withItem2(value);
        dwtpProvider.updateCursors(cursors);
      },
    };
    controller.onReleaseButton = (buttons) => releaseButton(buttons);
    return controller;
  }

  /// Function for handling the release of the button
  static void releaseButton(List<ControllerButton> buttons) {
    // for (ControllerButton button in buttons) {
    //   switch (button) {
    //     // Update state to release A button
    //     case ControllerButton.A_BUTTON:
    //       setState(() {
    //         aButtonPressed = false;
    //       });
    //       break;
    //     // Update state to release B button
    //     case ControllerButton.B_BUTTON:
    //       setState(() {
    //         bButtonPressed = false;
    //       });
    //       break;
    //     case ControllerButton.X_BUTTON:
    //       break;
    //     case ControllerButton.Y_BUTTON:
    //       break;
    //     case ControllerButton.DPAD_DOWN:
    //       break;
    //     case ControllerButton.DPAD_UP:
    //       break;
    //     case ControllerButton.DPAD_LEFT:
    //       break;
    //     case ControllerButton.DPAD_RIGHT:
    //       break;
    //     case ControllerButton.START:
    //       break;
    //     case ControllerButton.BACK:
    //       break;
    //     case ControllerButton.LEFT_THUMB:
    //       break;
    //     case ControllerButton.RIGHT_THUMB:
    //       break;
    //     case ControllerButton.LEFT_SHOULDER:
    //       break;
    //     case ControllerButton.RIGHT_SHOULDER:
    //       break;
    //   }
    // }
  }
}
