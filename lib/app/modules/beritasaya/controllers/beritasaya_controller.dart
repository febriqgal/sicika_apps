import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BeritasayaController extends GetxController {
  File? imageeee;
  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> collectionStreamBeritaSaya = FirebaseFirestore.instance
      .collection("data_berita")
      .orderBy('${FirebaseAuth.instance.currentUser?.uid}', descending: true)
      .snapshots();
  Future<void> deleteBerita(String docID) async {
    DocumentReference docRef = firestore.collection("data_berita").doc(docID);
    try {
      await docRef.delete();
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
        messageText: const Center(child: Text('Berita berhasil dihapus')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
        barBlur: 0.5,
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
        messageText: const Center(child: Text('Berita tidak berhasil dihapus')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
        barBlur: 0.5,
      );
    }
  }

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
        update();
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
          middleText: 'Yeayy! berhasil mengupload foto🔥',
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
}
