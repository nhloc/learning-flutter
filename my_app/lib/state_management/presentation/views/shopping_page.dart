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
      backgroundColor: const Color.fromARGB(255, 160, 219, 211),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hello: $data', style: const TextStyle(fontSize: 20)),
                  TextButton.icon(
                      onPressed: () async {
                        final result =
                            await Get.toNamed(AppRoutes.cart, arguments: data);
                        if (result != null) {
                          controller.getAllProduct();
                        }
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 32,
                        color: Color.fromARGB(255, 1, 15, 97),
                      ),
                      label: Obx(() => Text('(${controller.itemCount})',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 15, 97)))))
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
          const SizedBox(height: 20)
        ],
      )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Information',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: Obx(() => Text('Shopping Cart (${controller.itemCount})')),
              onTap: () async {
                final result =
                    await Get.toNamed(AppRoutes.cart, arguments: data);
                if (result != null) {
                  controller.getAllProduct();
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Log out'),
              onTap: () {
                LocalRepositoryImpl().clearSession();
                Get.offNamed(AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
