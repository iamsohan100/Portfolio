import 'package:get/get.dart';
import 'package:portfolio/feature/main/controller/main_controller.dart';
import 'package:portfolio/feature/my_journey/controller/my_journey_controller.dart';
import 'package:portfolio/feature/my_work/controller/my_work_controller.dart';
import 'package:portfolio/feature/skills/controller/skill_controller.dart';

class DependencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SkillController());
    Get.put(MyJourneyController());
    Get.put(MyWorkController());
  }
}
