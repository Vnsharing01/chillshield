import 'package:chillshield/data/models/sound_models.dart';
import 'package:chillshield/shared/enums/background_sound_enum.dart';
import 'package:chillshield/shared/enums/frequency_enum.dart';
import 'package:hive/hive.dart';

class HiveLocalDb {
  final appSound = Hive.box<SoundModels>('soundBox');

  late List<SoundModels> sounds;

  Future<void> initSound() async {
    if (appSound.isNotEmpty) {
      return;
    }
    sounds = [
      SoundModels(
        soundId: 1,
        soundType: BackgroundSoundEnum.stream.name,
        soundName: 'Stream Flow 20kHz',
        soundPath: 'assets/sounds/stream/stream_20kHz.wav',
        frequency: FrequencyEnum.frequency20kHz.title,
      ),
      SoundModels(
        soundId: 2,
        soundType: BackgroundSoundEnum.stream.name,
        soundName: 'Stream Flow 30kHz',
        soundPath: 'assets/sounds/stream/stream_30kHz.wav',
        frequency: FrequencyEnum.frequency30kHz.title,
      ),
      SoundModels(
        soundId: 3,
        soundType: BackgroundSoundEnum.stream.name,
        soundName: 'Stream Flow 42kHz',
        soundPath: 'assets/sounds/stream/stream_42kHz.wav',
        frequency: FrequencyEnum.frequency42kHz.title,
      ),
      SoundModels(
        soundId: 4,
        soundType: BackgroundSoundEnum.rain.name,
        soundName: 'Rain 20kHz',
        soundPath: 'assets/sounds/rain/rain_20kHz.wav',
        frequency: FrequencyEnum.frequency20kHz.title,
      ),
      SoundModels(
        soundId: 5,
        soundType: BackgroundSoundEnum.rain.name,
        soundName: 'Rain 30kHz',
        soundPath: 'assets/sounds/rain/rain_30kHz.wav',
        frequency: FrequencyEnum.frequency30kHz.title,
      ),
      SoundModels(
        soundId: 6,
        soundType: BackgroundSoundEnum.rain.name,
        soundName: 'Rain 42kHz',
        soundPath: 'assets/sounds/rain/rain_42kHz.wav',
        frequency: FrequencyEnum.frequency42kHz.title,
      ),
    ];

    await appSound.addAll(sounds);
  }
}
