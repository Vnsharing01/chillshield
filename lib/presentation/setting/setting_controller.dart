import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class SettingController extends GetxController {
  final _isAudiValue = 1.obs;

  int get isAudioValue => _isAudiValue.value;
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void toggleAudio(int value) {
    _isAudiValue.value = value;
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
