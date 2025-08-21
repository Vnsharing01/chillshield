enum DurationEnum {
  fifteenMinute(
    key: 1,
    title: '15 Phút',
    value: 15,
  ),
  thirtyMinute(
    key: 2,
    title: '30 Phút',
    value: 30,
  ),
  oneHour(
    key: 3,
    title: '1 Giờ',
    value: 60,
  );

  final int key;
  final String title;
  final int value;

  const DurationEnum({
    required this.key,
    required this.title,
    required this.value,
  });
}

extension DurationEnumExtension on DurationEnum {
  String get name {
    switch (this) {
      case DurationEnum.fifteenMinute:
        return '15 Phút';
      case DurationEnum.thirtyMinute:
        return '30 Phút';
      case DurationEnum.oneHour:
        return '1 Giờ';
    }
  }

  int get key {
    switch (this) {
      case DurationEnum.fifteenMinute:
        return 1;
      case DurationEnum.thirtyMinute:
        return 2;
      case DurationEnum.oneHour:
        return 3;
    }
  }

  int get value {
    switch (this) {
      case DurationEnum.fifteenMinute:
        return 15;
      case DurationEnum.thirtyMinute:
        return 30;
      case DurationEnum.oneHour:
        return 60;
    }
  }

  static DurationEnum fromKey(int key) {
    switch (key) {
      case 1:
        return DurationEnum.fifteenMinute;
      case 2:
        return DurationEnum.thirtyMinute;
      case 3:
        return DurationEnum.oneHour;
      default:
        return DurationEnum.fifteenMinute;
    }
  }
}
