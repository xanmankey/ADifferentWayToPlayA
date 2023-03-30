// For handling repetitive text

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? numLines;
  const TextWidget({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontFamily = "Kaushan",
    this.fontSize = 60,
    this.textAlign = TextAlign.center,
    this.numLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    // Use FittedBox + BoxFit.scaleDown for dynamically scalable text
    // Alternatively, you can use the AutoSizeText package
    return AutoSizeText(
      text,
      maxLines: numLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
