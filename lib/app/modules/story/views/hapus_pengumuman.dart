import 'package:ciptakarya/app/modules/story/controllers/story_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

class HapusStory extends GetView<StoryPageController> {
  const HapusStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storageRef = FirebaseStorage.instance.ref();
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot?>(
        stream: controller.collectionStreamDataStory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final semuaStory = snapshot.data?.docs;
            return ListView.builder(
              itemCount: semuaStory?.length ?? 0,
              itemBuilder: (context, index) {
                final desertRef = storageRef.child(
                    "Story/${auth.currentUser?.uid}/${semuaStory?[index]['fotoName']}");
                return Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(semuaStory?[index]['tanggal']),
                            auth.currentUser != null &&
                                    auth.currentUser?.uid ==
                                        semuaStory?[index]['uid']
                                ? IconButton(
                                    onPressed: () async {
                                      controller
                                          .deleteStory(semuaStory![index].id);
                                      await desertRef.delete();
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      ZoomOverlay(
                        minScale: 0.5, // Optional
                        maxScale: 3.0, // Optional
                        twoTouchOnly: false,
                        child: Image.network(
                          '${(semuaStory?[index].data() as Map<String, dynamic>)['image']}',
                          fit: BoxFit.cover,
                          height: 200,
                          width: Get.width,
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.amber,
                                    ),
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
        },
      ),
    );
  }
}
