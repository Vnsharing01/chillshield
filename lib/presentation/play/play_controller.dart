import 'package:chillshield/data/models/ultrasonic_model.dart';
import 'package:get/get.dart';

class PlayController extends GetxController {
  // Add your controller variables and methods here
  late final UltrasonicModel model;


  // Example observable variable
  var isPlaying = false.obs;

  @override
  void onInit() {
    model = Get.arguments as UltrasonicModel;
    super.onInit();
  }

  void play() {
    isPlaying.value = true;
  }

  void pause() {
    isPlaying.value = false;
  }

  
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}