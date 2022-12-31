import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// constants
import 'package:client/utils/constants.dart';

// screens
import 'package:client/screens/starting_screen/register.dart';

// helpers
import 'package:client/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static const routeName = '/auth/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  bool isEmailValid(val) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(val);
  }

  String email = '';
  String password = '';

  AuthService authService = AuthService();

  void loginUser() async {
    await authService.login(
      '/auth/login',
      {
        'email': email,
        'password': password,
      },
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kLightColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: kLightColor,
        ),
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  "Let's Sign you in.",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 28.0,
                    color: kDarkColor,
                  ),
                ),
                const Text(
                  "Welcome back!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                    color: kDarkColor,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) => setState(() {
                    email = newValue!;
                  }),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (!isEmailValid(value)) {
                      return 'Invalid Email';
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !isPasswordVisible,
                  onSaved: (newValue) => setState(() {
                    password = newValue!;
                  }),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else if (value.length < 6) {
                      return 'Password must be 6 characters long';
                    }
                    return null;
                  },
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
                      "Don't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        color: kDarkColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, Register.routeName);
                      },
                      child: const Text(
                        "Register now",
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      loginUser();
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(kDarkColor),
                    fixedSize: MaterialStatePropertyAll<Size>(
                      Size(double.maxFinite, 50),
                    ),
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
      ),
    );
  }
}
