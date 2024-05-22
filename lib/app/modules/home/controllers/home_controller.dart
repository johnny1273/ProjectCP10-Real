import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:mini_project10_real/app/modules/login/views/login_view.dart';

import 'package:path/path.dart' as path;

import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  void logout() async {
    await auth.signOut();
    Get.off(() => LoginView());
  }

  RxString username = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString Myemail = ''.obs;

  Future<void> fetchData() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc('username')
          .get();

      if (userDoc.exists) {
        // Mengambil data dari dokumen pengguna
        username.value = userDoc.get('username');
        phoneNumber.value = userDoc.get('confirm');
        Myemail.value = userDoc.get('email');
      } else {
        // Dokumen pengguna tidak ditemukan
        print('User document not found');
      }
    } catch (e) {
      // Penanganan kesalahan
      print('Error fetching data: $e');
    }
  }
}

class ImageController extends GetxController {
  var imageFile = Rx<File?>(null);
  var downloadUrl = ''.obs;

  final FirebaseStorage storage = FirebaseStorage.instance;

  // Mengambil gambar dari galeri
  Future<void> pickAndUploadImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      File file = File(result.files.single.path!);
      imageFile.value = file;
      await uploadImage(file);
    }
  }

  // Mengunggah gambar ke Firebase Storage
  Future<void> uploadImage(File file) async {
    try {
      // Mengubah nama file menggunakan timestamp
      String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${path.basename(file.path)}';

      // Membuat referensi ke lokasi penyimpanan di Firebase Storage
      Reference storageRef = storage.ref().child('uploads/$fileName');

      // Mengunggah file ke Firebase Storage
      UploadTask uploadTask = storageRef.putFile(file);

      // Mendapatkan URL gambar yang diunggah
      TaskSnapshot snapshot = await uploadTask;
      String url = await snapshot.ref.getDownloadURL();

      // Menyimpan URL unduhan ke variabel observable
      downloadUrl.value = url;
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}

//pisah



