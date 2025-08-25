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

  String get name {
    switch (this) {
      case BackgroundSoundEnum.rain:
        return 'Rain';
      case BackgroundSoundEnum.stream:
        return 'Stream';
    }
  }

  static BackgroundSoundEnum fromdisplayName(String name) {
    switch (name) {
      case 'Tiếng Mưa':
        return BackgroundSoundEnum.rain;
      default:
        return BackgroundSoundEnum.stream;
    }
  }
  static BackgroundSoundEnum fromName(String name) {
    switch (name) {
      case 'Rain':
        return BackgroundSoundEnum.rain;
      default:
        return BackgroundSoundEnum.stream;
    }
  }
}
