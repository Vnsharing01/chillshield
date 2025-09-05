import 'package:chillshield/data/models/ultrasonic_model.dart';
import 'package:chillshield/shared/constants/get_it.dart';
import 'package:chillshield/shared/constants/key_string.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';

class PlayController extends GetxController {
  // Add your controller variables and methods here
  late final UltrasonicModel model;

  final _isAdLoaded = false.obs;
  final _isPlaying = false.obs;

  bool get isPlaying => _isPlaying.value;
  bool get isAdLoaded => _isAdLoaded.value;

  final audioPlayer = AudioPlayer();

  BannerAd? bannerAd;

  @override
  void onInit() {
    model = Get.arguments as UltrasonicModel;
    initAudio();
    loadAd();
    super.onInit();
  }

  void play() {
    _isPlaying.value = true;
    audioPlayer.play();
  }

  void pause() {
    _isPlaying.value = false;
    audioPlayer.pause();
  }

  void stop() {
    _isPlaying.value = false;
    audioPlayer.stop();
  }

  Future<void> initAudio() async {
    final sounds = hiveLocalDb.appSound.values.toList();
    final frequencySound = sounds
        .where((element) =>
            element.isFrequency == model.frequency &&
            element.isBackgroundSound == model.backgroundSound)
        .single;
    try {
      await audioPlayer.setAudioSource(
        AudioSource.asset(frequencySound.soundPath!),
        preload: true,
      );
      await audioPlayer.setLoopMode(LoopMode.one);

      play();
    } catch (e) {
      // catch error
      debugPrint("Error loading audio source: $e");
    }
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
    audioPlayer.dispose();
    bannerAd?.dispose();
    super.onClose();
  }
}
