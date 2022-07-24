import 'package:ciptakarya/app/modules/surat1/views/surat1_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/buat_surat_controller.dart';

class BuatSuratView extends GetView<BuatSuratController> {
  const BuatSuratView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Get.to(() => const Surat1View());
                },
                leading: const Icon(Icons.add),
                title: const Text('Surat Tugas'),
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const Surat1View());
                },
                leading: const Icon(Icons.add),
                title: const Text('Surat Izin Kerja'),
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const Surat1View());
                },
                leading: const Icon(Icons.add),
                title: const Text('Surat Undangan'),
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const Surat1View());
                },
                leading: const Icon(Icons.add),
                title: const Text('Surat Edaran'),
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const Surat1View());
                },
                leading: const Icon(Icons.add),
                title: const Text('Surat Perintah'),
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const Surat1View());
                },
                leading: const Icon(Icons.add),
                title: const Text('Surat Intruksi'),
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const Surat1View());
                },
                leading: const Icon(Icons.add),
                title: const Text('Surat Perjalanan Dinas'),
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const Surat1View());
                },
                leading: const Icon(Icons.add),
                title: const Text('Surat Keputusan'),
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const Surat1View());
                },
                leading: const Icon(Icons.add),
                title: const Text('Surat Permohonan'),
                trailing: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
