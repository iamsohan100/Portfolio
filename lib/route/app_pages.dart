import 'package:get/get.dart';
import 'package:sohan/feature/main/page/main_page.dart';
import 'package:sohan/route/app_routes.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.mainPage,
      page: () => const MainPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
