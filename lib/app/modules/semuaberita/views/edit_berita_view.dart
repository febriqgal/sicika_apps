import 'package:ciptakarya/app/modules/semuaberita/controllers/semuaberita_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class EditBeritaView extends GetView<SemuaberitaController> {
  const EditBeritaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storageRef = FirebaseStorage.instance.ref();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Berita'),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getBerita(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var dataEditBerita = snapshot.data?.data() as Map<String?, dynamic>;
            controller.isiBeritaEditC.text = dataEditBerita['isi'];
            controller.judulBeritaEditC.text = dataEditBerita['judul'];
            final hapusFoto =
                storageRef.child("Foto_Berita/${dataEditBerita['fotoName']}");
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  TextField(
                    maxLines: 3,
                    controller: controller.judulBeritaEditC,
                    autocorrect: false,
                    cursorColor: Colors.amber,
                    style: const TextStyle(color: Colors.grey),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      hintText: 'Judul Berita',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLines: 10,
                    controller: controller.isiBeritaEditC,
                    autocorrect: false,
                    cursorColor: Colors.amber,
                    style: const TextStyle(color: Colors.grey),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      hintText: 'isi berita',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        onPrimary: Colors.white,
                        fixedSize: Size(Get.width, 40),
                        primary: Color(Colors.amber.value),
                      ),
                      onPressed: () async {
                        bool result =
                            await InternetConnectionChecker().hasConnection;
                        if (result == true) {
                          await controller.editBerita(
                            controller.isiBeritaEditC.text,
                            controller.judulBeritaEditC.text,
                            '${Get.arguments}',
                          );
                        } else {
                          Get.snackbar(
                            '-',
                            '-',
                            titleText: const Center(
                              child: Text(
                                '😴',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            messageText: const Center(
                                child: Text('Tidak ada koneksi internet')),
                            snackStyle: SnackStyle.GROUNDED,
                            backgroundColor: Colors.white,
                            barBlur: 0.5,
                          );
                        }
                      },
                      child: const Text(
                        'Kirim',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(primary: Colors.red),
                      onPressed: () async {
                        controller.deleteBerita('${Get.arguments}');
                        await hapusFoto.delete();
                      },
                      child: const Text('Hapus Berita'))
                ],
              ),
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
