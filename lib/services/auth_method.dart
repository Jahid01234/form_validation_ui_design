import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validation_ui_design/WelcomePage.dart';
import 'package:form_validation_ui_design/services/database.dart';
import 'package:google_sign_in/google_sign_in.dart';


// Google SignIn part
class AuthMethods{
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async{
    return await auth.currentUser;
  }

  // sign In with google method
  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // begin interactive sign in process
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    // obtain auth details from request
    final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;

    // create a new credential for user
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken
    );

    // lets finally google sign in
    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    // store Google Sign Result in userDetails
    User? userDetails = result.user;


    // if the correctly google Signin, then we store the google sign in info in the firestore database
    if(result!= null){
      Map<String, dynamic> userInfoMap ={
        "email" : userDetails!.email,
        "name"  : userDetails.displayName,
        "imageUrl" : userDetails.photoURL,
        "id"     : userDetails.uid
      };

      await DatabaseMethod().addUser(userDetails.uid, userInfoMap).then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
      });
    }



  }
}