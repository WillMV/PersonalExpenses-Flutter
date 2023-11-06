import 'package:flutter/material.dart';
import 'package:personal_expenses/models/expense_model.dart';

class ExpenseController extends ChangeNotifier {
  static ExpenseController instance = ExpenseController();

  List<Expense> expenses = [];

  void addExpense({
    required String title,
    required String value,
    required DateTime date,
  }) {
    Expense expense =
        Expense(id: expenses.length, title: title, value: value, date: date);
    expenses.add(expense);
    notifyListeners();
  }

  void removeExpense(Expense expense) {
    expenses.remove(expense);
    notifyListeners();
  }

  List<Expense> getExpensesAfterDay(DateTime day) {
    return expenses.where((expense) => expense.date.isAfter(day)).toList();
  }
}
