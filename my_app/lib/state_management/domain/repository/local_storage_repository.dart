import 'package:my_app/state_management/domain/entity/user.dart';

abstract class LocalRepositoryInterface {
  Future<String> getToken();
  Future<String> saveToken(String token);
  Future<void> clearSession();
  Future<User> getUser();
  Future<User> saveUser(User user);
}
