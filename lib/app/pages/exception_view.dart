import 'dart:io';

import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/app/constants.dart';

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
class ExceptionPage extends StatelessWidget {
  String? stacktrace;
  String error;
  ExceptionPage({super.key, required this.error, this.stacktrace});

  @override
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

/// A function for rendering exception widgets
Widget renderException(
  BuildContext context,
  String error,
  String? stacktrace,
) {
  Navigator.of(context).pushNamed(Pages.exception,
      arguments: {"error": error, "stacktrace": stacktrace});
  return Container();
}
