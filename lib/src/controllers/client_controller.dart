import 'package:app_whitelabel/src/models/client_model.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  Rx<ClientModel?> client = Rx<ClientModel?>(null);

  void setClient(ClientModel newClient) {
    client.value = newClient;
  }

  bool get isLoaded => client.value != null;
}
