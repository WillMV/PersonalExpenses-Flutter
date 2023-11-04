import 'package:flutter/material.dart';
import 'package:personal_expenses/models/expense_model.dart';

class ExpenseController extends ChangeNotifier {
  static ExpenseController instance = ExpenseController();

  List<Expense> expenses = [];

  void addExpense({
    required String title,
    required String value,
    required String date,
  }) {
    Expense expense = Expense(id: expenses.length, title: title, value: value);
    expenses.add(expense);
    notifyListeners();
  }

  removeExpense(Expense expense) {
    expenses.remove(expense);
    notifyListeners();
  }
}
