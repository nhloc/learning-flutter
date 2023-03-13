import 'package:get/get.dart';
import 'package:my_app/state_management/data/repository/api_repository_impl.dart';
import 'package:my_app/state_management/data/local/local_storage_repository_impl.dart';
import 'package:my_app/state_management/data/repository/product_repository_impl.dart';
import 'package:my_app/state_management/domain/repository/api_repository.dart';
import 'package:my_app/state_management/domain/repository/local_storage_repository.dart';
import 'package:my_app/state_management/domain/repository/product_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
    Get.lazyPut<ProcdutRepositoryInterface>(() => ProductRepositoryImpl());
  }
}
