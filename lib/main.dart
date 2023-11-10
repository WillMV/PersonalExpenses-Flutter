import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';
import 'package:personal_expenses/screens/landscape_home.dart';
import 'package:personal_expenses/screens/protrait_home.dart';
import 'package:personal_expenses/widgets/empty_expenses.dart';
import 'package:personal_expenses/widgets/expense_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(fontFamily: 'Quicksand');
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            primary: Colors.deepPurple, secondary: Colors.deepOrangeAccent),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ExpenseController _expenseController = ExpenseController.instance;

  bool showChart = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final availableWidth = mediaQuery.size.width;

    final isSmallScreen = !isPortrait
        ? mediaQuery.size.width < 800
            ? true
            : false
        : false;

    final appbar = AppBar(
      title: const Text('Expenses'),
      centerTitle: true,
      actions: [
        if (!isPortrait & isSmallScreen)
          IconButton(
              onPressed: () {
                setState(() {
                  showChart = !showChart;
                });
              },
              icon: Icon(showChart
                  ? Icons.line_weight_sharp
                  : Icons.bar_chart_rounded))
      ],
    );

    final double availableHeight = mediaQuery.size.height -
        appbar.preferredSize.height -
        mediaQuery.padding.top;

    return Scaffold(
      appBar: appbar,
      body: AnimatedBuilder(
        animation: _expenseController,
        builder: (context, child) {
          return _expenseController.expenses.isEmpty
              ? const EmptyExpenses()
              : isPortrait
                  ? PortraitHomePage(
                      availableHeight: availableHeight,
                      expenseController: _expenseController,
                    )
                  : LandscapeHomePage(
                      showChart: showChart,
                      isSmallScreen: isSmallScreen,
                      availableHeight: availableHeight,
                      availableWidth: availableWidth,
                      expenseController: _expenseController,
                    );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const ExpenseForm(),
          )
        },
        tooltip: 'add expense',
        child: const Icon(Icons.add),
      ),
    );
  }
}
