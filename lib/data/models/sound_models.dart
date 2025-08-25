import 'package:chillshield/shared/enums/background_sound_enum.dart';
import 'package:chillshield/shared/enums/frequency_enum.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sound_models.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
@CopyWith()
class SoundModels extends HiveObject {
  @HiveField(0)
  final int? soundId; // id âm thanh
  @HiveField(1)
  final String? soundType; // loại âm thanh (tiếng suối, tiếng mưa)
  @HiveField(2)
  final String? soundName; // tên âm thanh
  @HiveField(3)
  final String? soundPath; // đường dẫn âm thanh
  @HiveField(4)
  final String? frequency; // tần số âm thanh

  SoundModels({
    this.soundId,
    this.soundType,
    this.soundName,
    this.soundPath,
    this.frequency,
  });

  BackgroundSoundEnum get isBackgroundSound =>
      BackgroundSoundEnumExtension.fromName(
          soundType ?? BackgroundSoundEnum.stream.name);
  FrequencyEnum get isFrequency =>
      FrequencyEnumExtension.fromName(frequency ?? FrequencyEnum.none.title);

  factory SoundModels.fromJson(Map<String, dynamic> json) =>
      _$SoundModelsFromJson(json);

  Map<String, dynamic> toJson() => _$SoundModelsToJson(this);
}
