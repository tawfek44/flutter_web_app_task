import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  final String text;
  double? fontSize = 10.sp;
  final int? maxLines;
  final FontWeight fontWeight;
  Color color = Colors.black;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? height;
  final List<Shadow>? shadowList;

  AppText({
    Key? key,
    required this.text,
    this.maxLines,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign,
    this.decoration,
    this.height,
    this.shadowList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: TextOverflow.ellipsis,
        decoration: decoration,
        decorationColor: Colors.black,
        shadows: shadowList
        //  fontFamily: isArabicLocalization() ? 'Tajawal' : 'Gilroy',
      ),
      maxLines: maxLines ?? 1,

      //  textDirection:
      // isArabicLocalization() ? TextDirection.rtl : TextDirection.ltr,
    );
  }
}
