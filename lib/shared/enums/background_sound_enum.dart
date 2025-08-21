enum BackgroundSoundEnum {
  rain,
  stream,
}

extension BackgroundSoundEnumExtension on BackgroundSoundEnum {
  String get displayName {
    switch (this) {
      case BackgroundSoundEnum.rain:
        return 'Tiếng Mưa';
      case BackgroundSoundEnum.stream:
        return 'Tiếng Suối';
    }
  }

  static BackgroundSoundEnum fromName(String name) {
    switch (name) {
      case 'Tiếng Mưa':
        return BackgroundSoundEnum.rain;
      default:
        return BackgroundSoundEnum.stream;
    }
  }
}
