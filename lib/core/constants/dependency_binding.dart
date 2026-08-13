import 'package:get/get.dart';
import 'package:portfolio/feature/main/controller/main_controller.dart';
import 'package:portfolio/feature/skills/controller/skill_controller.dart';

class DependencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SkillController());
  }
}
