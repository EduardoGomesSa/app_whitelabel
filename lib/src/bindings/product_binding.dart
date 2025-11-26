import 'package:app_whitelabel/src/controllers/auth_controller.dart';
import 'package:app_whitelabel/src/controllers/product_controller.dart';
import 'package:app_whitelabel/src/repositories/product_repository.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    print("🔥 ProductBinding executando...");

    print("Repository existe? ${Get.isRegistered<ProductRepository>()}");
    print("Auth existe? ${Get.isRegistered<AuthController>()}");


    Get.put(ProductRepository(httpManager: Get.find()));
    Get.put(ProductController(repository: Get.find(), auth: Get.find(), appUtils: Get.find()));
  }
}