import 'package:get/get.dart';

import '../controllers/semua_video_kegiatan_controller.dart';

class SemuaVideoKegiatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SemuaVideoKegiatanController>(
      () => SemuaVideoKegiatanController(),
    );
  }
}
