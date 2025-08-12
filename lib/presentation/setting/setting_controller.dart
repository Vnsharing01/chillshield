import 'package:get/get.dart';

class SettingController extends GetxController {
  // Example observable variable
  var isDarkMode = false.obs;

  // Example method to toggle dark mode
  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}