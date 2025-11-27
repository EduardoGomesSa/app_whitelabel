import 'dart:async';

import 'package:app_whitelabel/src/controllers/client_controller.dart';
import 'package:app_whitelabel/src/core/routes/app_routes_pages.dart';
import 'package:app_whitelabel/src/core/utils/api_result.dart';
import 'package:app_whitelabel/src/core/utils/app_utils.dart';
import 'package:app_whitelabel/src/core/utils/auth_result.dart';
import 'package:app_whitelabel/src/models/user_model.dart';
import 'package:app_whitelabel/src/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  final AppUtils appUtils;
  final ClientController clientController;

  AuthController({
    required this.repository,
    required this.appUtils,
    required this.clientController,
  });

  RxBool isLoading = false.obs;
  UserModel user = UserModel();

  @override
  Future<void> onInit() async {
    super.onInit();

    await validateToken();
  }

  Future signIn({required String email, required String password}) async {
    isLoading.value = true;

    ApiResult<AuthResult> result = await repository.signIn(
      email: email,
      password: password,
    );

    if (!result.isError) {
      user = result.data!.user;
      clientController.client.value = result.data!.client;

      Get.offAllNamed(AppRoutes.home);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  Future validateToken() async {
    String? token = await appUtils.getLocalData(key: 'user-token');

    if (token != null) {
      ApiResult<AuthResult> result = await repository.validateToken(token);
      if (!result.isError) {
        user = result.data!.user;
        clientController.client.value = result.data!.client;
        Get.offAllNamed(AppRoutes.home);
      } else {
        appUtils.showToast(message: result.message!, isError: true);
        Get.offAllNamed(AppRoutes.login);
      }
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  Future signOut() async {
    String? token = await appUtils.getLocalData(key: 'user-token');
    await appUtils.removeLocalData(key: 'user-token');

    var result = await repository.signOut(token: token ?? "");

    if (!result.isError) {
      appUtils.showToast(message: result.message!);
      Get.offAllNamed(AppRoutes.login);
    } else {
      appUtils.showToast(message: result.message!, isError: result.isError);
    }
  }
}
