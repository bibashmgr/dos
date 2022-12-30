import 'package:flutter/material.dart';

// screens
import 'package:client/screens/main_screen/main.dart';
import 'package:client/screens/starting_screen/starting.dart';
import 'package:client/screens/starting_screen/register.dart';
import 'package:client/screens/starting_screen/login.dart';
import 'package:client/screens/main_screen/sub_screen/view_project.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool isLogin = false;

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
        Register.routeName: (context) => const Register(),
        Login.routeName: (context) => const Login(),
      },
      home: isLogin ? const MainScreen() : const StartingScreen(),
    );
  }
}
