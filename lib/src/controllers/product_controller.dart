import 'package:app_whitelabel/src/controllers/auth_controller.dart';
import 'package:app_whitelabel/src/core/enums/order_type.dart';
import 'package:app_whitelabel/src/core/utils/app_utils.dart';
import 'package:app_whitelabel/src/models/product_model.dart';
import 'package:app_whitelabel/src/repositories/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository repository;
  final AuthController auth;
  final AppUtils appUtils;

  ProductController({
    required this.repository,
    required this.auth,
    required this.appUtils,
  });

  RxList<ProductModel> products = <ProductModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    String? token = auth.user.token;

    if (auth.user.token == null) return;

    isLoading.value = true;
    final result = await repository.listProducts(
      token: token!,
      clientId: auth.clientController.client.value!.id,
    );

    if (!result.isError) {
      products.assignAll(result.data!);
    } else {
      appUtils.showToast(message: result.message!, isError: result.isError);
    }

    isLoading.value = false;
  }

  Future<void> orderProducts(OrderType order) async {
    products.sort((a, b) {
      if (order == OrderType.asc) {
        return a.price.compareTo(b.price);
      }
      return b.price.compareTo(a.price);
    });

    update();
  }
}
