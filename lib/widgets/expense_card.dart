import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';
import 'package:personal_expenses/models/expense_model.dart';

class ExpenseCard extends StatefulWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  ExpenseController expenseController = ExpenseController.instance;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: FittedBox(
            child: Text(
              widget.expense.value.toStringAsFixed(2),
            ),
          ),
        ),
      ),
      title: Text(widget.expense.title),
      subtitle: Text((DateFormat('d MMM y').format(widget.expense.date))),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => expenseController.removeExpense(widget.expense),
      ),
    ));
  }
}
