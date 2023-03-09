import 'package:my_app/domain/entity/product.dart';

class User {
  final String fullname;
  final String username;
  final String password;
  User(this.fullname, this.username, this.password);
}

class LoginRequest {
  final String username;
  final String password;
  LoginRequest(this.username, this.password);
}

class LoginResponse {
  final String token;
  final User user;
  LoginResponse(this.token, this.user);
}

class UserCart {
  final int id;
  final String username;
  final Product product;
  UserCart(this.id, this.username, this.product);
}
