import 'package:flutter/material.dart';
import 'package:shop_app/on_poarding/onboarding_screen.dart';
import 'package:shop_app/shared/bloc_observes.dart';
import 'package:shop_app/shared/themes/light_mode.dart';
import 'package:bloc/bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: lightThem(),
      home: OnBoardingScreen(),
    );
  }
}
