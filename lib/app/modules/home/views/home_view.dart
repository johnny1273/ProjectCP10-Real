import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:mini_project10_real/app/modules/home/controllers/home_controller.dart';
import 'package:mini_project10_real/app/modules/login/controllers/login_controller.dart';
import 'package:mini_project10_real/app/modules/register/controllers/register_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  final ImageController imageController = Get.put(ImageController());
  final HomeController homeController = Get.put(HomeController());
  final LoginController loginController = Get.put(
    LoginController(),
  );
  final RegisterController registerController = Get.put(RegisterController());
  final UserController userController = Get.put(UserController());

  HomeView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    homeController.fetchData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Obx(() {
                          return Text(
                              "Hello, Jhoni Susanto ${homeController.username.value} ");
                        }),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        child: Text("How is your day going?"),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/person.png",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    Card(
                      elevation: 8,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Icon(Icons.account_box),
                          ),
                          Obx(() {
                            return Text(
                                'My Address: jhoni.dikdin1273@gmail.com ${homeController.Myemail.value}');
                          })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Card(
                      elevation: 8,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Icon(Icons.phone_outlined),
                          ),
                          Obx(() {
                            return Text(
                                'My Phone: 089123456${homeController.phoneNumber.value}');
                          })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      if (imageController.downloadUrl.value.isNotEmpty) {
                        return Image.network(imageController.downloadUrl.value);
                      } else {
                        return Text('No image selected');
                      }
                    }),
                    SizedBox(height: 20),
                    // Tombol untuk memilih gambar
                    ElevatedButton(
                      onPressed: () {
                        imageController.pickAndUploadImage();
                      },
                      child: Text('Pick Image'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
