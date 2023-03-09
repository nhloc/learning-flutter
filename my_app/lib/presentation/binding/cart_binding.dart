import 'package:get/get.dart';
import 'package:my_app/presentation/controller/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(Get.find()));
  }
}
