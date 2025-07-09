import 'package:get/get.dart';

import '../controllers/save_habit_controller.dart';

class SaveHabitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaveHabitController>(() => SaveHabitController());
  }
}
