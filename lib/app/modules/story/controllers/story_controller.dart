import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class StoryPageController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference dataStory = FirebaseFirestore.instance.collection(
    "data_story",
  );
  Stream<QuerySnapshot> collectionStreamDataStory = FirebaseFirestore.instance
      .collection('data_story')
      .orderBy('upload', descending: true)
      .snapshots();
  Future<DocumentSnapshot<Object?>> getStory(String docID) async {
    DocumentReference docRef = firestore.collection("data_story").doc(docID);
    return await docRef.get();
  }

  Future<void> pickFotoStory() async {
    final XFile? imageeee = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    if (imageeee != null) {
      File file = File(imageeee.path);

      try {
        final mountainImagesRef = storageRef
            .child("Story/${user?.uid}/${imageeee.path.split('/').last}");
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Pemberitahuan',
          middleText: 'Sedang mengupload...',
        );
        await mountainImagesRef.putFile(
          file,
        );
        await dataStory.add(
          {
            'uid': user?.uid,
            'image':
                "https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Story%2F${user?.uid}%2F${imageeee.path.split('/').last}?alt=media&token=d5019fb5-1255-4ff6-8a85-a7a7085304ec",
            'upload': DateTime.now().toIso8601String(),
            'nama': user?.displayName,
            'tanggal': DateFormat("EEEE, d MMMM yyyy", "id_ID")
                .add_Hm()
                .format(DateTime.now())
                .toString(),
            'foto':
                'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/foto_profile%2F${user?.uid}?alt=media&token=83b2cc26-e889-4b19-9adc-9fcd703dbcc6',
            'fotoName': imageeee.path.split('/').last,
          },
        );
        Get.back();
        update();
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 5,
          title: 'Berhasil',
          middleText: 'Yeayy! berhasil mengupload🔥',
          confirm: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.amber,
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
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

  Future<void> deleteStory(String id) async {
    DocumentReference docRef = firestore.collection('data_story').doc(id);
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
        messageText:
            const Center(child: Text('Yeayy! Pengumuman berhasil dihapus')),
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
            const Center(child: Text('Pengumuman tidak berhasil dihapus')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
        barBlur: 0.5,
      );
    }
  }
}
