import 'package:chillshield/shared/constants/key_string.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';

class AdsController extends GetxController {
  BannerAd? bannerAd;
  // Example observable variable
  final _isAdLoaded = false.obs;

  bool get isAdLoaded => _isAdLoaded.value;

  // Example method to load an ad
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
  void onInit() {
    super.onInit();
    // Initialize or load ads here
    loadAd();
  }

  @override
  void onClose() {
    // Dispose resources if needed
    bannerAd!.dispose();
    super.onClose();
  }
}
