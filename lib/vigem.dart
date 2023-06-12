import 'dart:ffi';
import 'package:ffi/ffi.dart';

// Bindings so I can call functions from dart;
// useful for emitting inputs during testing
// also could potentially be useful for linking the controllers
// and maybe writing the scripts...

// Dart bindings for the ViGEm Native Client SDK
final viGEmClientLibrary = DynamicLibrary.open('ViGEmClient.lib');

// Struct declarations
class VigemError {
  static const int none = 0;
  // Define other error values here

  static bool isSuccess(int value) {
    return value == none;
  }
}

enum VIGEM_ERROR {
  VIGEM_ERROR_NONE,
  VIGEM_ERROR_BUS_NOT_FOUND,
  VIGEM_ERROR_NO_FREE_SLOT,
  VIGEM_ERROR_INVALID_TARGET,
  VIGEM_ERROR_REMOVAL_FAILED,
  VIGEM_ERROR_ALREADY_CONNECTED,
  VIGEM_ERROR_TARGET_UNINITIALIZED,
  VIGEM_ERROR_TARGET_NOT_PLUGGED_IN,
  VIGEM_ERROR_BUS_VERSION_MISMATCH,
  VIGEM_ERROR_BUS_ACCESS_FAILED,
  VIGEM_ERROR_CALLBACK_ALREADY_REGISTERED,
  VIGEM_ERROR_CALLBACK_NOT_FOUND,
  VIGEM_ERROR_BUS_ALREADY_CONNECTED,
  VIGEM_ERROR_BUS_INVALID_HANDLE,
  VIGEM_ERROR_XUSB_USERINDEX_OUT_OF_RANGE,
  VIGEM_ERROR_INVALID_PARAMETER,
  VIGEM_ERROR_NOT_SUPPORTED,
  VIGEM_ERROR_WINAPI,
  VIGEM_ERROR_TIMED_OUT,
  VIGEM_ERROR_IS_DISPOSING,
}

extension VIGEM_ERRORExtension on VIGEM_ERROR {
  int toValue() {
    switch (this) {
      case VIGEM_ERROR.VIGEM_ERROR_NONE:
        return 0x20000000;
      case VIGEM_ERROR.VIGEM_ERROR_BUS_NOT_FOUND:
        return 0xE0000001;
      case VIGEM_ERROR.VIGEM_ERROR_NO_FREE_SLOT:
        return 0xE0000002;
      case VIGEM_ERROR.VIGEM_ERROR_INVALID_TARGET:
        return 0xE0000003;
      case VIGEM_ERROR.VIGEM_ERROR_REMOVAL_FAILED:
        return 0xE0000004;
      case VIGEM_ERROR.VIGEM_ERROR_ALREADY_CONNECTED:
        return 0xE0000005;
      case VIGEM_ERROR.VIGEM_ERROR_TARGET_UNINITIALIZED:
        return 0xE0000006;
      case VIGEM_ERROR.VIGEM_ERROR_TARGET_NOT_PLUGGED_IN:
        return 0xE0000007;
      case VIGEM_ERROR.VIGEM_ERROR_BUS_VERSION_MISMATCH:
        return 0xE0000008;
      case VIGEM_ERROR.VIGEM_ERROR_BUS_ACCESS_FAILED:
        return 0xE0000009;
      case VIGEM_ERROR.VIGEM_ERROR_CALLBACK_ALREADY_REGISTERED:
        return 0xE0000010;
      case VIGEM_ERROR.VIGEM_ERROR_CALLBACK_NOT_FOUND:
        return 0xE0000011;
      case VIGEM_ERROR.VIGEM_ERROR_BUS_ALREADY_CONNECTED:
        return 0xE0000012;
      case VIGEM_ERROR.VIGEM_ERROR_BUS_INVALID_HANDLE:
        return 0xE0000013;
      case VIGEM_ERROR.VIGEM_ERROR_XUSB_USERINDEX_OUT_OF_RANGE:
        return 0xE0000014;
      case VIGEM_ERROR.VIGEM_ERROR_INVALID_PARAMETER:
        return 0xE0000015;
      case VIGEM_ERROR.VIGEM_ERROR_NOT_SUPPORTED:
        return 0xE0000016;
      case VIGEM_ERROR.VIGEM_ERROR_WINAPI:
        return 0xE0000017;
      case VIGEM_ERROR.VIGEM_ERROR_TIMED_OUT:
        return 0xE0000018;
      case VIGEM_ERROR.VIGEM_ERROR_IS_DISPOSING:
        return 0xE0000019;
    }
  }
}

