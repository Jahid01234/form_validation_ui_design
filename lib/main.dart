import 'package:flutter/material.dart';
import 'package:form_validation_ui_design/HomePage.dart';
import 'package:form_validation_ui_design/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation Ui Design',
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}

