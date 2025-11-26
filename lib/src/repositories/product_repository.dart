import 'package:app_whitelabel/src/core/services/http_manager.dart';
import 'package:app_whitelabel/src/core/utils/urls.dart';
import 'package:app_whitelabel/src/models/product_model.dart';

class ProductRepository {
  final HttpManager httpManager;

  ProductRepository( {required this.httpManager});

  // Future<List<ProductModel>> listProducts({required String token}) async {
  //   const String endpoint = "${Url.base}/products/external/${1}";

  //   final response = await httpManager.request(
  //     url: endpoint,
  //     method: HttpMethods.post,
  //     body: {
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
    
  //   return response.map<ProductModel>((p) => ProductModel.fromMap(p)).toList();
  // }
}
