import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validation_ui_design/Custom_design/showDialog_message.dart';
import 'package:form_validation_ui_design/RegistrationPage.dart';
import 'package:form_validation_ui_design/WelcomePage.dart';
import 'package:form_validation_ui_design/forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

  bool _obscureText1 = true;


  final TextEditingController   _emailController = TextEditingController();
  final TextEditingController  _passwordController = TextEditingController();


  final _userkey = GlobalKey<FormState>();

  // Firebase Login method
  void loginUser() async{
    // 1st part
    // show loading circle
    showDialog(
        context: context,
        builder: (context){
          return const Center(child: CircularProgressIndicator());
        }
    );

    // 2nd part
    // try sign In
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);

      // pop loading circle
      Navigator.pop(context);

      // show success message to user
      displayMessageToUser("LogIn successful!", context);

      // Delay dismissing the dialog for 2 seconds
      Timer(const Duration(seconds: 2), () {
        Navigator.pop(context); // Dismiss the success dialog
       // if (context.mounted) Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));// Navigate to login page
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
      });

    } on FirebaseAuthException catch(e){
      // pop loading circle
      Navigator.pop(context);

      //show error message to user
      displayMessageToUser(e.code, context);

      // Delay dismissing the dialog for 3 seconds
      Timer(const Duration(seconds: 2), () {
        Navigator.pop(context); // Dismiss the error dialog
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 1st stack part
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xffB81736),
                        Color(0xff2B1836),
                      ]
                  )
              ),
        
              child:const Padding(
                padding:  EdgeInsets.only(top: 60,left: 22),
                child: Text("Hello\n       Sign In",style: TextStyle
                  (
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                  ,),
                ),
              ),
            ),


            // 2nd stack part
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                    )
                ),
        
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: _userkey,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [

                             const SizedBox(height: 50),

                              // 2nd gmail part
                              const SizedBox(height: 20),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow:[
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          spreadRadius: 2,
                                          blurRadius: 15,
                                          offset: Offset(4,4)
                                      ),

                                     const BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 1,
                                          blurRadius: 15,
                                          offset: Offset(-4,-4)
                                      )
                                    ]
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Center(
                                    child: TextFormField(
                                      controller: _emailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Your Gmail",
                                        hintStyle: TextStyle(color: Colors.blue),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.email,color: Colors.cyan,),
                                      ),

                                    ),
                                  ),
                                ),
                              ),


                              // 3rd Password part
                              const SizedBox(height: 20),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow:[
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          spreadRadius: 2,
                                          blurRadius: 15,
                                          offset: Offset(4,4)
                                      ),

                                      const BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 1,
                                          blurRadius: 15,
                                          offset: Offset(-4,-4)
                                      )
                                    ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Center(
                                    child: TextFormField(
                                      obscureText: _obscureText1,
                                      controller: _passwordController,
                                      validator: (value){
                                        if(value==null || value!.isEmpty){
                                          return "Please enter password";
                                        }
                                        else if(value.length<=8){
                                          return " please enter 8 character";
                                        }
                                      },
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                          hintText: "Enter Your Password",
                                          hintStyle: TextStyle(color: Colors.blue),
                                          border: InputBorder.none,
                                          prefixIcon: Icon(Icons.lock,color: Colors.cyan,),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _obscureText1?Icons.visibility:Icons.visibility_off,
                                              color: Colors.cyan,
                                            ),
                                            onPressed: (){
                                              setState(() {
                                                _obscureText1 = !_obscureText1;
                                              });
                                            },

                                          )
                                      ),

                                    ),
                                  ),
                                ),
                              ),


                              const SizedBox(height: 18),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                                },
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('Forget Password?',style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xffB81736),
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ),


                              const SizedBox(height: 70,),
                              GestureDetector(
                                onTap: (){
                                  if (_userkey.currentState!.validate()) {
                                    loginUser();
                                  }
                                },
                                child: Container(
                                  height: 55,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(30),
                                      boxShadow:[
                                        BoxShadow(
                                            color: Colors.grey.shade500,
                                            spreadRadius: 2,
                                            blurRadius: 15,
                                            offset: Offset(4,4)
                                        ),

                                        const BoxShadow(
                                            color: Colors.white,
                                            spreadRadius: 1,
                                            blurRadius: 15,
                                            offset: Offset(-4,-4)
                                        )
                                      ]
                                  ),
                                  child: const Center(child: Text('SIGN IN',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold
                                    ),

                                  ),),

                                ),
                              ),

                              // Then text in side...........
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                 const  Text("Don't have an account?",style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                  ),
                                  ),

                                  TextButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                  },
                                    child:const Text("Sign Up",style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  )


                                ],
                              )




                            ],

                          ),
                        ),
        
                      ),
                    )
                ),
        
              ),
            )
        
        
        
          ],
        
        ),
      ),
    );
  }
}

