import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';
import 'package:personal_expenses/models/expense_model.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  List<Map<String, Object>> get _groupedExpenses {
    List<Expense> recentExpenses = ExpenseController.instance
        .getExpensesAfterDay(DateTime.now().subtract(const Duration(days: 7)));
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      final double sumValue = recentExpenses.map((expense) {
        if (weekDay.day == expense.date.day) return expense.value;
        return 0.0;
      }).reduce((a, b) => a + b);
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': sumValue.toStringAsFixed(2)
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: _groupedExpenses
            .map((e) => Text('${e['day']}: ${e['value']} '))
            .toList(),
      ),
    );
  }
}
