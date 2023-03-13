import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/state_management/presentation/controller/cart_controller.dart';

class CartPage extends GetWidget<CartController> {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart'), automaticallyImplyLeading: false),
      backgroundColor: const Color.fromARGB(255, 118, 147, 240),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        Get.back(result: 'return');
                      },
                      icon: const Icon(Icons.home, size: 32, color: Color.fromARGB(255, 1, 3, 107),),
                      label: const Text(''))
                ],
              )),
          Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.products.value.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
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
                                    Text(
                                        controller
                                            .products.value[index].product.name,
                                        style: const TextStyle(fontSize: 20)),
                                    Text(controller.products.value[index]
                                        .product.description)
                                  ],
                                ),
                                Text(controller
                                    .products.value[index].product.price)
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  controller.deleteCart(index);
                                },
                                child: const Text('Delete'))
                          ],
                        ),
                      ),
                    );
                  }))),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
