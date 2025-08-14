import 'package:get/get.dart';

class SettingController extends GetxController {
  // Example observable variable
  final RxBool _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  // Example method to toggle dark mode
  void toggleDarkMode(bool value) {
    _isDarkMode.value = value;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}