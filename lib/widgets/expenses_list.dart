import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';
import 'package:personal_expenses/widgets/expense_card.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required ExpenseController expenseController,
  }) : _expenseController = expenseController;

  final ExpenseController _expenseController;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: _expenseController.expenses
            .map((e) => ExpenseCard(expense: e))
            .toList());
  }
}
