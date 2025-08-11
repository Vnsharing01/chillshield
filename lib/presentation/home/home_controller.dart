import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _frequencySelectedValue = 0.obs;
  final RxInt _insectSelectedValue = 0.obs;
  final RxInt _timeSelectedValue = 0.obs;

  int get frequencySelectedValue => _frequencySelectedValue.value;
  int get insectSelectedValue => _insectSelectedValue.value;
  int get timeSelectedValue => _timeSelectedValue.value;

  void setFrequencySelectedValue(int value) {
    _frequencySelectedValue.value = value;
  }

  void setInsectSelectedValue(int value) {
    _insectSelectedValue.value = value;
  }

  void setTimeSelectedValue(int value) {
    _timeSelectedValue.value = value;
  }
}
