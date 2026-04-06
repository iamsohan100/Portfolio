import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/constants/dependency_binding.dart';
import 'package:my_portfolio/core/constants/web_theme.dart';
import 'package:my_portfolio/route/app_pages.dart';
import 'package:my_portfolio/route/app_routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Portfolio',
      initialRoute: AppRoutes.mainPage,
      getPages: AppPages.routes,
      theme: WebTheme.darkTheme,
      initialBinding: DependencyBinding(),
    );
  }
}