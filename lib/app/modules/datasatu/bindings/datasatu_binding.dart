import 'package:get/get.dart';

import '../controllers/datasatu_controller.dart';

class DatasatuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatasatuController>(
      () => DatasatuController(),
    );
  }
}
