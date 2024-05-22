import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project10_real/app/modules/login/controllers/login_controller.dart';
import 'package:mini_project10_real/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  RxString username = ''.obs;

  void register(String email, String password, String username, String name,
      String number, String confirm) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        String uid = user.uid;

        await FirebaseFirestore.instance.collection('users').doc(email).set({
          'email': email,
          'password': password,
          'username': username,
          'name': name,
          'number': number,
          'confirm': confirm
        });
        this.username.value = username;
      }

      Get.snackbar('Success', 'User created successfully');
      userCredential.user!.sendEmailVerification();
      Get.defaultDialog(
          title: 'Verify your email',
          middleText:
              'Please verify your email to continue. We have sent you an email verification link.',
          textConfirm: 'OK',
          textCancel: 'Resend',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.offAllNamed(Routes.LOGIN);
          },
          onCancel: () {
            userCredential.user!.sendEmailVerification();
            Get.snackbar('Success', 'Email verification link sent');
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.');
      }
      print(e.code);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> fetchUsername(String email) async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    if (userDoc.exists) {
      username.value = userDoc.get('username');
    }
  }
}

//pisah
// Future<void> register() async {
//   String email = emailController.text;
//   String password = passwordController.text;
//   String username = usernameController.text;
//   String name = nameController.text;
//   String number = numberController.text;
//   String confirm = confirmController.text;

//   if (email.isEmpty ||
//       password.isEmpty ||
//       username.isEmpty ||
//       name.isEmpty ||
//       number.isEmpty ||
//       confirm.isEmpty) {
//     Get.snackbar('Error', 'Please fill in all fields');
//     return;
//   }

//   if (password != confirm) {
//     Get.snackbar('Error', 'Passwords do not match');
//     return;
//   }
// }

//   try {
//     await FirebaseFirestore.instance.collection('users').doc(email).set({
//       'email': email,
//       'password': password,
//       'username': username,
//       'name': name,
//       'number': number,
//       'confirm': confirm
//     });
//     Get.offAllNamed('/login');
//   } catch (e) {
//     print('Error during registration: $e');
//     Get.snackbar('Error', 'Failed to register user');
//   }
// }

String getUsername() {
  return usernameController.text;
}

class UserController extends GetxController {
  final RegisterController registerController = Get.put(RegisterController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  String username = '';
  String password = '';
  String email = '';
  String number = '';
  String name = '';
  String confirm = '';

  void setPassword(String value) {
    password = value;
  }

  void setEmail(String value) {
    email = value;
  }

  void setPhoneNumber(String value) {
    number = value;
  }

  void setName(String value) {
    name = value;
  }

  void setConfirm(String value) {
    confirm = value;
  }
}
