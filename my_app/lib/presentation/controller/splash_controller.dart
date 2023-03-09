import 'package:get/get.dart';
import 'package:my_app/domain/repository/api_repository.dart';
import 'package:my_app/domain/repository/local_storage_repository.dart';
import 'package:my_app/routes/app_routes.dart';

class SplashController extends GetxController {
  LocalRepositoryInterface localRepositoryInterface;
  ApiRepositoryInterface apiRepositoryInterface;
  SplashController(this.localRepositoryInterface, this.apiRepositoryInterface);

  @override
  void onReady() {
    getSession();
    super.onReady();
  }

  void getSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != '') {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(AppRoutes.shopping);
    } else {
      Get.offNamed(AppRoutes.login);
    }
  }
}
