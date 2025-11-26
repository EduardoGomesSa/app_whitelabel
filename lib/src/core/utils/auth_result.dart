import 'package:app_whitelabel/src/models/client_model.dart';
import 'package:app_whitelabel/src/models/user_model.dart';

class AuthResult {
  final UserModel user;
  final ClientModel client;

  AuthResult({required this.user, required this.client});
}