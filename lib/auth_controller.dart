//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fruit_order/screens/name.dart';
import 'package:fruit_order/screens/ordering.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_order/screens/log_in.dart';
import 'package:fruit_order/screens/home.dart';

class AuthController extends GetxController{
  //AuthController.instance...
  static AuthController instance = Get.find();
  //email, username, password...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    // our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user==null){
      print('Login page');
      Get.offAll(()=>Homepage());
    }else{
      Get.offAll(()=>Name());
    }
  }
  Future<void> register(String username, email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = userCredential.user!;
      await user.updateProfile(displayName: username);

      // Show success snackbar message
      Get.snackbar(
        'Success',
        'You have been registered successfully!',
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // Show error snackbar message for weak password
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        // Show error snackbar message for email already in use
        Get.snackbar(
          'Error',
          'The account already exists for that email.',
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Show generic error snackbar message
      Get.snackbar(
        'Error',
        'An error occurred while registering. Please try again later.',
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  Future<void> login(String email, password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Show success snackbar message
      Get.snackbar(
        'Success',
        'You have been signed in successfully!',
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

    } on FirebaseAuthException catch (e) {
      Get.snackbar('About Login', 'Login message',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Login failed',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(e.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          )
      );
    }
  }
  Future<void> Passwordreset(String email) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar(
        'Password reset email sent',
        'Successfully',
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      String errorMessage = 'An error occurred while sending the password reset email';
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      }
      Get.snackbar(
        'An error occur',
        errorMessage,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  Future<void> logOut()async{
    await auth.signOut();
  }
}