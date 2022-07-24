import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SemuaFotoKegiatanController extends GetxController {
  File? imageeee;
  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController isiFotoKegiatanC = TextEditingController();
  TextEditingController judulFotoKegiatanC = TextEditingController();
  Stream<QuerySnapshot?> collectionStreamFotoKegiatan = FirebaseFirestore
      .instance
      .collection('data_foto_kegiatan')
      .orderBy('urutan', descending: true)
      .snapshots();

  CollectionReference dataFotoKegiatan =
      FirebaseFirestore.instance.collection("data_foto_kegiatan");

  Future<void> pickfotokegiatan() async {
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
            storageRef.child("Foto_Kegiatan/${imageeee.path.split('/').last}");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload...',
        );
        await mountainImagesRef.putFile(
          file,
        );
        await dataFotoKegiatan.add(
          {
            "uid": user?.uid,
            "tanggal": DateFormat("EEEE, d MMMM yyyy", "id_ID")
                .add_Hm()
                .format(DateTime.now())
                .toString(),
            "penulis": user?.displayName,
            "photoPenulis":
                'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/foto_profile%2F${user?.uid}?alt=media&token=83b2cc26-e889-4b19-9adc-9fcd703dbcc6',
            "urutan": DateTime.now().toIso8601String(),
            "foto":
                'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Foto_Kegiatan%2F${imageeee.path.split('/').last}?alt=media&token=f7412960-e162-4c90-8c41-28ec73b45824',
            "fotoName": imageeee.path.split('/').last,
          },
        );
        Get.back();
        update();
        Get.defaultDialog(
          confirm: TextButton(
            style: TextButton.styleFrom(primary: Colors.amber),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
          barrierDismissible: false,
          radius: 5,
          title: 'Berhasil',
          middleText: 'Yeayy! berhasil mengupload🔥',
        );
      } catch (e) {
        Get.defaultDialog(
            barrierDismissible: false,
            title: 'Pemberitahuan',
            middleText: 'Gagal mengupload, silahkan coba lagi!');
      }
    } else {
      Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'membatalkan mengupload');
    }
  }

  Future<void> deleteFotoKegiatan(String id) async {
    DocumentReference docRef =
        firestore.collection('data_foto_kegiatan').doc(id);
    try {
      await docRef.delete();
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
            const Center(child: Text('Yeayy! Foto Kegiatan berhasil dihapus')),
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
        messageText:
            const Center(child: Text('Foto Kegiatan tidak berhasil dihapus')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
        barBlur: 0.5,
      );
    }
  }
}
