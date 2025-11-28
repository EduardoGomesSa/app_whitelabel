import 'package:app_whitelabel/src/controllers/auth_controller.dart';
import 'package:app_whitelabel/src/controllers/client_controller.dart';
import 'package:app_whitelabel/src/controllers/product_controller.dart';
import 'package:app_whitelabel/src/core/enums/order_type.dart';
import 'package:app_whitelabel/src/pages/home/widgets/product_card.dart';
import 'package:app_whitelabel/src/pages/home/widgets/search_widget.dart';
import 'package:app_whitelabel/src/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final clientController = Get.find<ClientController>();
    final productController = Get.find<ProductController>();
    final authController = Get.find<AuthController>();
    final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();

    void searchProducts(String searchTerm) {
      productController.getProducts(searchTerm);
    }

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor:
              clientController.client.value?.theme.primaryColor,
          title: Text('Bem vindo a ${clientController.client.value?.name ?? 'loja'}'),
          actions: [
            PopupMenuButton<OrderType>(
              icon: const Icon(Icons.sort),
              onSelected: (value) {
                productController.orderProducts(value);
              },
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: OrderType.asc,
                  child: Text("Menor preço"),
                ),
                const PopupMenuItem(
                  value: OrderType.desc,
                  child: Text("Maior preço"),
                ),
              ],
            ),
            IconButton(
              padding: const EdgeInsets.only(right: 10),
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(user: authController.user),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Row(
                children: [
                  Expanded(child: SearchWidget(onSearch: searchProducts)),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                key: refreshIndicatorKey,
                onRefresh: () async {
                  productController.loadProducts();
                },
                child: Obx(() {
                  final products = productController.products;
      
                  if (productController.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor:
                            clientController.client.value?.theme.primaryColor,
                        color:
                            clientController.client.value?.theme.primaryColor,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
