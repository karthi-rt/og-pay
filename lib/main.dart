import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ogpay/routes/app_routes.dart';
import 'core/di/initial_binding.dart';
import 'core/themes/app_theme.dart';
import 'package:ogpay/core/resources/app_strings.dart' as s;

void main() {
  InitialBinding().dependencies();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: s.appName,
      theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
      initialBinding: InitialBinding(),
    );
  }
}