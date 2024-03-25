import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation_ui_design/LoginPage.dart';
import 'package:form_validation_ui_design/RegistrationPage.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [
               Color(0xffB81736),
               Color(0xff2B1836),
             ]
           )
          ),
          child:  Column(
            children: [
              SizedBox(height: 100,),
              AnimatedTextKit(
                animatedTexts: [
                  // Start ColorizeAnimatedText Animation
                  ColorizeAnimatedText('W E L C O M E',
                      textStyle: TextStyle(fontSize: 40),
                      speed: Duration(milliseconds: 1000),
                      colors: [
                        Colors.teal,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                      ]
                  ),
                ],
                repeatForever: true,
                displayFullTextOnTap: true,
                stopPauseOnTap: false,
              ),
        
              SizedBox(height: 190,),
              Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 30),),
        
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                child: Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.orange.withAlpha(80),
                    borderRadius: BorderRadius.circular(10),
                    border:  Border.all(color: Colors.deepPurpleAccent)
                  ),
                  child: Center(child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                ),
              ),
        
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
                },
                child: Container(
                  height:50 ,
                  width: 320,
        
                  decoration: BoxDecoration(
                    color: Colors.red.withAlpha(100),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('SIGN UP',style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),),
        
                ),
              ),
        
              SizedBox(height: 70),
              Text('Login with Social Media',style: TextStyle
                (
                fontSize: 17,
                color: Colors.white,
              ),
              ),
        
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Logo(Logos.facebook_logo),
                  Logo(Logos.instagram),
                  Logo(Logos.twitter),
                  Logo(Logos.chrome),
                ],
              )
        
            ],
          ),
        ),
      ),
    );
  }
}
