import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'ocr_screen.dart';
import 'reusableWidgets/create_material_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sign Language Translator',
        theme: ThemeData(
          primarySwatch: createMaterialColor(const Color(0xFF00B0FF)),
          // accentColor: const Color(0xFF00B0FF),
          fontFamily: 'ProductSans',
        ),
        // home: const HomeScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/ocr': (context) => const OcrScreen(),
        });
  }
}
