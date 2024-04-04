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
                    color: Colors.white,
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
                        child: Column(
                          children: [
        
                            SizedBox(height: 50),
                            TextFormField(
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
                                labelText: "Gmail",
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
        
        
                            SizedBox(height: 10),
                            TextFormField(
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
                                  labelText: "Password",
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
        
                            SizedBox(height: 10),
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
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                      colors: [
        
                                        Color(0xff2B1836),
                                        Color(0xffB81736),
                                      ]
        
                                  ),
                                ),
                                child: Center(child: Text('SIGN IN',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
        
                                ),),
        
                              ),
                            ),
        
                            // Then text in side...........
                            SizedBox(height: 20),
                            Column(
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
                                      fontSize: 17,
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold
                                  ),),
                                )
        
        
                              ],
                            )
        
        
        
        
                          ],
        
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

