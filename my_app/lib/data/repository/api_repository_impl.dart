import 'package:my_app/domain/entity/user.dart';
import 'package:my_app/domain/exception/auth_exception.dart';
import 'package:my_app/domain/repository/api_repository.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 5));
    if (token == "LOC001") {
      return User('Nguy Huu Loc', 'nhloc', '123');
    } else if (token == "AD001") {
      return User('Administrator', 'admin', '123');
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    if (login.username == 'nhloc' && login.password == '123') {
      return LoginResponse('LOC001', User('Nguy Huu Loc', 'nhloc', '123'));
    } else if (login.username == 'admin' && login.password == '123') {
      return LoginResponse('AD001', User('Administrator', 'admin', '123'));
    }
    throw AuthException();
  }
}
