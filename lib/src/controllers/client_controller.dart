import 'package:get/get.dart';
import '../models/client_model.dart';

class ClientController extends GetxController {
  Rx<ClientModel?> client = Rx<ClientModel?>(null);

  void setClient(ClientModel newClient) {
    client.value = newClient;
  }

  bool get isLoaded => client.value != null;
}
