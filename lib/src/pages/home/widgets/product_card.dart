import 'package:app_whitelabel/src/controllers/client_controller.dart';
import 'package:app_whitelabel/src/core/utils/hex_color.dart';
import 'package:app_whitelabel/src/models/product_model.dart';
import 'package:app_whitelabel/src/pages/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final clientController = Get.find<ClientController>();

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
      child: SizedBox(
        height: 130,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(product: product),
              ),
            );
          },
          child: Card(
            elevation: 2,
            color: clientController.client.value?.theme.primaryColor != null
                ? HexColor(clientController.client.value!.theme.primaryColor!)
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.imageUrl!,
                      width: 75,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // TEXTOS
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TÍTULO
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 4),

                        // DESCRIÇÃO — limitada
                        Expanded(
                          child: Text(
                            product.description,
                            maxLines:
                                3, // limite de linhas dentro da altura fixa
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // PREÇO
                  Text(
                    "R\$ ${product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