class _VIGEM_CLIENT_T extends Struct {
  @IntPtr()
  external int hBusDevice;
  @IntPtr()
  external int hDS4OutputReportPickupThread;
  @IntPtr()
  external int hDS4OutputReportPickupThreadAbortEvent;
  // TODO: do I need to define a designated list length?
  // In the case of the C code, it is VIGEM_TARGETS_MAX
  // Array<PVIGEM_TARGET> pTargetsList;
  // See here for more:
  // https://stackoverflow.com/questions/50429660/is-there-a-constant-for-max-min-int-double-value-in-dart
  @Array(-1 >>> 1)
  external Array<Pointer> pTargetsList;

  // _VIGEM_CLIENT_T({
  //   required this.hBusDevice,
  //   required this.hDS4OutputReportPickupThread,
  //   required this.hDS4OutputReportPickupThreadAbortEvent,
  //   required this.pTargetsList,
  // });
}

class CRITICAL_SECTION extends Struct {
  external Pointer<Void> debugInfo;
  @Uint32()
  external int lockCount;
  @Uint32()
  external int recursionCount;
  external Pointer<Void> owningThread;
  external Pointer<Void> lockSemaphore;
  @Uint32()
  external int spinCount;

  factory CRITICAL_SECTION.allocate() =>
      calloc<CRITICAL_SECTION>().cast<CRITICAL_SECTION>().ref;
}

class _VIGEM_TARGET_T extends Struct {
  @Uint32()
  external int Size;
  @Uint32()
  external int SerialNo;
  // VIGEM_TARGET_STATE State;
  @Uint16()
  external int VendorId;
  @Uint16()
  external int ProductId;
  // VIGEM_TARGET_TYPE Type;
  external Pointer<NativeFunction> Notification;
  external Pointer NotificationUserData;
  @Uint8()
  external int IsWaitReadyUnsupported;
  external Pointer CancelNotificationThreadEvent;
  // DS4_OUTPUT_BUFFER Ds4CachedOutputReport;
  external Pointer Ds4CachedOutputReportUpdateAvailable;
  external CRITICAL_SECTION Ds4CachedOutputReportUpdateLock;
  @Uint8()
  external int IsDisposing;
}

typedef EVT_VIGEM_TARGET_ADD_RESULT = Void Function(
  Pointer<PVIGEM_CLIENT> client,
  Pointer<PVIGEM_TARGET> target,
  Int32 result,
);

typedef PVIGEM_CLIENT = Pointer<_VIGEM_CLIENT_T>;

typedef PVIGEM_TARGET = Pointer<_VIGEM_TARGET_T>;

typedef PFN_VIGEM_TARGET_ADD_RESULT = EVT_VIGEM_TARGET_ADD_RESULT;

class XUSB_REPORT {
  int wButtons;
  int bLeftTrigger;
  int bRightTrigger;
  int sThumbLX;
  int sThumbLY;
  int sThumbRX;
  int sThumbRY;

  XUSB_REPORT({
    required this.wButtons,
    required this.bLeftTrigger,
    required this.bRightTrigger,
    required this.sThumbLX,
    required this.sThumbLY,
    required this.sThumbRX,
    required this.sThumbRY,
  });
}

// C Function declarations
// TODO: rewrite these so they follow the C native function parameters
typedef vigem_alloc_type = PVIGEM_CLIENT Function();
typedef vigem_connect_type = VIGEM_ERROR Function(PVIGEM_CLIENT vigem);
typedef vigem_target_x360_alloc_type = PVIGEM_TARGET Function(void);
typedef vigem_target_add_type = VIGEM_ERROR Function(
    PVIGEM_CLIENT vigem, PVIGEM_TARGET target);
