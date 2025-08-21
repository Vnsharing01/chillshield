import 'package:chillshield/shared/enums/background_sound_enum.dart';
import 'package:chillshield/shared/enums/duration_enum.dart';
import 'package:chillshield/shared/enums/frequency_enum.dart';
import 'package:chillshield/shared/enums/insect_enum.dart';

class UltrasonicModel {
  final BackgroundSoundEnum? backgroundSound;
  final InsectEnum? insect;
  final DurationEnum? time;
  final FrequencyEnum? frequency;

  UltrasonicModel({
    this.backgroundSound,
    this.insect,
    this.time,
    this.frequency,
  });

  factory UltrasonicModel.fromJson(Map<String, dynamic> json) {
    return UltrasonicModel(
      backgroundSound: json['backgroundSound'] as BackgroundSoundEnum,
      insect: json['insect'] as InsectEnum,
      time: json['time'] as DurationEnum,
      frequency: json['frequency'] as FrequencyEnum,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backgroundSound': backgroundSound?.name,
      'insect': insect,
      'time': time,
      'frequency': frequency?.name,
    };
  }
}
