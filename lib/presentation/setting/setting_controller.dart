import 'package:chillshield/shared/constants/get_it.dart';
import 'package:chillshield/shared/constants/key_string.dart';
import 'package:chillshield/shared/enums/background_sound_enum.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class SettingController extends GetxController {
  final _isAudiValue = BackgroundSoundEnum.stream.obs;

  BackgroundSoundEnum get isAudioValue => _isAudiValue.value;

  @override
  void onInit() {
    _isAudiValue.value = preferences.getString(KeyString.backgroundSound) != null
        ? BackgroundSoundEnumExtension.fromName(
            preferences.getString(KeyString.backgroundSound)!)
        : BackgroundSoundEnum.stream;
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void toggleAudio(BackgroundSoundEnum value) {
    _isAudiValue.value = value;
    preferences.setString(
      KeyString.backgroundSound,
      value.name,
    );
  }

  void shareApp() {
    SharePlus.instance.share(
      ShareParams(
        text:
            "Muỗi? Gián? Côn trùng? Không còn là vấn đề. \nĐêm nay ngủ ngon, không còn tiếng vo ve 🛡️ \nDùng thử ngay: https://www.youtube.com/watch?v=ebYDOadpPcI",
        // rest of params
        excludedCupertinoActivities: [
          CupertinoActivityType.postToFacebook,
          CupertinoActivityType.postToTwitter,
          CupertinoActivityType.message,
        ],
      ),
    );
  }
}
