import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation_ui_design/RegistrationPage.dart';
import 'package:form_validation_ui_design/WelcomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

  bool _obscureText1 = true;


  TextEditingController  _emailController = TextEditingController();
  TextEditingController  _passwordController = TextEditingController();


  final _userkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
                padding: const EdgeInsets.only(top: 60,left: 22),
                child: Text("Hello\n       Sign In",style: TextStyle
                  (
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                  ,),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
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

                              SizedBox(height: 50),

                              // 2nd gmail part
                              SizedBox(height: 20),
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

                                      BoxShadow(
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
                                      decoration: InputDecoration(
                                        hintText: "Enter Your Gmail",
                                        hintStyle: TextStyle(color: Colors.blue),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.person,color: Colors.cyan,),
                                      ),

                                    ),
                                  ),
                                ),
                              ),


                              // 3rd Password part
                              SizedBox(height: 20),
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

                                      BoxShadow(
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


                              SizedBox(height: 18),
                              InkWell(
                                onTap: (){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Forget password")));
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('Forget Password?',style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xffB81736),
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ),


                              SizedBox(height: 70,),
                              GestureDetector(
                                onTap: (){
                                  if (_userkey.currentState!.validate()) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
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

                                        BoxShadow(
                                            color: Colors.white,
                                            spreadRadius: 1,
                                            blurRadius: 15,
                                            offset: Offset(-4,-4)
                                        )
                                      ]
                                  ),
                                  child: Center(child: Text('SIGN IN',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold
                                    ),

                                  ),),

                                ),
                              ),

                              // Then text in side...........
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?",style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                  ),
                                  ),

                                  TextButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                  },
                                    child: Text("Sign Up",style: TextStyle(
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

