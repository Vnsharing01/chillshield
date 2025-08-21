import 'package:chillshield/shared/enums/duration_enum.dart';
import 'package:chillshield/shared/enums/frequency_enum.dart';
import 'package:chillshield/shared/enums/insect_enum.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _frequencySelectedValue = FrequencyEnum.none.key.obs;
  final RxInt _insectSelectedValue = InsectEnum.none.key.obs;
  final RxInt _timeSelectedValue = DurationEnum.fifteenMinute.key.obs;

  int get frequencySelectedValue => _frequencySelectedValue.value;
  int get insectSelectedValue => _insectSelectedValue.value;
  int get timeSelectedValue => _timeSelectedValue.value;

  void setFrequencySelectedValue(int value) {
    _frequencySelectedValue.value = value;
  }

  void setInsectSelectedValue(int value) {
    if (value == 2 && _frequencySelectedValue.value == 1) {
      _frequencySelectedValue.value = value;
    }
    _insectSelectedValue.value = value;
  }

  void setTimeSelectedValue(int value) {
    _timeSelectedValue.value = value;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
