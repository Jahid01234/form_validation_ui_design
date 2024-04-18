import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_validation_ui_design/onBoardingScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}


class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>onBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrange.withOpacity(0.4),
            Colors.redAccent.withOpacity(0.5),
            Colors.pinkAccent.withOpacity(0.5)
          ],
        )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
                child: Image.asset(
                    "assets/gid.gif",
                    height: 140,
                    width: 130,
                  fit: BoxFit.fill,
                ),
            ),

           const SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: LinearProgressIndicator(
                backgroundColor: Colors.cyan,
                color: Colors.white,
                minHeight: 10,
              ),
            )
          ],
        ),
      ),

    );
  }
}
