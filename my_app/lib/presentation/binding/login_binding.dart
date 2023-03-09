import 'package:get/get.dart';
import 'package:my_app/presentation/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(Get.find(), Get.find()));
  }
}
