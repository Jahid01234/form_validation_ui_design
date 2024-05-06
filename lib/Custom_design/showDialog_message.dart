import 'package:flutter/material.dart';

void displayMessageToUser(String message, BuildContext context){
  showDialog(
      context: context,
      builder:(context){
        return Dialog(
          child: Container(
            height: 30,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(child: Text(message,style: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),)),
          ),
        );
      }
  );
}