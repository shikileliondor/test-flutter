import 'package:flutter/material.dart';

import 'screens/metiers_list_screen.dart';

void main() {
  runApp(const MetiersApp());
}

class MetiersApp extends StatelessWidget {
  const MetiersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Métiers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MetiersListScreen(),
    );
  }
}
