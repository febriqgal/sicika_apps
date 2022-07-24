import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class TambahBeritaController extends GetxController {
  File? imageeee;
  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();
  final user = FirebaseAuth.instance.currentUser;
  TextEditingController isiBeritaC = TextEditingController();
  TextEditingController judulBeritaC = TextEditingController();

  CollectionReference dataBerita =
      FirebaseFirestore.instance.collection("data_berita");

  Future<void> pickfotoberita() async {
    final XFile? imageeee = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (imageeee != null) {
      File file = File(imageeee.path);
      var adminView = this;
      adminView.imageeee = file;
      try {
        final mountainImagesRef =
            storageRef.child("Foto_Berita/${imageeee.path.split('/').last}");
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
          radius: 5,
          title: 'Berhasil',
          middleText: 'Yeayy! berhasil🔥',
        );
      } catch (e) {
        Get.defaultDialog(
            title: 'Pemberitahuan',
            middleText: 'Gagal mengupload, silahkan coba lagi!');
      }
    } else {
      Get.defaultDialog(
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'membatalkan mengupload');
    }
  }

  Future<void> tambahBerita(String judulBeritaC, String isiBeritaC) async {
    if (judulBeritaC.isEmpty || isiBeritaC.isEmpty) {
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
        messageText:
            const Center(child: Text('Judul dan isi tidak boleh kosong')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
      );
    } else {
      try {
        await dataBerita.add(
          {
            "${user?.uid}": user?.uid,
            "uid": user?.uid,
            "judul": judulBeritaC,
            "isi": isiBeritaC,
            "tanggal": DateFormat("EEEE, d MMMM yyyy", "id_ID")
                .add_Hm()
                .format(DateTime.now())
                .toString(),
            "penulis": user!.displayName,
            "photoPenulis":
                'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/foto_profile%2F${user?.uid}?alt=media&token=83b2cc26-e889-4b19-9adc-9fcd703dbcc6',
            "urutan": DateTime.now().toIso8601String(),
            "foto":
                'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Foto_Berita%2F${imageeee?.path.split('/').last}?alt=media&token=67dd7077-ba35-4570-b4c5-46a2b983becc',
            'fotoName': imageeee?.path.split('/').last,
          },
        );
        Get.back();
        Get.back();
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
          messageText:
              const Center(child: Text('Yeayy! Berhasil menambahkan berita🎉')),
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
              child: Text('Gagal menambahkan berita🥺, silahkan coba lagi!')),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: Colors.white,
        );
      }
    }
  }
}
