import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pengaturan_controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  const PengaturanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {},
            title: const Text('Kebijakan Privasi'),
          ),
          //PUSAT BANTUAN
          ListTile(
            onTap: () {
              Get.defaultDialog(
                  title: 'Pusat Bantuan',
                  middleText:
                      'Silahkan hubungi Admin:\n 0852-5672-7383 (Febriqgal)',
                  radius: 5);
            },
            title: const Text('Pusat Bantuan'),
          ),
          const Center(child: Text('Versi 1.0.0')),
        ],
      ),
    );
  }
}
