import 'package:flutter/material.dart';
import 'package:user_stories/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ExpandableText extends StatefulWidget {
  final String text;
   final double? size;


  const ExpandableText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimension.dimen120;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {

      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {

      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf,size: widget.size!,overflow: TextOverflow.visible)
          : Column(
              children: [
                SmallText(
                    text: hiddenText
                        ? firstHalf + '...'
                        : firstHalf + secondHalf,overflow: TextOverflow.visible,size: widget.size!),
                InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: hiddenText ? 'Show more' : 'Show less',
                          color: primaryColor,size: widget.size!
                        ),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: primaryColor,
                          size: Dimension.dimen20,
                        )
                      ],
                    ))
              ],
            ),
    );
  }
}
