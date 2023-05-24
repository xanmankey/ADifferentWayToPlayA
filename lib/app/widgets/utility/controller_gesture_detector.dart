import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/provider/events.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:event/event.dart';

typedef APressedCallback = void Function(Offset cursorOffset);
typedef BPressedCallback = void Function(Offset cursorOffset);

/// A widget that all selectable widgets are wrapped in
/// Provides an onSelected callback function to update the state of the widget
class ControllerGestureDetector extends StatefulWidget {
  Widget child;
  // onSelect performs hitTesting and logic in case of selection for individual widgets
  APressedCallback onSelect;
  // Ditto for onBack
  BPressedCallback onBack;
  // Controller index
  int index;
  ControllerGestureDetector({
    super.key,
    required this.child,
    required this.onSelect,
    required this.onBack,
    required this.index,
  });

  @override
  State<ControllerGestureDetector> createState() =>
      _ControllerGestureDetectorState();
}

class _ControllerGestureDetectorState extends State<ControllerGestureDetector> {
  @override
  void initState() {
    // Subscribe to a and b button events
    // If emitted, run callbacks accordingly
    selectEvent.subscribe((args) {
      widget.onSelect(Offset(dwtpProvider.cursors[widget.index].item1 as double,
          dwtpProvider.cursors[widget.index].item2 as double));
    });
    backEvent.subscribe((args) {
      widget.onBack(Offset(dwtpProvider.cursors[widget.index].item1 as double,
          dwtpProvider.cursors[widget.index].item2 as double));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
