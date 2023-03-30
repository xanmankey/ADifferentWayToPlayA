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