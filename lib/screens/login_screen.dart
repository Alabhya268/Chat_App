import 'package:flash_chat/Animation/FadeAnimation.dart';
import '../decorations/fadeanimationbutton.dart';
import 'package:flutter/material.dart';
import '../decorations/pagedecorationcontainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;
   String email;
   String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showspinner,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  pagedecorationcontainer(title: 'Login',),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.8,
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextField(
                                      onChanged: (value){
                                        email = value;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email or Phone number",
                                          hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      onChanged: (value){
                                        password = value;
                                      },
                                      obscureText: true,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        fadeanimationbutton(
                          title: 'Login',
                          function: () async{
                            setState(() {
                              showspinner = true;
                            });
                            try{
                              final user =await _auth.signInWithEmailAndPassword(email: email, password: password);
                              if(user != null)
                              {
                                Navigator.pushNamed(context, ChatScreen.id);
                              }
                              setState(() {
                                showspinner = false;
                              });
                            }
                            catch(e)
                            {
                              print(e);
                            }
                          },
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        FadeAnimation(
                            1.5,
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

