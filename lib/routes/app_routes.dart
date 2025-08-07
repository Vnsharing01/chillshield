import 'package:chillshield/presentation/home/home_screen.dart';
import 'package:chillshield/presentation/setting/setting_screen.dart';
import 'package:chillshield/routes/route_name.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialRoute = RouteName.home;
  static final routes = [
    // GetPage(
    //   name: '/splash',
    //   page: () => SplashScreen(),
    // ),
    GetPage(
      name: RouteName.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    // GetPage(
    //   name: '/play',
    //   page: () => PlayScreen(),
    // ),
    GetPage(
      name: RouteName.settings,
      page: () => const SettingScreen(),
      transition: Transition.rightToLeftWithFade
    ),
  ];
}
