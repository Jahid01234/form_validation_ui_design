import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation_ui_design/RegistrationPage.dart';
import 'Custom_design/showDialog_message.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  bool clearButton = false;
  final TextEditingController  _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // // FireBase Forget Password Method
  // Future<void> resetPassword() async{
  //   // 1st part
  //   // show loading circle
  //   showDialog(
  //       context: context,
  //       builder: (context){
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //   );
  //
  //   // 2nd part
  //   // Check if user exists with provided email
  //   try {
  //     final user = await FirebaseAuth.instance.fetchSignInMethodsForEmail( _emailController.text.trim());
  //     if (user.isEmpty) {
  //       // pop loading circle
  //       Navigator.pop(context);
  //       // Show error message to user
  //       displayMessageToUser("No user found with this email address", context);
  //       return;
  //     }
  //   } catch (e) {
  //     // pop loading circle
  //     Navigator.pop(context);
  //     // Show error message to user
  //     displayMessageToUser("An error occurred", context);
  //     return;
  //   }
  //
  //   // 3rd part
  //   // try sending reset password email
  //   try{
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email:  _emailController.text.trim());
  //
  //     // pop loading circle
  //     Navigator.pop(context);
  //
  //     // Show success message to user
  //     displayMessageToUser("Password reset email sent successfully!", context);
  //
  //   } on FirebaseAuthException catch(e){
  //     // pop loading circle
  //     Navigator.pop(context);
  //
  //     // Show error message to user
  //     displayMessageToUser(e.message ?? 'An error occurred', context);
  //   }
  // }
  //




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text("Forget Password", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

              const SizedBox(height: 50),
              const Text(
                "Please enter your email address. You will receive a link to create or set a new password via email.",
                style: TextStyle(fontSize: 15),
              ),

              const SizedBox(height: 50),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller:  _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    if (value != "") {
                      setState(() {
                        clearButton = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _emailController.clear();
                        });
                      },
                      child: Icon(CupertinoIcons.multiply, color: Colors.black),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              ElevatedButton(
                onPressed: () async{
                   if (_formKey.currentState!.validate()) {
                     // resetPassword();
                     FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.toString()).then((value) {
                       return displayMessageToUser("Sent Successful", context);
                     });

                   }
                 },
                child:  Text(
                  "Send Email",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDB3022),
                  minimumSize: const Size.fromHeight(55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                ),
              ),




              const  SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontSize: 16.0, color: Colors.teal),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()));
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


