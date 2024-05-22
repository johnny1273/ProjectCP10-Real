import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:mini_project10_real/app/modules/register/controllers/register_controller.dart';
import 'package:mini_project10_real/app/modules/register/views/register_view.dart';

import '../controllers/login_controller.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email, //
//         password: password,
//       );
//     } catch (e) {
//       print('Error: $e');
//       throw e;
//     }
//   }

//   Future<void> signWithUsernameAndPassword(
//       String username, String password) async {
//     try {
//       // Mendapatkan informasi pengguna dari Firestore berdasarkan username
//       QuerySnapshot userQuery = await _firestore
//           .collection('users')
//           .where('username', isEqualTo: username)
//           .limit(1)
//           .get();

//       if (userQuery.docs.isNotEmpty) {
//         // Mendapatkan email pengguna dari Firestore
//         String email = userQuery.docs.first.get('email');

//         //masuk menggunakan email dan password
//         await signInWithEmailAndPassword(email, password);

//         Get.to(() => HomeView());
//       } else {
//         throw 'username not found';
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw e;
//     }
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());
  // AuthService _authService = AuthService();
  final RegisterController registerController = Get.put(RegisterController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 160),
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.topCenter,
              child: Text(
                "Welcome to Carpenters",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    "https://cdn.dribbble.com/users/1895731/screenshots/10775934/media/cde56292cb34c70e09a1a93e27aaf8af.jpg?resize=768x576&vertical=center",
                    width: 230,
                    height: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 230),
                        child: Text("Username"),
                      ),
                      Container(
                        width: 300,
                        height: 40,
                        child: TextFormField(
                          controller: controller.emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 12),
                              hintText: "Username here..",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 230),
                        child: Text("Password"),
                      ),
                      Container(
                          width: 300,
                          height: 40,
                          child: TextFormField(
                            controller: controller.passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },

                            obscureText: true, // Agar input menjadi titik-titik
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Password here..",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none)),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 241, 218, 7)),
                          onPressed: () => controller.login(
                              controller.emailController.text,
                              controller.passwordController.text),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 10,
                              ),
                              children: [
                            TextSpan(
                                text: "Don't have an account ? ",
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: "Sign in",
                                style: TextStyle(
                                    color: Color.fromARGB(248, 255, 233, 39)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterView()));
                                  })
                          ]))
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
