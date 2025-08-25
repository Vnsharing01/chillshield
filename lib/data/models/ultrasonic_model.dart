import 'package:chillshield/shared/enums/background_sound_enum.dart';
import 'package:chillshield/shared/enums/duration_enum.dart';
import 'package:chillshield/shared/enums/frequency_enum.dart';
import 'package:chillshield/shared/enums/insect_enum.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ultrasonic_model.g.dart';

@JsonSerializable()
@CopyWith()
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

  factory UltrasonicModel.fromJson(Map<String, dynamic> json) =>
      _$UltrasonicModelFromJson(json);

  Map<String, dynamic> toJson() => _$UltrasonicModelToJson(this);
}
