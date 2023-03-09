import 'package:get/get.dart';
import 'package:my_app/data/repository/api_repository_impl.dart';
import 'package:my_app/data/repository/local_storage_repository_impl.dart';
import 'package:my_app/data/repository/product_repository_impl.dart';
import 'package:my_app/domain/repository/api_repository.dart';
import 'package:my_app/domain/repository/local_storage_repository.dart';
import 'package:my_app/domain/repository/product_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
    Get.lazyPut<ProcdutRepositoryInterface>(() => ProductRepositoryImpl());
  }
}
