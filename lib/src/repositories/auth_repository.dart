import 'package:app_whitelabel/src/core/services/http_manager.dart';
import 'package:app_whitelabel/src/core/utils/api_result.dart';
import 'package:app_whitelabel/src/core/utils/app_utils.dart';
import 'package:app_whitelabel/src/core/utils/auth_result.dart';
import 'package:app_whitelabel/src/core/utils/urls.dart';
import 'package:app_whitelabel/src/models/client_model.dart';
import 'package:app_whitelabel/src/models/user_model.dart';

class AuthRepository {
  final HttpManager httpManager;
  final AppUtils appUtils;

  AuthRepository({required this.httpManager, required this.appUtils});

  Future<ApiResult<AuthResult>> signIn({
    required String email,
    required String password,
  }) async {
    const String endpoint = "${Url.base}/auth/login";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.post,
      body: {'email': email, 'password': password},
    );

    if (response['access_token'] != null) {
      UserModel user = UserModel.fromMap(response['user']);
      final client = ClientModel.fromMap(response['client']);

      appUtils.saveLocalData(key: "user-token", data: response['access_token']);

      final authResult = AuthResult(user: user, client: client);

      return ApiResult<AuthResult>(data: authResult);
    } else {
      String message =
          response['error'] ?? 'Não foi possível fazer login. Tente novamente!';
      return ApiResult<AuthResult>(message: message, isError: true);
    }
  }

  Future<ApiResult<UserModel>> signUp(UserModel user) async {
    const String endpoint = "${Url.base}/register";

    Map<String, dynamic> body = user.toMap();
    body['password_confirmation'] = user.password;

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.post,
      body: body,
    );

    if (response['data'] != null) {
      UserModel user = UserModel.fromMap(response['data']);

      return ApiResult<UserModel>(data: user);
    } else {
      String message =
          response['message'] ??
          'Não foi possível fazer o cadastro.Tente novamente!';

      return ApiResult<UserModel>(message: message, isError: true);
    }
  }

  Future<ApiResult<AuthResult>> validateToken(String token) async {
    const String endpoint = "${Url.base}/auth/validate";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.post,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response['data'] != null) {
      UserModel user = UserModel.fromMap(response['data']['user']);
      user.token = response['data']['access_token'];
      final client = ClientModel.fromMap(response['data']['client']);

      appUtils.saveLocalData(key: "user-token", data: response['data']['access_token']);

      final authResult = AuthResult(user: user, client: client);

      return ApiResult<AuthResult>(data: authResult);
    } else {
      String message = response['error'] ?? "Realize login novamente";
      return ApiResult<AuthResult>(message: message, isError: true);
    }
  }

  Future<ApiResult<bool>> signOut({required String token}) async {
    const String endpoint = "${Url.base}/logout";
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.post,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response['message'] != null) {
      return ApiResult<bool>(
        data: true,
        message: "Logout realizado com sucesso!",
      );
    } else {
      return ApiResult<bool>(
        message: 'Não foi possível sair do aplicativo. Tente novamente',
        isError: true,
      );
    }
  }
}
