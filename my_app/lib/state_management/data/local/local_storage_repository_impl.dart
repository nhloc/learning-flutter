import 'package:my_app/state_management/domain/entity/user.dart';
import 'package:my_app/state_management/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const pref_fullname = 'FULLNAME';
// ignore: constant_identifier_names
const pref_username = 'USERNAME';
// ignore: constant_identifier_names
const pref_password = 'PASSWORD';
// ignore: constant_identifier_names
const pref_token = 'TOKEN';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<void> clearSession() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String token = sharedPreferences.getString(pref_token) ?? '';
    return token;
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String fullname = sharedPreferences.getString(pref_fullname) ?? '';
    final String username = sharedPreferences.getString(pref_username) ?? '';
    final String password = sharedPreferences.getString(pref_password) ?? '';
    return User(fullname, username, password);
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(pref_token, token);
    return token;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(pref_fullname, user.fullname);
    sharedPreferences.setString(pref_username, user.username);
    sharedPreferences.setString(pref_password, user.password);
    return user;
  }
}
