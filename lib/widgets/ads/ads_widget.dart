import 'package:chillshield/widgets/ads/ads_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsWidget extends GetView<AdsController> {
  const AdsWidget({
    super.key,
    this.bannerAd,
  });
  final BannerAd? bannerAd;
  @override
  Widget build(BuildContext context) {
    controller.bannerAd = bannerAd;
    return Obx(
      () {
        return controller.isAdLoaded
            ? SizedBox(
                width: controller.bannerAd!.size.width.toDouble(),
                height: controller.bannerAd!.size.height.toDouble(),
                child: AdWidget(
                  ad: controller.bannerAd!,
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
