import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminController extends GetxController {
  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();

  Future<void> putFilee0() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (image != null) {
      File file = File(image.path);
      try {
        final mountainImagesRef = storageRef.child("Header_Home/gambar0");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload...',
        );
        await mountainImagesRef.putFile(
          file,
        );

        Get.back();
        Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          radius: 5,
          title: 'Berhasil',
          middleText: 'Yeayy! berhasil🔥',
        );
      } catch (e) {
        Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          title: 'Pemberitahuan',
          middleText: 'Gagal mengupload, silahkan coba lagi!',
        );
      }
    } else {
      Get.defaultDialog(
        confirm: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.amber,
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text('OK'),
        ),
        barrierDismissible: false,
        radius: 5,
        title: 'Pemberitahuan',
        middleText: 'membatalkan mengupload',
      );
    }
  }

  Future<void> putFilee1() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (image != null) {
      File file = File(image.path);
      try {
        final mountainImagesRef = storageRef.child("Header_Home/gambar1");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload...',
        );
        await mountainImagesRef.putFile(
          file,
        );
        Get.back();
        Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          radius: 5,
          title: 'Berhasil',
          middleText: 'Yeayy! berhasil🔥',
        );
      } catch (e) {
        Get.defaultDialog(
            confirm: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.amber,
              ),
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
            barrierDismissible: false,
            title: 'Pemberitahuan',
            middleText: 'Gagal mengupload, silahkan coba lagi!');
      }
    } else {
      Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'membatalkan mengupload');
    }
  }

  Future<void> putFilee2() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (image != null) {
      File file = File(image.path);
      try {
        final mountainImagesRef = storageRef.child("Header_Home/gambar2");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload...',
        );
        await mountainImagesRef.putFile(
          file,
        );
        Get.back();
        Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          radius: 5,
          title: 'Berhasil',
          middleText: 'Yeayy! berhasil🔥',
        );
      } catch (e) {
        Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          title: 'Pemberitahuan',
          middleText: 'Gagal mengupload, silahkan coba lagi!',
        );
      }
    } else {
      Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'membatalkan mengupload');
    }
  }

  Future<void> putFilee3() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (image != null) {
      File file = File(image.path);
      try {
        final mountainImagesRef = storageRef.child("Header_Home/gambar3");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload...',
        );
        await mountainImagesRef.putFile(
          file,
        );
        Get.back();
        Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          radius: 5,
          title: 'Berhasil',
          middleText: 'Yeayy! berhasil🔥',
        );
      } catch (e) {
        Get.defaultDialog(
            confirm: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.amber,
              ),
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
            barrierDismissible: false,
            title: 'Pemberitahuan',
            middleText: 'Gagal mengupload, silahkan coba lagi!');
      }
    } else {
      Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'membatalkan mengupload');
    }
  }

  Future<void> putFilee4() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (image != null) {
      File file = File(image.path);
      try {
        final mountainImagesRef = storageRef.child("Header_Home/gambar4");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload...',
        );
        await mountainImagesRef.putFile(
          file,
        );
        Get.back();
        Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          radius: 5,
          title: 'Berhasil',
          middleText: 'Yeayy! berhasil🔥',
        );
      } catch (e) {
        Get.defaultDialog(
            confirm: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.amber,
              ),
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
            barrierDismissible: false,
            title: 'Pemberitahuan',
            middleText: 'Gagal mengupload, silahkan coba lagi!');
      }
    } else {
      Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'membatalkan mengupload');
    }
  }
}
