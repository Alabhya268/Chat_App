import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Animation/FadeAnimation.dart';

class pagedecorationcontainer extends StatelessWidget {
  const pagedecorationcontainer({@required this.title
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.fill)),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 30,
            width: 80,
            height: 200,
            child: FadeAnimation(
                1,
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/light-1.png'))),
                )),
          ),
          Positioned(
            left: 140,
            width: 80,
            height: 150,
            child: FadeAnimation(
                1.3,
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/light-2.png'))),
                )),
          ),
          Positioned(
            right: 40,
            top: 40,
            width: 80,
            height: 150,
            child: FadeAnimation(
                1.5,
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/clock.png'))),
                )),
          ),
          Positioned(
            child: FadeAnimation(
                1.6,
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
