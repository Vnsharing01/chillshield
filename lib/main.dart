import 'package:chillshield/presentation/home/home_screen.dart';
import 'package:chillshield/routes/app_routes.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'shillShield',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppClolors.primary,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
