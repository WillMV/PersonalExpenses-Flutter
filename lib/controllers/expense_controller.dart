import 'package:flutter/material.dart';
import 'package:personal_expenses/models/expense_model.dart';

class ExpenseController extends ChangeNotifier {
  List<Expense> expenses = [];

  void addExpense({
    required String title,
    required double value,
    required String date,
  }) {
    Expense expense = Expense(id: expenses.length, title: title, value: value);
    expenses.add(expense);
    notifyListeners();
  }

  removeExpense() {
    throw NoSuchMethodError;
  }
}
