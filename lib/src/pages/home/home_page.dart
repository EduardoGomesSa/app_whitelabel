import 'package:app_whitelabel/src/controllers/auth_controller.dart';
import 'package:app_whitelabel/src/controllers/client_controller.dart';
import 'package:app_whitelabel/src/controllers/product_controller.dart';
import 'package:app_whitelabel/src/core/utils/hex_color.dart';
import 'package:app_whitelabel/src/pages/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final clientController = Get.find<ClientController>();
    final productController = Get.find<ProductController>();
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            clientController.client.value?.theme.primaryColor != null
            ? HexColor(clientController.client.value!.theme.primaryColor!)
            : Colors.blue,
        title: const Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.signOut();
            },
          ),
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

        if (productController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor:
                  clientController.client.value?.theme.primaryColor != null
                  ? HexColor(clientController.client.value!.theme.primaryColor!)
                  : Colors.blue,
              color: clientController.client.value?.theme.primaryColor != null
                  ? HexColor(clientController.client.value!.theme.primaryColor!)
                  : Colors.blue,
            ),
          );
        }

        if (products.isEmpty) {
          return const Center(child: Text('Nenhum produto encontrado'));
        }

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (_, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        );
      }),
    );
  }
}
