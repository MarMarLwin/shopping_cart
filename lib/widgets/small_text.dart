import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final TextOverflow overflow;
  double size;
  double height;
  SmallText({Key? key,this.color=const Color(0xFF4E4E4E),required this.text,this.size=14,this.height=1.2,this.overflow=TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: size,color: color,height: height),overflow: overflow,);
  }
}
