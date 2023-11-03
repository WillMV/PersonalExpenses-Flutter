import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2)),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text("R\$ ${widget.expense.value.toStringAsFixed(2)}")),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.expense.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  DateFormat('dd MMM y').format(widget.expense.date),
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
