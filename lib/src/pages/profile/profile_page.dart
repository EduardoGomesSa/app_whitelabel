import 'package:app_whitelabel/src/controllers/auth_controller.dart';
import 'package:app_whitelabel/src/controllers/client_controller.dart';
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

    final primaryColor = clientController.client.value?.theme.primaryColor;

    final company = clientController.client.value;

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Perfil do usuário'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _sectionTitle("Seus dados"),
                    _userInfoCard(user),

                    const SizedBox(height: 20),
                    _sectionTitle("Informações da empresa"),
                    _companyInfoCard(company),
                  ],
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.red[700]!, width: 1),
                    ),
                  ),
                  onPressed: () => authController.signOut(),
                  child: Text(
                    "Sair do aplicativo",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _userInfoCard(UserModel user) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRow("Nome", user.name!),
            const SizedBox(height: 10),
            _infoRow("Email", user.email!),
          ],
        ),
      ),
    );
  }

  Widget _companyInfoCard(company) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (company?.theme.logo != null && company!.theme.logo!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  company.theme.logo!,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => const Icon(
                    Icons.broken_image,
                    size: 60,
                    color: Colors.grey,
                  ),
                ),
              )
            else
              const Icon(
                Icons.image_not_supported,
                size: 60,
                color: Colors.grey,
              ),

            const SizedBox(height: 12),
            Text(
              company?.name ?? "Empresa não informada",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
