import 'package:get/get.dart';
import 'package:my_portfolio/feature/main/controller/main_controller.dart';

class DependencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    // Get.lazyPut(() => LoginController(), fenix: true);
  }
}