import 'package:app_whitelabel/src/controllers/auth_controller.dart';
import 'package:app_whitelabel/src/controllers/client_controller.dart';
import 'package:app_whitelabel/src/core/utils/hex_color.dart';
import 'package:app_whitelabel/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final clientController = Get.find<ClientController>();
    final authController = Get.find<AuthController>();
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              clientController.client.value?.theme.primaryColor != null
              ? HexColor(clientController.client.value!.theme.primaryColor!)
              : Colors.blue,
          title: Text('Perfil do usuário'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Olá! ${user.name}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Email cadastrado: ${user.email}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Center(
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Informações da empresa:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Image.network(
                              clientController.client.value?.theme.logo ?? "",
                              height: 200,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 4),
                            Center(
                              child: Text(
                                clientController.client.value?.name ?? 'Não informado',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.red[700]!, width: 1),
                    ),
                  ),
                  onPressed: () {
                    authController.signOut();
                  },
                  child: Text(
                    "Sair do aplicativo",
                    style: TextStyle(fontSize: 18, color: Colors.red[700]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
