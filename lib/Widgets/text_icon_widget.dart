import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widgets/Small_Text.dart';

class TextAndIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconcolor;
  const TextAndIcon({Key? key, required this.icon,
   required this.text, required this.iconcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       Icon(icon , color: iconcolor),
       SizedBox(width:3),
      SmallText(text: text),
       SizedBox(width:5),
       ]
    );
  }
}
