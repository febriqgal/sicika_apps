import 'package:ciptakarya/app/modules/semuaberita/controllers/semuaberita_controller.dart';
import 'package:ciptakarya/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SemuaberitaView extends GetView<SemuaberitaController> {
  const SemuaberitaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final semuaberitaC = Get.put(SemuaberitaController());
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot?>(
          stream: semuaberitaC.collectionStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final semuaBerita = snapshot.data?.docs;
              return ListView.builder(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                itemCount: semuaBerita?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Get.toNamed(
                          Routes.BERITADETIALS,
                          arguments: semuaBerita?[index].id,
                        );
                      },
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
                      subtitle: Text(
                        '${(semuaBerita?[index].data() as Map<String, dynamic>)['tanggal']}',
                        style: const TextStyle(fontSize: 11),
                      ));
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
        floatingActionButton: auth.currentUser != null
            ? FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.TAMBAH_BERITA);
                },
                backgroundColor: Colors.amber,
                child: const Icon(Icons.add),
              )
            : null,
      ),
    );
  }
}
