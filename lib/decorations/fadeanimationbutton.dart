import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Animation/FadeAnimation.dart';

class fadeanimationbutton extends StatelessWidget {
  fadeanimationbutton({@required this.title, @required this.function});
  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      2,
      Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, .6),
            ],
          ),
        ),
        child: Center(
          child: MaterialButton(
            onPressed: function,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
