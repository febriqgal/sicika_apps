import 'package:get/get.dart';

import '../controllers/story_controller.dart';

class StoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoryPageController>(
      () => StoryPageController(),
    );
  }
}
