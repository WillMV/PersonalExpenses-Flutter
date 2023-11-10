import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';
import 'package:personal_expenses/models/expense_model.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Chart extends StatefulWidget {
  final ExpenseController expenseController;
  const Chart({
    Key? key,
    required this.expenseController,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, Object>> get _groupedExpenses {
    List<Expense> recentExpenses = widget.expenseController
        .getExpensesAfterDay(DateTime.now().subtract(const Duration(days: 7)));
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      final double sumValue = recentExpenses.map((expense) {
        if (weekDay.day == expense.date.day) return expense.value;
        return 0.0;
      }).reduce((a, b) => a + b);
      return {'day': DateFormat.E().format(weekDay)[0], 'value': sumValue};
    }).reversed.toList();
  }

  double get weekValueTotal {
    return _groupedExpenses.fold(
        0, (sum, e) => sum + double.parse(e['value'].toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedExpenses
              .map((e) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      value: e['value'] as double,
                      label: e['day'].toString(),
                      percentage:
                          double.parse(e['value'].toString()) / weekValueTotal,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
