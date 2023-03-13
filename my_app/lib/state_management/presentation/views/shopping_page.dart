import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/state_management/data/local/local_storage_repository_impl.dart';
import 'package:my_app/state_management/data/repository/product_repository_impl.dart';
import 'package:my_app/state_management/presentation/controller/shopping_controller.dart';
import 'package:my_app/state_management/presentation/routes/app_routes.dart';

class ShoppingPage extends GetWidget<ShoppingController> {
  ShoppingPage({super.key});

  final ShoppingController shoppingController =
      ShoppingController(Get.put(ProductRepositoryImpl()));

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Page')),
      backgroundColor: Color.fromARGB(255, 122, 189, 180),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Hello: $data', style: const TextStyle(fontSize: 20))
                ],
              )),
          Expanded(
            child: Obx(() => ListView.builder(
                itemCount: controller.products.value.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(controller.products.value[index].name,
                                      style: const TextStyle(fontSize: 20)),
                                  Text(controller
                                      .products.value[index].description)
                                ],
                              ),
                              Text(controller.products.value[index].price)
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                controller.addCart(index);
                              },
                              child: const Text('Add to Cart'))
                        ],
                      ),
                    ),
                  );
                })),
          ),
          const SizedBox(height: 20),
          Obx(() => Text('Total amount: ${controller.itemCount}',
              style: const TextStyle(fontSize: 20))),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        LocalRepositoryImpl().clearSession();
                        Get.offNamed(AppRoutes.login);
                      },
                      child: const Text('Logout')),
                  ElevatedButton(
                      onPressed: () async {
                        final result =
                            await Get.toNamed(AppRoutes.cart, arguments: data);
                        if (result != null) {
                          controller.getAllProduct();
                        }
                      },
                      child: const Text('View Cart'))
                ],
              )),
          const SizedBox(height: 20),
        ],
      )),
    );
  }
}