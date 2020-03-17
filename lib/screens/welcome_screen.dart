import 'package:flash_chat/Animation/FadeAnimation.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../decorations/fadeanimationbutton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Image.asset('images/logo.png'),
                  height: 60,
                ),
                Text(
                  'Chat_App',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            fadeanimationbutton(title: 'Login', function: () {
              Navigator.pushNamed(context, LoginScreen.id);
              //Go to registration screen.
            },),
            SizedBox(
              height: 10,
            ),
            fadeanimationbutton(title: 'Register',function: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
              //Go to registration screen.
            },),
          ],
        ),
      ),
    );
  }
}

