import 'package:app_whitelabel/src/core/services/http_manager.dart';
import 'package:app_whitelabel/src/core/utils/api_result.dart';
import 'package:app_whitelabel/src/core/utils/urls.dart';
import 'package:app_whitelabel/src/models/product_model.dart';

class ProductRepository {
  final HttpManager httpManager;

  ProductRepository({required this.httpManager});

  Future<ApiResult<List<ProductModel>>> listProducts({
    required String token,
    required int clientId,
  }) async {
    String endpoint = "${Url.base}/products/external/$clientId";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    print("RESPONSE ==> $response");

    if (response['success']) {
      return ApiResult<List<ProductModel>>(
        data: ProductModel.fromList(response['data'] as List),
      );
    }

    return ApiResult<List<ProductModel>>(
      message: "Não foi possível carregar os produtos. Por favor, tente novamente!",
      isError: true,
    );
  }
}
