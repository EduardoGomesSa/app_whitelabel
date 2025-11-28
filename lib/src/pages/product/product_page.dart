import 'package:app_whitelabel/src/controllers/client_controller.dart';
import 'package:app_whitelabel/src/core/utils/hex_color.dart';
import 'package:app_whitelabel/src/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final clientController = Get.find<ClientController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            clientController.client.value?.theme.primaryColor != null
            ? HexColor(clientController.client.value!.theme.primaryColor!)
            : Colors.blue,
        title: Text("Informações do Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8), 
              child: Image.network(
                product.imageUrl!,
                width: double.infinity, 
                height: 220, 
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
              child: Center(
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Descrição:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(product.description, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Preço: ',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
