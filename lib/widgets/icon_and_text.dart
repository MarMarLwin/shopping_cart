import 'package:flutter/material.dart';
import 'package:user_stories/widgets/small_text.dart';

import '../utils/dimensions.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimension.dimen20,
        ),
        SizedBox(
          width: Dimension.dimen10 / 2,
        ),
        SmallText(text: text)
      ],
    );
  }
}
