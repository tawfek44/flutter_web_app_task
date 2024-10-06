import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/featrues/home_screen/presentation/home_screen_mobile.dart';

import 'featrues/home_screen/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constrains){
        if(constrains.maxWidth < 768){
          return const ScreenUtilInit(
           designSize: Size(360, 740),

            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeScreenMobile(),
            ),
          );
        }
        else {
          return ScreenUtilInit(
            designSize: const Size(1440, 1024),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreenWeb(),
          ),
        );
        }
      },
    );
  }
}
