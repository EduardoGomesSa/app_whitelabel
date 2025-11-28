import 'package:app_whitelabel/src/controllers/auth_controller.dart';
import 'package:app_whitelabel/src/core/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/validators.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFAD059E),
        resizeToAvoidBottomInset: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/in8.png", scale: 1.9),
                          Text(
                            "O futuro começa com aqui!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 40,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFieldWidget(
                          controller: emailTextController,
                          icon: Icons.email,
                          label: 'Email',
                          validator: emailvalidator,
                        ),
                        TextFieldWidget(
                          controller: passwordTextController,
                          icon: Icons.lock,
                          label: 'Senha',
                          isSecret: true,
                          validator: passwordValidator,
                        ),
                        SizedBox(
                          height: 50,
                          child: GetX<AuthController>(
                            init: controller,
                            builder: (controller) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFAD059E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: controller.isLoading.value
                                    ? null
                                    : () {
                                        FocusScope.of(context).unfocus();

                                        if (_formKey.currentState!.validate()) {
                                          controller.signIn(
                                            email: emailTextController.text,
                                            password:
                                                passwordTextController.text,
                                          );
                                        }
                                      },
                                child: controller.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : const Text('Entrar'),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