typedef vigem_target_add_async_type = VIGEM_ERROR Function(PVIGEM_CLIENT vigem,
    PVIGEM_TARGET target, PFN_VIGEM_TARGET_ADD_RESULT result);

// typedef VIGEM_SUCCESS = <see above>;
// typedef XInputGetState = <part of windows api>;
typedef vigem_target_x360_update_type = VIGEM_ERROR Function(
    PVIGEM_CLIENT vigem, PVIGEM_TARGET target, XUSB_REPORT report);
typedef vigem_target_x360_get_user_index_type = VIGEM_ERROR Function(
    PVIGEM_CLIENT vigem, PVIGEM_TARGET target, Pointer<Int32> index);
typedef vigem_target_get_index_type = Int32 Function(PVIGEM_TARGET target);
typedef vigem_target_is_attached_type = Bool Function(PVIGEM_TARGET target);
typedef vigem_target_remove_type = VIGEM_ERROR Function(
    PVIGEM_CLIENT vigem, PVIGEM_TARGET target);
typedef vigem_target_free_type = void Function(PVIGEM_TARGET target);
typedef vigem_disconnect_type = void Function(PVIGEM_CLIENT vigem);
typedef vigem_free_type = void Function(PVIGEM_CLIENT vigem);

// Dart function declarations
final vigem_alloc_dart_type = 
final vigem_connect_dart_type =
final vigem_target_x360_alloc_dart_type = 
final vigem_target_add_dart_type = 
final vigem_target_add_async_dart_type = 
final vigem_target_x360_update_dart_type = 
final vigem_target_x360_get_user_index_dart_type = 
final vigem_target_get_index_dart_type = 
final vigem_target_is_attached_dart_type = 
final vigem_target_remove_dart_type =
final vigem_target_free_dart_type =
final vigem_disconnect_dart_type = 
final vigem_free_dart_type =  


// Bind to dart functions
final vigem_alloc = viGEmClientLibrary
    .lookupFunction<vigem_alloc_type, dart_type>('vigem_alloc');
final vigem_connect = viGEmClientLibrary
    .lookupFunction<vigem_connect_type, dart_type>('vigem_connect');
final vigem_target_x360_alloc =
    viGEmClientLibrary.lookupFunction<vigem_target_x360_alloc_type, dart_type>(
        'vigem_target_x360_alloc');
final vigem_target_add = viGEmClientLibrary
    .lookupFunction<vigem_target_add_type, dart_type>('vigem_target_add');
final vigem_target_add_async = viGEmClientLibrary
    .lookupFunction<vigem_target_add_async_type, dart_type>('vigem_target_add_async');
final vigem_target_x360_update =
    viGEmClientLibrary.lookupFunction<vigem_target_x360_update_type, dart_type>(
        'vigem_target_x360_update');
final vigem_target_x360_get_user_index = viGEmClientLibrary.lookupFunction<
    vigem_target_x360_get_user_index_type,
    dart_type>('vigem_target_x360_get_user_index');
final vigem_target_get_index =
    viGEmClientLibrary.lookupFunction<vigem_target_get_index_type, dart_type>(
        'vigem_target_get_index');
final vigem_target_is_attached =
    viGEmClientLibrary.lookupFunction<vigem_target_is_attached_type, dart_type>(
        'vigem_target_is_attached');
final vigem_target_remove = viGEmClientLibrary
    .lookupFunction<vigem_target_remove_type, dart_type>('vigem_target_remove');
final vigem_target_free = viGEmClientLibrary
    .lookupFunction<vigem_target_free_type, dart_type>('vigem_target_free');
final vigem_disconnect = viGEmClientLibrary
    .lookupFunction<vigem_disconnect_type, dart_type>('vigem_disconnect');
final vigem_free =
    viGEmClientLibrary.lookupFunction<vigem_free_type, dart_type>('vigem_free');
