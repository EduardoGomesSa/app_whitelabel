import 'package:app_whitelabel/src/bindings/product_binding.dart';
import 'package:app_whitelabel/src/pages/auth/login_page.dart';
import 'package:app_whitelabel/src/pages/home/home_page.dart';
import 'package:app_whitelabel/src/pages/splash_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      bindings: [
        ProductBinding()
      ],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.splash, 
      page: () => const SplashPage(),
    ),
  ];
}

abstract class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String splash = '/splash';
  static const String profile = '/profile';
}
