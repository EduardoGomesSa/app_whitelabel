import 'package:app_whitelabel/src/controllers/auth_controller.dart';
import 'package:app_whitelabel/src/models/product_model.dart';
import 'package:app_whitelabel/src/repositories/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository repository;
  final AuthController auth;

  ProductController({required this.repository, required this.auth});

  RxList<ProductModel> products = <ProductModel>[].obs;

  Future<void> loadProducts() async {
    String token = auth.user.token!;

    // final data = await repository.listProducts(token: token);
    // products.assignAll(data);
  }
}