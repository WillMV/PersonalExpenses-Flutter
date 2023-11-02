import 'package:flutter/material.dart';
import 'package:personal_expenses/models/expense_model.dart';

class ExpenseCard extends StatefulWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(widget.expense.value.toString()),
          Column(
            children: [Text(widget.expense.title), Text(widget.expense.date)],
          )
        ],
      ),
    );
  }
}
