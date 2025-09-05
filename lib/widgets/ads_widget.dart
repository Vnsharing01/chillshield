import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({
    super.key,
    this.bannerAd,
    this.isReadyAds = false,
  });
  final BannerAd? bannerAd;
  final bool isReadyAds;
  @override
  Widget build(BuildContext context) {
    return isReadyAds
        ? SizedBox(
            width: bannerAd!.size.width.toDouble(),
            height: bannerAd!.size.height.toDouble(),
            child: AdWidget(
              ad: bannerAd!,
            ),
          )
        : const SizedBox.shrink();
  }
}
