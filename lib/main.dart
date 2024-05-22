import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_project10_real/app/modules/login/controllers/login_controller.dart';
import 'package:mini_project10_real/app/modules/login/views/login_view.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA5NHdp-yrQdBYrD3C3KAcT4j7hNBvIJF8",
          appId: "1:643999519886:android:0c6a599e1283b7fd1e65df",
          messagingSenderId: "643999519886",
          projectId: "mini-project10-a7037",
          storageBucket: "mini-project10-a7037.appspot.com"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(LoginController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.StreamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Mini Project",
            initialRoute:
                snapshot.data != null && snapshot.data!.emailVerified == true
                    ? Routes.HOME
                    : Routes.LOGIN,
            getPages: AppPages.routes,
            theme: ThemeData(primaryColor: Colors.teal),
          );
        }
        return LoginView();
      },
    );
  }
}
