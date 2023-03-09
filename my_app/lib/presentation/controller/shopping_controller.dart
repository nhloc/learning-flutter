import 'package:get/get.dart';
import 'package:my_app/domain/entity/product.dart';
import 'package:my_app/domain/repository/product_repository.dart';

class ShoppingController extends GetxController {
  final ProcdutRepositoryInterface procdutRepositoryInterface;
  ShoppingController(this.procdutRepositoryInterface);
  dynamic username = Get.arguments;
  var products = RxList<Product>([]).obs;
  var itemCount = 0.obs;
  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }

  void getAllProduct() async {
    final data = await procdutRepositoryInterface.getAllProduct();
    products.value.clear();
    products.value.addAll(data);
    if (username != null) {
      final data = await procdutRepositoryInterface.viewCartUser(username);
      itemCount.value = data.length;
    }
  }
  void addCart(int index) async {
    final product = products.value[index];
    await procdutRepositoryInterface.addCart(username, product);
    itemCount.value++;
  }
}
