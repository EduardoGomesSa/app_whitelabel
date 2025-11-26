import 'package:app_whitelabel/src/controllers/client_controller.dart';
import 'package:app_whitelabel/src/controllers/product_controller.dart';
import 'package:app_whitelabel/src/core/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final clientController = Get.find<ClientController>();
    final productController = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            clientController.client.value?.theme.primaryColor != null
            ? HexColor(clientController.client.value!.theme.primaryColor!)
            : Colors.blue,
        title: const Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              productController.loadProducts();
            },
          ),
        ],
      ),
      body: Obx(() {
        final products = productController.products;

        if (products.isEmpty) {
          return const Center(child: Text('Nenhum produto encontrado'));
        }

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (_, index) {
            final p = products[index];
            return ListTile(title: Text(p.name), subtitle: Text('ID: ${p.id}'));
          },
        );
      }),
    );
  }
}
