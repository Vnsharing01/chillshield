import 'package:chillshield/data/models/ultrasonic_model.dart';
import 'package:chillshield/shared/constants/get_it.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayController extends GetxController {
  // Add your controller variables and methods here
  late final UltrasonicModel model;

  // Example observable variable
  final _isPlaying = false.obs;
  bool get isPlaying => _isPlaying.value;

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void onInit() {
    model = Get.arguments as UltrasonicModel;
    initAudio();
    super.onInit();
  }

  void play() {
    _isPlaying.value = true;
    audioPlayer.play();
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

  @override
  void onClose() {
    // TODO: implement onClose
    audioPlayer.dispose();
    super.onClose();
  }
}
