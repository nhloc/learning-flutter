import 'package:get/get.dart';
import 'package:my_app/state_management/presentation/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
        () => SplashController(Get.find(), Get.find()));
  }
}
