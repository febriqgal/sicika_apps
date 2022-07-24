import 'package:get/get.dart';

import '../controllers/surat1_controller.dart';

class Surat1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Surat1Controller>(
      () => Surat1Controller(),
    );
  }
}
