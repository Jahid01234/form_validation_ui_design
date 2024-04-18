import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation_ui_design/LoginPage.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  bool _obscureText1 = true;
  bool _obscureText2 = true;

  TextEditingController  _fullNameController = TextEditingController();
  TextEditingController  _emailController = TextEditingController();
  TextEditingController  _passwordController = TextEditingController();
  TextEditingController  _confirmPassController = TextEditingController();

  final _userkey = GlobalKey<FormState>();

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
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Color(0xffB81736),
                   Color(0xff2B1836),
                ]
               )
              ),
        
              child: Padding(
                padding: const EdgeInsets.only(top: 60,left: 22),
                child: Text("Create Your\n              Account",style: TextStyle
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
                    color:  Colors.grey[300],
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
                            /*TextFormField(
                              controller: _fullNameController,
                              validator: (value){
                                if(value== null || value!.isEmpty){
                                  return "Please enter  name";
                                }
                                else if(value.length>20){
                                  return " please enter 20 Character";
                                }
                              },
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: "Enter Your Name",
                                hintStyle: TextStyle(color: Colors.blue),
                                labelText: "Name",
                                labelStyle: TextStyle(fontSize: 20,color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                enabledBorder:OutlineInputBorder(
                                    borderSide:BorderSide(color: Colors.red)
                                ),

                                focusedBorder: OutlineInputBorder(
                                    borderSide:BorderSide(color: Colors.deepOrangeAccent,width: 2)
                                ),
                                prefixIcon: Icon(Icons.person,color: Colors.cyan,),
                              ),

                            ),
                            */

                          // 1st Name part
                            SizedBox(height: 30,),
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
                                    controller: _fullNameController,
                                    validator: (value){
                                      if(value== null || value!.isEmpty){
                                        return "Please enter  name";
                                      }
                                      else if(value.length>20){
                                        return " please enter 20 Character";
                                      }
                                    },
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Name",
                                      hintStyle: TextStyle(color: Colors.blue),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.person,color: Colors.cyan,),
                                    ),

                                  ),
                                ),
                              ),
                            ),


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


                            // 4th Confirm Password part
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
                                    controller: _confirmPassController,
                                    obscureText: _obscureText2,//for visibility off
                                    validator: (value){
                                      if(value==null || value!.isEmpty){
                                        return "Please enter confirm password";
                                      }
                                      else if(value.length<=8){
                                        return " please enter 8 character";
                                      }
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                        hintText: "Enter Your Confirm Password",
                                        hintStyle: TextStyle(color: Colors.blue),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.lock,color: Colors.cyan,),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText2?Icons.visibility:Icons.visibility_off,
                                            color: Colors.cyan,
                                          ),
                                          onPressed: (){
                                            setState(() {
                                              _obscureText2 = !_obscureText2;
                                            });
                                          },

                                        )
                                    ),

                                  ),
                                ),
                              ),
                            ),


                            // 5th Sign Up Button
                            SizedBox(height: 60,),
                            GestureDetector(
                              onTap: (){
                                 if (_userkey.currentState!.validate()) {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
                                child: Center(child: Text('SIGN UP',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.bold
                                  ),

                                ),),

                              ),
                            ),



                            // Then text in side...........
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?",style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold
                                ),
                                ),

                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                },
                                    child: Text("Sign In",style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
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
