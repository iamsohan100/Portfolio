import 'package:get/get.dart';
import 'package:portfolio/feature/main/page/main_page.dart';
import 'package:portfolio/route/app_routes.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.mainPage,
      page: () => const MainPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
