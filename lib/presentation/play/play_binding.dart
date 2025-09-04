import 'package:chillshield/widgets/ads/ads_controller.dart';
import 'package:get/get.dart';
import 'play_controller.dart';

class PlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayController>(() => PlayController());
    Get.lazyPut<AdsController>(() => AdsController(),fenix: false);
  }
}
