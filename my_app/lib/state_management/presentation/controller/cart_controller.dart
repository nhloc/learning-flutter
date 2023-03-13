import 'package:get/get.dart';
import 'package:my_app/state_management/domain/entity/product.dart';
import 'package:my_app/state_management/domain/entity/user.dart';
import 'package:my_app/state_management/domain/repository/product_repository.dart';

class CartController extends GetxController {
  final ProcdutRepositoryInterface procdutRepositoryInterface;
  CartController(this.procdutRepositoryInterface);
  dynamic username = Get.arguments;
  var products = RxList<UserCart>([]).obs;

  @override
  void onReady() {
    getProductCart();
    super.onReady();
  }

  void getProductCart() async {
    final data = await procdutRepositoryInterface.viewCartUser(username);
    products.value.addAll(data);
  }

  void deleteCart(int index) async {
    final data = await procdutRepositoryInterface.deleteCart(products.value[index]);
    products.value.clear();
    products.value.addAll(data);
  }
}
