import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_like_button/insta_like_button.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import '../controllers/semua_foto_kegiatan_controller.dart';

class SemuaFotoKegiatanView extends GetView<SemuaFotoKegiatanController> {
  const SemuaFotoKegiatanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storageRef = FirebaseStorage.instance.ref();
    FirebaseAuth auth = FirebaseAuth.instance;
    Stream<QuerySnapshot?> collectionStreamFotoKegiatan1 = FirebaseFirestore
        .instance
        .collection('data_foto_kegiatan')
        .orderBy('urutan', descending: true)
        .snapshots();
    return Scaffold(
      floatingActionButton: auth.currentUser != null &&
                  auth.currentUser?.email == 'febriqgalp@gmail.com' ||
              auth.currentUser?.email == 'febriqgal@gmail.com'
          ? FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: Get.height * 0.2,
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            controller.pickfotokegiatan();
                          },
                          trailing: const Icon(Icons.arrow_right),
                          leading: const Icon(Icons.add),
                          title: const Text(
                            'Tambah Foto Kegiatan',
                          ),
                        ),
                        const ListTile(
                          trailing: Icon(Icons.arrow_right),
                          leading: Icon(Icons.delete),
                          title: Text(
                            'Hapus Foto Kegiatan',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
              ),
            )
          : null,
      appBar: AppBar(
        title: const Text('Foto Kegiatan'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot?>(
          stream: collectionStreamFotoKegiatan1,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final semuaFotoKegiatan = snapshot.data?.docs;
              return ListView.builder(
                itemCount: semuaFotoKegiatan?.length,
                itemBuilder: (context, index) {
                  final desertRef = storageRef.child(
                      "Foto_Kegiatan/${semuaFotoKegiatan?[index]['fotoName']}");
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    '${(semuaFotoKegiatan?[index].data() as Map<String, dynamic>)['photoPenulis']}',
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${(semuaFotoKegiatan?[index].data() as Map<String, dynamic>)['penulis']}'
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '${(semuaFotoKegiatan?[index].data() as Map<String, dynamic>)['tanggal']}'),
                                  ],
                                ),
                              ],
                            ),
                            auth.currentUser != null &&
                                    auth.currentUser?.uid ==
                                        semuaFotoKegiatan?[index]['uid']
                                ? InkWell(
                                    onTap: () async {
                                      controller.deleteFotoKegiatan(
                                          semuaFotoKegiatan![index].id);
                                      await desertRef.delete();
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 300,
                        child: ZoomOverlay(
                          minScale: 0.5, // Optional
                          maxScale: 3.0, // Optional
                          twoTouchOnly: true, //(
                          child: InstaLikeButton(
                            imageBoxfit: BoxFit.cover,
                            image: NetworkImage(
                                '${(semuaFotoKegiatan?[index].data() as Map<String, dynamic>)['foto']}'),
                            onChanged: () {},
                          ),
                        ),
                      ),
                      const Divider()
                    ],
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
          }),
    );
  }
}
