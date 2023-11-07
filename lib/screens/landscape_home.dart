import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/expenses_list.dart';

class LandscapeHomePage extends StatelessWidget {
  const LandscapeHomePage({
    super.key,
    required this.availableHeight,
    required ExpenseController expenseController,
  }) : _expenseController = expenseController;

  final double availableHeight;
  final ExpenseController _expenseController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: availableHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: availableHeight * 0.8,
              child: Chart(expenseController: _expenseController)),
          Expanded(
              child: ExpensesList(
            expenseController: _expenseController,
          ))
        ],
      ),
    );
  }
}
