import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../controllers/tambah_berita_controller.dart';

class TambahBeritaView extends GetView<TambahBeritaController> {
  const TambahBeritaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Berita '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              maxLines: 3,
              controller: controller.judulBeritaC,
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
            ElevatedButton.icon(
                onPressed: () {
                  controller.pickfotoberita();
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Pilih Gambar Berita')),
            const SizedBox(height: 10),
            TextField(
              maxLines: 10,
              controller: controller.isiBeritaC,
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
                  bool result = await InternetConnectionChecker().hasConnection;
                  if (result == true) {
                    await controller.tambahBerita(controller.judulBeritaC.text,
                        controller.isiBeritaC.text);
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
          ],
        ),
      ),
    );
  }
}
