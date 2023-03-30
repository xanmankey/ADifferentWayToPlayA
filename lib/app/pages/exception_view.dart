import 'dart:io';

import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';
import 'package:adifferentwaytoplay/app/utils/constants.dart';

/// A screen for notifying and handling exceptions
/// ```
/// class ExceptionWidget extends StatelessWidget {
///   String? stacktrace;
///   String error;
///   ExceptionWidget({super.key, required this.error, this.stacktrace});
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       appBar: const CustomAppBar(),
///       body: Column(
///         children: [
///           const TextWidget(
///             text: "Sorry, that's an error!",
///           ),
///           SizedBox(
///               height: 350,
///               child:
///                   Image(image: FileImage(File('assets/images/exception.jpg')))),
///           TextWidget(
///             text: (stacktrace != null)
///                 ? 'Error: $error, Stacktrace: $stacktrace'
///                 : "Error: $error",
///           ),
///         ],
///       ),
///     );
///   }
/// }
/// ```
///
class ExceptionWidget extends StatelessWidget {
  String? stacktrace;
  String error;
  ExceptionWidget({super.key, required this.error, this.stacktrace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const TextWidget(
            text: "Sorry, that's an error!",
          ),
          SizedBox(
              height: 350,
              child:
                  Image(image: FileImage(File('assets/images/exception.jpg')))),
          TextWidget(
            text: (stacktrace != null)
                ? 'Error: $error, Stacktrace: $stacktrace'
                : "Error: $error",
          ),
        ],
      ),
    );
  }
}
