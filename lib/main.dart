import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const ParcoursApp());
}

class ParcoursApp extends StatelessWidget {
  const ParcoursApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcours',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4464E0),
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
