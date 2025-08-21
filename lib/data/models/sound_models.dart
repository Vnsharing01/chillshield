class SoundModels {
  final int ?soundId;       // id âm thanh
  final String ?soundType;  // loại âm thanh (tiếng suối, tiếng mưa)
  final String ?soundName;  // tên âm thanh
  final String ?soundPath;  // đường dẫn âm thanh
  final String ?frequency;  // tần số âm thanh

  SoundModels({
    this.soundId,
    this.soundType,
    this.soundName,
    this.soundPath,
    this.frequency,
  });

  factory SoundModels.fromJson(Map<String, dynamic> json) {
    return SoundModels(
      soundId: json['sound_id'] as int?,
      soundType: json['sound_type'] as String?,
      soundName: json['sound_name'] as String?,
      soundPath: json['sound_path'] as String?,
      frequency: json['frequency'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'sound_id': soundId,
      'sound_type': soundType,
      'sound_name': soundName,
      'sound_path': soundPath,
      'frequency': frequency,
    };
  }
}