import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_page.dart';
import '../../../core/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
    () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainPage())));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themecolors.background ?? const Color.fromARGB(255, 9, 19, 33),
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:Themecolors.background ?? const Color.fromARGB(255, 9, 19, 33),
            statusBarIconBrightness: Themecolors.enumcolor??Brightness.light),
      ),
      backgroundColor: Themecolors.background??const Color.fromARGB(255, 9, 19, 33),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 1,child: SizedBox()),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: SizedBox(
                    width: 150.w,
                    child: Image.asset(
                      'lib/assets/images/icon.png',
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text('Musician',
                style: TextStyle(
                  color: Themecolors.font??Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 23.sp
                ),
                )
              ],
            ),
          ),
          const Expanded(flex: 1,child: SizedBox()),
        ],
      )),
    );
  }
}