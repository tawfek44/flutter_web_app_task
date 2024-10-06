import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  //One instance, needs factory
  static AppColors? _instance;
  factory AppColors() => _instance ??= AppColors._();

  AppColors._();

  static final primaryColor = HexColor("FFC268");
  static final dividerColor = HexColor("262626");
  static const validColor = Colors.green;
  static const redColor = Colors.red;
  static const black = Colors.black;
  static const Color textEditFill = Color(0xFFF1F1F1);
  static const seedColor = Color(0xFF0073B1);
  static const greyColor = Colors.grey;
  static const greenColor = Colors.green;
  static var lightGreyColor = Colors.grey[200];
  static var lightGreyColor2 = Colors.grey[300];
  static final lightGreyColorForText = Colors.grey[300];
  static const backgroundColor = Color(0xFFf2f1f6);
  static const backgroundColorTransparent = Color(0xe7e7e7e7);
  static final secondaryColor = HexColor("171717");
  static final itemColor = HexColor("262626");
  static final itemButtonColor = HexColor("C25F30");
  static final itemButtonBorderColor = HexColor("C25F30");
  static const darkGray = Colors.black54;

  static const white = Color(0xFFffffff);
  static  const double cardCornerRadius = 6;
  static  double smallPadding = 8.w;
  static  double midPadding = 10.w;
  static  double bigPadding = 18.w;
  static  double veryBigPadding = 24.w;
}
