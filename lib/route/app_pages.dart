import 'package:get/get.dart';
import 'package:my_portfolio/feature/home/page/home_page.dart';
import 'package:my_portfolio/route/app_routes.dart';


class AppPages {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      transition: Transition.fadeIn,
    ),

  ];
}