class Expense {
  final int id;
  late final String _title;
  late final String _value;
  final DateTime date = DateTime.now();

  Expense({
    required this.id,
    required title,
    required value,
  }) {
    _title = title;
    _value = value;
  }

  String get title {
    final String title =
        _title.replaceFirst(_title[0], _title[0].toUpperCase());
    return title;
  }

  double get value {
    final double value = double.parse(_value.replaceFirst(RegExp(r','), '.'));
    return value;
  }
}
