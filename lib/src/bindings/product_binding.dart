import 'package:app_whitelabel/src/controllers/product_controller.dart';
import 'package:app_whitelabel/src/repositories/product_repository.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductRepository(httpManager: Get.find()));
    Get.put(ProductController(repository: Get.find(), auth: Get.find(), appUtils: Get.find()));
  }
}