import 'package:flutter/material.dart';
import 'package:shop_app/on_poarding/onboarding_screen.dart';
import 'package:shop_app/shared/themes/light_mode.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode:ThemeMode.light ,
      theme: lightThem(),
      
      home:  OnBoardingScreen(),
    );
  }
}