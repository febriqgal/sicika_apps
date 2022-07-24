import 'package:ciptakarya/app/modules/semuaberita/views/edit_berita_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/beritasaya_controller.dart';

class BeritasayaView extends GetView<BeritasayaController> {
  const BeritasayaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Saya'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot?>(
          stream: controller.collectionStreamBeritaSaya,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final semuaBerita = snapshot.data?.docs;
              return ListView.builder(
                itemCount: semuaBerita?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onLongPress: () {
                      Get.to(() => const EditBeritaView(),
                          arguments: semuaBerita?[index].id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: SizedBox(
                              width: 100,
                              height: 200,
                              child: Image.network(
                                '${(semuaBerita?[index].data() as Map<String, dynamic>)['foto']}',
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, progress) {
                                  return progress == null
                                      ? child
                                      : Shimmer.fromColors(
                                          direction: ShimmerDirection.ltr,
                                          baseColor: const Color.fromARGB(
                                              255, 238, 238, 238),
                                          highlightColor: const Color.fromARGB(
                                              255, 221, 217, 217),
                                          child: Container(
                                            color: Colors.white,
                                          ),
                                        );
                                },
                              ),
                            ),
                          ),
                          title: Text(
                            '${(semuaBerita?[index].data() as Map<String, dynamic>)['judul']}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text(
                            '${(semuaBerita?[index].data() as Map<String, dynamic>)['tanggal']}',
                            style: const TextStyle(fontSize: 11),
                          )),
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
          }),
    );
  }
}
