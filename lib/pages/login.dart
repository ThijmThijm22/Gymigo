import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'globals.dart';

// Widgets
import '../widgets/round_button.dart';
import '../widgets/login_fields.dart';

// Firebase
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      // Zorgt dat je geen overflow widget krijgt bij openen van keyboard.
      resizeToAvoidBottomInset: false,

      backgroundColor: Globals.background,
      body: Center(
        child:  Column(
          children:  [
            SizedBox(height: 120),

            SignUp(emailController: emailController, passwordController: passwordController),


            Form(
              key: _key,
              child: Column(
                children: [
                SizedBox(height: 50),
                RoundButton(bgColor: Globals.purple, title: 'Sign Up', 
                  pressed: () {
                    try {
                       FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      ).then((res) => Navigator.pushNamed(context, '/home'));
                    } on FirebaseAuthException catch (err) {
                      AlertDialog(
                        title: Text(err.toString()),
                      );
                      print(err);
                    }
                  }
                ),
            
                SizedBox(height: 30),
            
                RoundButton(bgColor: Globals.background, title: 'Sign In',
                  pressed: () {
                    try {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      Navigator.pushNamed(context, '/home');
                    } on FirebaseAuthException catch (err) {
                      print(err);
                    }
                  }
                ),
                ],
              ),
            ),
            Padding(
             padding: EdgeInsets.only(
             bottom: MediaQuery.of(context).viewInsets.bottom)),
          ],

          
        ),
      )
    
    );
  }
}

class SignUp extends StatelessWidget {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool selected = false;

  SignUp({required this.emailController, required this.passwordController});

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
          child: 
            NewInput(controller: emailController, placeholder: 'Enter Your Email'),
          ),
        Positioned(
          top: 200,
          bottom: 0,
          left: 50,
          right: 50,
          child: 
            NewInput(controller: passwordController,obscure: true, placeholder: 'Enter Your Password',),
          ),
      ],
      );
  }
}

// Form Validation
String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail adress is required';
  }

  return null;
}