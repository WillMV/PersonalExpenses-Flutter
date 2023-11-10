import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/expenses_list.dart';

class PortraitHomePage extends StatelessWidget {
  const PortraitHomePage({
    super.key,
    required this.availableHeight,
    required ExpenseController expenseController,
  }) : _expenseController = expenseController;

  final double availableHeight;
  final ExpenseController _expenseController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: availableHeight * 0.3,
            child: Chart(expenseController: _expenseController),
          ),
          SizedBox(
            height: availableHeight * 0.7,
            child: ExpensesList(expenseController: _expenseController),
          ),
        ],
      ),
    );
  }
}
