import 'dart:io';

import 'package:ciptakarya/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class AkunController extends GetxController {
  TextEditingController ubahPassC = TextEditingController();
  TextEditingController ubahNamaC = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  final ImagePicker picker = ImagePicker();
  final storageRef = FirebaseStorage.instance.ref();

  ubahNama() async {
    if (ubahNamaC.text.isEmpty) {
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Kesalahan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText: const Center(child: Text('Nama tidak boleh kosong')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
      );
    } else {
      try {
        await user?.updateDisplayName(ubahNamaC.text);
        Get.back();
        update();
        Get.snackbar(
          '-',
          '-',
          titleText: const Center(
            child: Text(
              'Berhasil',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          messageText: const Center(child: Text('Yeayy! Nama berhasil diubah')),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          '-',
          '-',
          titleText: const Center(
            child: Text(
              'Kesalahan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          messageText: const Center(
              child: Text(
                  'Tidak bisa ganti nama, silahkan diulang atau hubungi admin')),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: Colors.white,
        );
      }
    }
  }

  keluar() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.INTRODUCTION_PAGE);
  }

  keluar2() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  ubahPassword() async {
    if (ubahPassC.text.isEmpty) {
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Kesalahan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText: const Center(child: Text('Password tidak boleh kosong')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
      );
    } else {
      try {
        await user?.updatePassword(ubahPassC.text);
        keluar2();
        Get.snackbar(
          '-',
          '-',
          titleText: const Center(
            child: Text(
              'Berhasil',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          messageText: const Center(
            child: Text(
              'Yeayy! Password berhasil diubah, silahkan login kembali',
            ),
          ),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: Colors.white,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
            '-',
            '-',
            titleText: const Center(
              child: Text(
                'Kesalahan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            messageText: const Center(
              child: Text('Kata sandi yang diberikan terlalu lemah.'),
            ),
            snackStyle: SnackStyle.GROUNDED,
            backgroundColor: Colors.white,
          );
        }
      } catch (e) {
        Get.snackbar(
          '-',
          '-',
          titleText: const Center(
            child: Text(
              'Kesalahan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          messageText: const Center(
              child: Text(
                  'Tidak bisa ganti password, silahkan logout atau hubungi admin')),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: Colors.white,
        );
      }
    }
  }

  Future<void> ubahFotoProfle() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (image != null) {
      File file = File(image.path);
      try {
        final mountainImagesRef = storageRef.child("foto_profile/${user?.uid}");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload foto profile...',
        );
        await mountainImagesRef.putFile(
          file,
        );
        Get.back();
        update();
        Get.defaultDialog(
          confirm: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.amber,
              ),
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('OK')),
          radius: 5,
          title: 'Berhasil',
          middleText:
              'Yeayy! berhasil mengganti foto profile🔥\nSilahkan Restart aplikasi untuk\nmelihat perubahan',
          barrierDismissible: false,
        );
      } catch (e) {
        Get.defaultDialog(
            title: 'Pemberitahuan',
            middleText: 'Gagal mengupload foto, silahkan coba lagi');
      }
    } else {
      Container();
    }
  }
}
