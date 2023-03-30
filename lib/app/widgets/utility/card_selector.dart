import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:flutter/material.dart';

class CardSelector extends StatelessWidget {
  final FileImage image;
  final String title;
  final Color color;
  final RoundedRectangleBorder? shape;
  final void Function()? onTap;
  final double? padding;
  const CardSelector({
    super.key,
    required this.image,
    required this.title,
    this.color = Colors.white,
    this.shape,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: shape,
        color: color,
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextWidget(text: title),
          (padding != null)
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: padding!, vertical: 0),
                )
              : const Padding(padding: EdgeInsets.zero),
          Image(
            image: image,
          ),
        ]),
      ),
    );
  }
}
