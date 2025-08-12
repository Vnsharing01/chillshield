import 'package:chillshield/presentation/home/home_binding.dart';
import 'package:chillshield/routes/app_routes.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 3));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ChillShield',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      initialBinding: HomeBinding(),
      getPages: AppRoutes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppClolors.txtMainColor,
        ),
        scaffoldBackgroundColor: AppClolors.background,
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: AppClolors.txtMainColor,
          ),
        ),
        useMaterial3: true,
      ),
    );
  }
}
