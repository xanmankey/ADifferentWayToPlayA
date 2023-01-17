// A screen for handling exceptions
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';
import 'package:adifferentwaytoplay/app/utils/constants.dart';

class Exception extends StatelessWidget {
  const Exception({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          TextWidget(
            text: "Sorry!",
          ),
          SizedBox(
              height: 350,
              child:
                  Image(image: FileImage(File('assets/images/exception.jpg')))),
          TextWidget(
              text: (args.containsKey(error))
                  ? args[error]
                  : """There was an error, but it could not be determined"""),
        ],
      ),
    );
  }
}
