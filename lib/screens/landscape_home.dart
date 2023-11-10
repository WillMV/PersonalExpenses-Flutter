import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/expenses_list.dart';

class LandscapeHomePage extends StatelessWidget {
  const LandscapeHomePage({
    super.key,
    required this.availableHeight,
    required ExpenseController expenseController,
    required this.showChart,
    required this.isSmallScreen,
    required this.availableWidth,
  }) : _expenseController = expenseController;

  final ExpenseController _expenseController;

  final double availableHeight;
  final double availableWidth;

  final bool showChart;
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: availableHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if ((showChart && isSmallScreen) || !isSmallScreen)
            SizedBox(
                height: availableHeight * 0.7,
                width: isSmallScreen ? availableWidth : availableWidth * 0.5,
                child: Chart(expenseController: _expenseController)),
          if (!isSmallScreen || (isSmallScreen & !showChart))
            Expanded(
                child: ExpensesList(
              expenseController: _expenseController,
            ))
        ],
      ),
    );
  }
}
