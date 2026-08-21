import 'package:get/get.dart';
import 'package:sohan/feature/certificates/controller/certifications_controller.dart';
import 'package:sohan/feature/hire_me/controller/hire_me_controller.dart';
import 'package:sohan/feature/home/controller/home_controller.dart';
import 'package:sohan/feature/main/controller/main_controller.dart';
import 'package:sohan/feature/my_journey/controller/my_journey_controller.dart';
import 'package:sohan/feature/my_work/controller/my_work_controller.dart';
import 'package:sohan/feature/skills/controller/skill_controller.dart';

class DependencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(SkillController());
    Get.put(MyJourneyController());
    Get.put(MyWorkController());
    Get.put(CertificationsController());
    Get.put(HireMeController());
  }
}


