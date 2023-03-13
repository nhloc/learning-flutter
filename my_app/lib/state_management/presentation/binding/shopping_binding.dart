import 'package:get/get.dart';
import 'package:my_app/state_management/presentation/controller/shopping_controller.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingController>(() => ShoppingController(Get.find()));
  }
}
