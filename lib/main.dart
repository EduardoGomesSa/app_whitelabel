import 'package:app_whitelabel/src/bindings/app_binding.dart';
import 'package:app_whitelabel/src/core/routes/app_routes_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('pt_BR', null);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Whitelabel',
      theme: ThemeData(
        primaryColor: const Color(0xFFAD059E),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            iconTheme: IconThemeData(color: Colors.black)),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
