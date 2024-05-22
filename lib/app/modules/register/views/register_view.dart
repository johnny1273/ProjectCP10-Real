import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:mini_project10_real/app/modules/login/views/login_view.dart';

import '../controllers/register_controller.dart';

// ignore: must_be_immutable
class RegisterView extends GetView<RegisterController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final RegisterController registerController = Get.put(RegisterController());
  final UserController userController = Get.put(UserController());

  RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Register Your Account",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 240),
                  child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 230),
                            child: Text(
                              "Username",
                              style: TextStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 300,
                            height: 30,
                            child: TextFormField(
                              onChanged: (value) {
                                userController.username = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                              controller: controller.usernameController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Username here..',
                                  hintStyle: TextStyle(
                                      fontSize: 9, color: Colors.grey),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 258),
                            child: Text("Name"),
                          ),
                          Container(
                              width: 300,
                              height: 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  userController.setName(value);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                controller: controller.nameController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Name here..",
                                    hintStyle: TextStyle(
                                        fontSize: 9, color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 260),
                            child: Text("Email"),
                          ),
                          Container(
                              width: 300,
                              height: 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  userController.setEmail(value);
                                },
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Email here..",
                                    hintStyle: TextStyle(
                                        fontSize: 9, color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }

                                  String emailRegex =
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                  RegExp regex = RegExp(emailRegex);
                                  if (!regex.hasMatch(value)) {
                                    return 'please enter a valid email';
                                  }
                                  return null;
                                },
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 200),
                            child: Text("Phone Number"),
                          ),
                          Container(
                              width: 300,
                              height: 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  userController.number = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                                controller: controller.numberController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Phone number here",
                                    hintStyle: TextStyle(
                                        fontSize: 9, color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 230),
                            child: Text("Password"),
                          ),
                          Container(
                              width: 300,
                              height: 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  userController.setPassword(value);
                                },
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                controller: controller.passwordController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: " Password here..",
                                    hintStyle: TextStyle(
                                        fontSize: 9, color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 176),
                            child: Text("Confirm Password"),
                          ),
                          Container(
                              width: 300,
                              height: 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  userController.setConfirm(value);
                                },
                                obscureText: true,
                                validator: (Value) {
                                  if (Value !=
                                          registerController
                                              .passwordController.text ||
                                      Value!.isEmpty) {
                                    return 'Passwords donot match';
                                  }

                                  return null;
                                },
                                controller: controller.confirmController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Confirm Password here..",
                                    hintStyle: TextStyle(
                                        fontSize: 9, color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: 120,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 241, 218, 7)),
                              onPressed: () => controller.register(
                                  controller.emailController.text,
                                  controller.passwordController.text,
                                  controller.usernameController.text,
                                  controller.nameController.text,
                                  controller.confirmController.text,
                                  controller.numberController.text),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  children: [
                                TextSpan(
                                    text: "Already have an account ? ",
                                    style: TextStyle(color: Colors.white)),
                                TextSpan(
                                    text: "Log in",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(248, 255, 233, 39)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginView()));
                                      })
                              ]))
                        ],
                      ))),
            ],
          )),
        ],
      ),
    );
  }
}
