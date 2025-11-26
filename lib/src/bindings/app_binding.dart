import 'package:app_whitelabel/src/controllers/auth_controller.dart';
import 'package:app_whitelabel/src/core/services/http_manager.dart';
import 'package:app_whitelabel/src/core/utils/app_utils.dart';
import 'package:app_whitelabel/src/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpManager());
    Get.put(AppUtils());
    Get.put(AuthRepository(httpManager: Get.find(), appUtils: Get.find()));
    Get.put(AuthController(repository: Get.find(), appUtils: Get.find()));
  }
}
