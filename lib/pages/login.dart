import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'globals.dart';

// Widgets
import '../widgets/round_button.dart';
import '../widgets/login_fields.dart';

// Firebase
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Zorgt dat je geen overflow widget krijgt bij openen van keyboard.
        resizeToAvoidBottomInset: false,
        backgroundColor: Globals.background,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/gymigo_logo_final.png',
                  width: 85,
                ),
                const SizedBox(height: 50),
                SignUp(
                    emailController: emailController,
                    passwordController: passwordController),
                Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      RoundButton(
                          bgColor: Globals.purple,
                          title: 'Sign Up',
                          pressed: () {
                            if (_key.currentState!.validate()) {
                              try {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )
                                    .then((res) =>
                                        Navigator.pushNamed(context, '/home'));
                              } on FirebaseAuthException catch (err) {
                                print(err.toString());
                              }
                            }
                            setState(() {});
                          }),
                      const SizedBox(height: 30),
                      RoundButton(
                          bgColor: Globals.background,
                          title: 'Sign In',
                          pressed: () {
                            try {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  )
                                  .then((res) =>
                                      Navigator.pushNamed(context, '/home'));
                              // .then((res) => FirebaseFirestore.instance())
                              errorMessage = "";
                            } on FirebaseAuthException catch (err) {
                              print("firebaseauth: ${err.message}");
                            } on PlatformException catch (err) {
                              print("platforexeption: $err");
                            }
                            setState(() {});
                          }),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
              ],
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool selected = false;

  SignUp({Key? key, required this.emailController, required this.passwordController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/Vector_4.png", scale: 0.5),
        Positioned(
          top: 120,
          bottom: 0,
          left: 50,
          right: 50,
          child: NewInput(
            controller: emailController,
            placeholder: 'Enter Your Email',
            validate: validateEmail,
          ),
        ),
        Positioned(
          top: 200,
          bottom: 0,
          left: 50,
          right: 50,
          child: NewInput(
            controller: passwordController,
            obscure: true,
            placeholder: 'Enter Your Password',
            validate: validatePassword,
          ),
        ),
      ],
    );
  }
}

// -- In progress --

// Form Validation
String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail adress is required';
  } else {
    return null;
  }
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return "Password Is Required";
  }
  return null;
}
