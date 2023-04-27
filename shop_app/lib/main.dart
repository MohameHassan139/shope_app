import 'package:flutter/material.dart';
import 'package:shop_app/on_poarding/onboarding_screen.dart';
import 'package:shop_app/shared/themes/light_mode.dart';
import 'package:get/get.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: lightThem(),
      home: OnBoardingScreen(),
    );
  }
}
