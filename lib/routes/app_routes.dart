import 'package:chillshield/data/models/ultrasonic_model.dart';
import 'package:chillshield/presentation/home/home_binding.dart';
import 'package:chillshield/presentation/home/home_screen.dart';
import 'package:chillshield/presentation/play/play_binding.dart';
import 'package:chillshield/presentation/play/play_screen.dart';
import 'package:chillshield/presentation/setting/setting_binding.dart';
import 'package:chillshield/presentation/setting/setting_screen.dart';
import 'package:chillshield/routes/route_name.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialRoute = RouteName.home;
  static final routes = [
    GetPage(
      name: RouteName.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/play',
      page: () => const PlayScreen(),
      binding: PlayBinding(),
      arguments: UltrasonicModel,
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.settings,
      page: () => const SettingScreen(),
      binding: SettingBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
