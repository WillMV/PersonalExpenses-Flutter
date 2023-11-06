class Expense {
  final int id;
  late final String _title;
  late final String _value;
  late final DateTime _date;

  Expense({required this.id, required title, required value, required date}) {
    _title = title;
    _value = value;
    _date = date;
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

  DateTime get date {
    return _date;
  }
}
