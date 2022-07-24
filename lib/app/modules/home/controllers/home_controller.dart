import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Stream<QuerySnapshot?> collectionStreamDataStoryHome = FirebaseFirestore
      .instance
      .collection('data_story')
      .orderBy('upload', descending: true)
      .snapshots();
}
