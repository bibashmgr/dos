// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// screens
import 'package:client/screens/starting_screen/login.dart';
import 'package:client/screens/starting_screen/register.dart';

// constants
import 'package:client/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  void getToken() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
          toolbarHeight: 0.0,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: kLightColor,
          )),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(
            horizontal: 45.0,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 300,
                height: 300,
                child: Image(
                  image: AssetImage(
                    'assets/intro.jpg',
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Organize your day",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28.0,
                  color: kDarkColor,
                ),
              ),
              const Text(
                "with Ease",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28.0,
                  color: kDarkColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "A tool that allows everyday users to manage their to-do lists in the most efficient manner.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: kDarkColor,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Register.routeName);
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(kDarkColor),
                      fixedSize: MaterialStatePropertyAll<Size>(
                        Size(135, 50),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        color: kLightColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Login.routeName);
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(kDarkColor),
                      fixedSize: MaterialStatePropertyAll<Size>(
                        Size(135, 50),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        color: kLightColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
