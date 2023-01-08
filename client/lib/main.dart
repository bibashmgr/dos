import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// screens
import 'package:client/screens/main_screen/main.dart';
import 'package:client/screens/starting_screen/starting.dart';
import 'package:client/screens/starting_screen/register.dart';
import 'package:client/screens/starting_screen/login.dart';
import 'package:client/screens/main_screen/sub_screen/view_project.dart';

// providers
import 'package:client/providers/user_provider.dart';
import 'package:client/providers/project_provider.dart';
import 'package:client/providers/task_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ProjectProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoaded = false;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null || prefs.getString('token')!.isEmpty) {
      setState(() {
        isLogin = false;
        isLoaded = true;
      });
    } else {
      setState(() {
        isLogin = true;
        isLoaded = true;
      });
    }
  }

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
      home: Visibility(
        visible: isLoaded,
        replacement: const Scaffold(
            body: Center(
          child: CircularProgressIndicator(
            color: kDarkColor,
          ),
        )),
        child: isLogin ? const MainScreen() : const StartingScreen(),
      ),
    );
  }
}
