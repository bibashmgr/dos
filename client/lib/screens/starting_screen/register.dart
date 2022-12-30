import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// constants
import 'package:client/utils/constants.dart';

// screens
import 'package:client/screens/starting_screen/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  static const routeName = '/auth/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kLightColor,
        iconTheme: const IconThemeData(
          color: kDarkColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 15.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                "Create an account",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28.0,
                  color: kDarkColor,
                ),
              ),
              const Text(
                "Welcome to Dos!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                  color: kDarkColor,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: FaIcon(
                      isPasswordVisible
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      size: 18.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      color: kDarkColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, Login.routeName);
                    },
                    child: const Text(
                      "Login now",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                        color: kDarkColor,
                      ),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(kDarkColor),
                  fixedSize: MaterialStatePropertyAll<Size>(
                      Size(double.maxFinite, 50)),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
