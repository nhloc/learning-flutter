import 'package:my_app/state_management/domain/entity/product.dart';
import 'package:my_app/state_management/domain/entity/user.dart';

abstract class ProcdutRepositoryInterface {
  Future<List<Product>> getAllProduct();
  Future<String> addProduct(Product prodcut);
  Future<String> deleteProduct(Product product);
  Future<List<UserCart>> viewCartUser(String username);
  Future<void> addCart(String username, Product product);
  Future<List<UserCart>> deleteCart(UserCart userCart);
}
