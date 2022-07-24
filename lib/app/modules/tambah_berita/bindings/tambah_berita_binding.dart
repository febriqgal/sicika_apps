import 'package:get/get.dart';

import '../controllers/tambah_berita_controller.dart';

class TambahBeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahBeritaController>(
      () => TambahBeritaController(),
    );
  }
}
