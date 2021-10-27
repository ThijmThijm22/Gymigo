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
  const Login({ Key? key }) : super(key: key);


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
                    if(_key.currentState!.validate()) {
                      try {
                       FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      ).catchError((error) {
                        print(error);
                      }).then((res) => Navigator.pushNamed(context, '/home'));
                    } on PlatformException catch (err) {
                      print(err);
                    }on FirebaseAuthException catch (err) {
                      print(err);
                    }catch(err) {
                      print(err);
                    }
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
                      ).catchError((error) {
                        print(error);
                      }).then((res) => Navigator.pushNamed(context, '/home'));
                      errorMessage = "";
                    } on FirebaseAuthException catch (err) {
                      errorMessage = err.message!;
                    }
                  }
                ),

                Text(errorMessage),
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
            NewInput(controller: emailController, placeholder: 'Enter Your Email', validate: validateEmail,),
          ),
        Positioned(
          top: 200,
          bottom: 0,
          left: 50,
          right: 50,
          child: 
            NewInput(controller: passwordController,obscure: true, placeholder: 'Enter Your Password', validate: validatePassword,),
          ),
      ],
      );
  }
}

// Form Validation
String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail adress is required';
  }else {
    return null;
  }

}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return "Password Is Required";
  }
  return null;
}