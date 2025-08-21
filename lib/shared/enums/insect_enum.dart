enum InsectEnum {
  mosquito(
    key: 1,
    name: 'Muỗi',
  ),
  cockroach(
    key: 2,
    name: 'Gián',
  ),
  orther(
    key: 3,
    name: 'Khác',
  ),
  none(
    key: 0,
    name: '',
  );

  final int key;
  final String name;

  const InsectEnum({
    required this.key,
    required this.name,
  });
}

extension InsectExtension on InsectEnum {
  String get name {
    switch (this) {
      case InsectEnum.mosquito:
        return 'Muỗi';
      case InsectEnum.cockroach:
        return 'Gián';
      case InsectEnum.orther:
        return 'Khác';
      case InsectEnum.none:
        return '';
    }
  }

  int get key {
    switch (this) {
      case InsectEnum.mosquito:
        return 1;
      case InsectEnum.cockroach:
        return 2;
      case InsectEnum.orther:
        return 3;
      case InsectEnum.none:
        return 0;
    }
  }
  static InsectEnum fromKey(int key) {
    switch (key) {
      case 1:
        return InsectEnum.mosquito;
      case 2:
        return InsectEnum.cockroach;
      case 3:
        return InsectEnum.orther;
      default:
        return InsectEnum.none;
    }
  }
}
