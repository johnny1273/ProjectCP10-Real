import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project10_real/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get StreamAuthStatus =>
      FirebaseAuth.instance.authStateChanges();

  void login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user!.emailVerified) {
        await (userCredential.user!.uid);
        Get.snackbar('Success', 'User logged in successfully');
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar('Error', 'Please verify your email');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('wrong email');
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('wrong password');
        Get.snackbar('Error', 'Wrong password provided for that user.');
      } else if (e.code == 'too-many-requests') {
        print('too-many-requests');
        Get.snackbar('Error', 'Too many requests. Try again later.');
      }
      print(e.code);
    } catch (e) {
      print(e) {
        print('Error during login: $e');
        //     Get.snackbar('Error', 'An error occurred during login');
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

//Pisah
final TextEditingController passwordController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController numberController = TextEditingController();

String username = '';
String password = '';
String email = '';
RxString number = ''.obs;

void setUsername(String value) {
  username = value;
}

void setPassword(String value) {
  password = value;
}

void setEmail(String value) {
  password = value;
}

void setNumber(String value) {
  number = value as RxString;
}

  // Future<void> login() async {
  //   String username = usernameController.text;
  //   String password = passwordController.text;

  //   if (username.isEmpty || password.isEmpty) {
  //     Get.snackbar('Error', 'Username and password cannot be empty');
  //     return;
  //   }

  //   try {
  //     final UserController userController = Get.find<UserController>();

  //     // ignore: unused_local_variable
  //     String storedNumber = userController.number;

  //     DocumentSnapshot document = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(username) // Menggunakan username sebagai ID dokumen
  //         .get();

  //     if (document.exists) {
  //       String storedPassword = document.get('password');

  //       if (storedPassword == password) {
  //         print('Login Successful');

  //         Get.offAllNamed('/home');
  //       } else {
  //         Get.snackbar('Error', 'Invalid username or password');
  //       }
  //     } else {
  //       Get.snackbar('Error', 'User not found');
  //     }
  //   } catch (e) {
  //     print('Error during login: $e');
  //     Get.snackbar('Error', 'An error occurred during login');
  //   }
  // }

 
