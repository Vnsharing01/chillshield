import 'package:chillshield/routes/app_routes.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/constants/get_it.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(preferences);

  await Future.delayed(const Duration(seconds: 2));
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
      getPages: AppRoutes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppClolors.txtMainColor,
        ),
        scaffoldBackgroundColor: AppClolors.background,
        primaryColor: AppClolors.primary,
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
