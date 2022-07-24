import 'package:get/get.dart';

import '../controllers/beritadetials_controller.dart';

class BeritadetialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeritadetialsController>(
      () => BeritadetialsController(),
    );
  }
}
