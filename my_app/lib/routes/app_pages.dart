import 'package:get/get.dart';
import 'package:my_app/presentation/binding/cart_binding.dart';
import 'package:my_app/presentation/binding/login_binding.dart';
import 'package:my_app/presentation/binding/shopping_binding.dart';
import 'package:my_app/presentation/binding/splash_binding.dart';
import 'package:my_app/presentation/views/cart_page.dart';
import 'package:my_app/presentation/views/login_page.dart';
import 'package:my_app/presentation/views/shopping_page.dart';
import 'package:my_app/presentation/views/splash_page.dart';
import 'package:my_app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.shopping,
        page: () => ShoppingPage(),
        binding: ShoppingBinding()),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartPage(),
      binding: CartBinding(),
    )
  ];
}
