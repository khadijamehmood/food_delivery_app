import 'package:flutter/cupertino.dart';


// ignore: must_be_immutable
class BigText extends StatelessWidget {
 final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({Key? key, this.color ,
   required this.text,
   this.size=20,
  this.overflow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
      fontSize: size  ,
        color: color,
        fontWeight: FontWeight.w400
        
      
      ),
    );
  }
}
