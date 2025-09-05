import 'package:chillshield/shared/constants/key_string.dart';
import 'package:chillshield/shared/enums/duration_enum.dart';
import 'package:chillshield/shared/enums/frequency_enum.dart';
import 'package:chillshield/shared/enums/insect_enum.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  final RxInt _frequencySelectedValue = FrequencyEnum.none.key.obs;
  final RxInt _insectSelectedValue = InsectEnum.none.key.obs;
  final RxInt _timeSelectedValue = DurationEnum.fifteenMinute.key.obs;
  final _isAdLoaded = false.obs;

  int get frequencySelectedValue => _frequencySelectedValue.value;
  int get insectSelectedValue => _insectSelectedValue.value;
  int get timeSelectedValue => _timeSelectedValue.value;
  bool get isAdLoaded => _isAdLoaded.value;

  BannerAd? bannerAd;

  @override
  void onInit() {
    loadAd();
    super.onInit();
  }

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

  void loadAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: KeyString.adTestId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
          _isAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          _isAdLoaded.value = false;
          Logger().e(error);
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );

    bannerAd?.load();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    bannerAd?.dispose();
    super.onClose();
  }
}
