import 'package:get/get.dart';

class PlayController extends GetxController {
  // Add your controller variables and methods here

  // Example observable variable
  var isPlaying = false.obs;

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