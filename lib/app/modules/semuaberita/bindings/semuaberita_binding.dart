import 'package:get/get.dart';

import '../controllers/semuaberita_controller.dart';

class SemuaberitaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SemuaberitaController>(
      () => SemuaberitaController(),
    );
  }
}
