import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/presentation/controller/cart_controller.dart';

class CartPage extends GetWidget<CartController> {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(top: 100)),
          Text('View Cart ${Get.arguments}'),
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
          SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.back(result: 'return');
                      },
                      child: const Text('Return'))
                ],
              )),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
