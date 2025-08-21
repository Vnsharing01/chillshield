enum FrequencyEnum {
  frequency20kHz(
    key: 1,
    title: '20 kHz',
  ),
  frequency30kHz(
    key: 2,
    title: '30 kHz',
  ),
  frequency42kHz(
    key: 3,
    title: '42 kHz',
  ),
  none(
    key: 0,
    title: 'None',
  );

  final int key;
  final String title;

  const FrequencyEnum({
    required this.key,
    required this.title,
  });
}

extension FrequencyEnumExtension on FrequencyEnum {
  String get name {
    switch (this) {
      case FrequencyEnum.frequency20kHz:
        return '20 kHz';
      case FrequencyEnum.frequency30kHz:
        return '30 kHz';
      case FrequencyEnum.frequency42kHz:
        return '42 kHz';
      case FrequencyEnum.none:
        return '';
    }
  }

  int get key {
    switch (this) {
      case FrequencyEnum.frequency20kHz:
        return 1;
      case FrequencyEnum.frequency30kHz:
        return 2;
      case FrequencyEnum.frequency42kHz:
        return 3;
      case FrequencyEnum.none:
        return 0;
    }
  }

  static FrequencyEnum fromKey(int key) {
    switch (key) {
      case 1:
        return FrequencyEnum.frequency20kHz;
      case 2:
        return FrequencyEnum.frequency30kHz;
      case 3:
        return FrequencyEnum.frequency42kHz;
      default:
        return FrequencyEnum.none;
    }
  }
}
