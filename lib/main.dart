import 'package:flutter/material.dart';
import 'package:music_app/app/configs/themes/app_theme.dart';
import 'package:music_app/app/controller/main.page.controller.dart';
import 'package:music_app/app/view/pages/main.page.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainPageController()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          theme: AppTheme.dark,
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        ),
      ),
    );
  }
}
