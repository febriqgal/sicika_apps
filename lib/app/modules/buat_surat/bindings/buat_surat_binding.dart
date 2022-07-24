import 'package:get/get.dart';
import '../controllers/buat_surat_controller.dart';

class BuatSuratBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatSuratController>(
      () => BuatSuratController(),
    );
  }
}
