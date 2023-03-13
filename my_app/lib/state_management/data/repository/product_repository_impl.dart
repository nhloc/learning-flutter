import 'package:my_app/state_management/domain/entity/product.dart';
import 'package:my_app/state_management/domain/entity/user.dart';
import 'package:my_app/state_management/domain/repository/product_repository.dart';

List<Product> products = [
  Product(1, 'Product 1', '100.000', 'Hang nhap khau'),
  Product(2, 'Product 2', '150.000', 'Hang noi dia'),
  Product(3, 'Product 3', '108.000', 'Nhap tu Phap'),
  Product(4, 'Product 4', '115.000', 'Nhap tu Anh'),
];

List<UserCart> userCarts = [];

class ProductRepositoryImpl extends ProcdutRepositoryInterface {
  @override
  Future<String> addProduct(Product prodcut) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<String> deleteProduct(Product product) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAllProduct() async {
    return products;
  }

  @override
  Future<void> addCart(String username, Product product) async {
    int len = userCarts.length;
    userCarts.add(UserCart(len + 1, username, product));
    return;
  }

  @override
  Future<List<UserCart>> viewCartUser(String username) async {
    List<UserCart> data =
        userCarts.where((element) => element.username == username).toList();
    return data;
  }

  @override
  Future<List<UserCart>> deleteCart(UserCart userCart) async {
    UserCart item =
        userCarts.firstWhere((element) => element.id == userCart.id);
    userCarts.remove(item);
    List<UserCart> data = userCarts
        .where((element) => element.username == userCart.username)
        .toList();
    return data;
  }
}
