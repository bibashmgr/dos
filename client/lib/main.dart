import 'package:flutter/material.dart';

// screens
import 'package:client/screens/main_screen/main.dart';
import 'package:client/screens/main_screen/sub_screen/view_project.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dos',
      initialRoute: '/',
      theme: ThemeData(
        fontFamily: "OpenSans",
      ),
      routes: {
        ViewProject.routeName: (context) => const ViewProject(),
      },
      home: const MainScreen(),
    );
  }
}
