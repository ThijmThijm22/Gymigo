import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'globals.dart';

// Widgets
import '../widgets/round_button.dart';
import '../widgets/login_fields.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _offstage = false;
  bool _signOffstage = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.background,
      body: Center(
        child: Column(
          children:  [
            SizedBox(height: 120),

            Text(
              'Gymigo',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            

            SizedBox(height: 100),

            Stack(children: [

              Offstage(
                offstage: _signOffstage,
                  child: Stack(
                    children: [
                      Image.asset("assets/Vector_4.png", scale: 0.5),
                      Positioned(
                        top: 120,
                        bottom: 0,
                        left: 50,
                        right: 50,
                        child: 
                          NewInput(controller: emailController, placeholder: 'Enter Your Email',),
                        ),
                      Positioned(
                        top: 200,
                        bottom: 0,
                        left: 50,
                        right: 50,
                        child: 
                          NewInput(controller: passwordController,obscure: true, placeholder: 'Enter Your Password',),
                        ),
                      // Positioned(
                      //   top: 280,
                      //   bottom: 0,
                      //   left: 50,
                      //   right: 50,
                      //   child: 
                          
                      //   ),
                    ],
                  )
                ),

            Column(
              children: [
              SizedBox(height: 150),
              Offstage(offstage: _offstage, child: RoundButton(bgColor: Globals.purple, title: 'Sign Up', 
                pressed: () {
                  _offstage = true;
                  _signOffstage = false;
                  setState(() {
                    
                  });
                }
              )),

              SizedBox(height: 30),

              Offstage(offstage: _offstage, child: RoundButton(bgColor: Globals.background, title: 'Sign In',
                pressed: () {
                  setState(() {
                    
                  });
                }
              )),
              ],
            )

            ],),
          ],
        ),
      )
      
    );
  }
}

