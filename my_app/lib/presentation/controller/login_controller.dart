import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_app/domain/entity/user.dart';
import 'package:my_app/domain/exception/auth_exception.dart';
import 'package:my_app/domain/repository/api_repository.dart';
import 'package:my_app/domain/repository/local_storage_repository.dart';

class LoginController extends GetxController {
  LocalRepositoryInterface localRepositoryInterface;
  ApiRepositoryInterface apiRepositoryInterface;
  LoginController(this.localRepositoryInterface, this.apiRepositoryInterface);
   

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> login() async {
    final username = usernameController.text;
    final password = passwordController.text;
    try {
      final loginResponse =
          await apiRepositoryInterface.login(LoginRequest(username, password));
      await localRepositoryInterface.saveUser(loginResponse.user);
      await localRepositoryInterface.saveToken(loginResponse.token);
      return true;
    } on AuthException catch (_) {
      return false;
    }
  }
}
