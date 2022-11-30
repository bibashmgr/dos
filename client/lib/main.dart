import 'package:flutter/material.dart';

// screens
import 'package:client/screens/main_screen/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dos',
      home: MainScreen(),
    );
  }
}
