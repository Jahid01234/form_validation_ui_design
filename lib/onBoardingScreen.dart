import 'package:flutter/material.dart';
import 'package:form_validation_ui_design/HomePage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        // The 1st PageView
        PageViewModel(
          decoration: PageDecoration(
             pageColor: Colors.white,
            //fullScreen: true,
            //bodyFlex: 2,
            //footerFit: FlexFit.loose
          ),
          image: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
                "assets/onboardingimage3.gif",
            ),
          ),
          titleWidget: Padding(
            padding: EdgeInsets.only(top: 30,left: 20,right: 20),
            child: Text(" Flutter App Developer",
            style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          bodyWidget: Padding(
              padding: EdgeInsets.only(top: 10,left: 5,right: 5),
               child: Text(
                   "Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.",
                 textAlign: TextAlign.justify,
                 style: TextStyle(color: Colors.cyan),
                ),
        ),
        ),


        // The 2nd PageView
        PageViewModel(
          decoration: PageDecoration(

          ),
          image: Padding(
            padding: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/onboardingimage3.gif",
              ),
            ),
          ),
          titleWidget: Padding(
            padding: EdgeInsets.only(top: 30,left: 20,right: 20),
            child:  Text(" Transform your workflow",
                 style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          bodyWidget: Padding(
            padding: EdgeInsets.only(top: 10,left: 5,right: 5),
            child: Text(
                    "It implements Flutter core libraries that include animation and graphics, file and network I/O,"
                    " plugin architecture, accessibility support, and a dart runtime for developing, compiling, "
                    "and running Flutter applications.It takes Google's open-source graphics library, Skia, to render low-level graphics.",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.lightGreen),
            ),
          ),
        ),




        // The 3rd PageView
        PageViewModel(
          decoration: PageDecoration(

          ),
          image: Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Image.asset(
                "assets/cs.png",
              ),
            ),
          ),
          titleWidget: Padding(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            child:  Text(" Let's Development App",
              style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          bodyWidget: Padding(
            padding: EdgeInsets.only(top: 10,left: 5,right: 5),
            child: Text(
              "For example, say you're using a Windows laptop to develop a Flutter app. If you choose Android as your development target, you typically attach an Android device to your Windows laptop with a USB cable, and your app-in-development runs on that attached Android device.Oct 24, 2023",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
        ),
      ],


      skip: Text("Skip"),
      showSkipButton: true,
      next: Text("Next"),
      done: Text ("Done"),
      onDone: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      },

    );
  }
}
