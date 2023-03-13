import 'package:get/get.dart';
import 'package:my_app/state_management/presentation/binding/cart_binding.dart';
import 'package:my_app/state_management/presentation/binding/login_binding.dart';
import 'package:my_app/state_management/presentation/binding/shopping_binding.dart';
import 'package:my_app/state_management/presentation/binding/splash_binding.dart';
import 'package:my_app/state_management/presentation/views/cart_page.dart';
import 'package:my_app/state_management/presentation/views/login_page.dart';
import 'package:my_app/state_management/presentation/views/shopping_page.dart';
import 'package:my_app/state_management/presentation/views/splash_page.dart';
import 'package:my_app/state_management/presentation/routes/app_routes.dart';

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
