import 'package:get/get.dart';

import '../controllers/semua_foto_kegiatan_controller.dart';

class SemuaFotoKegiatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SemuaFotoKegiatanController>(
      () => SemuaFotoKegiatanController(),
    );
  }
}
