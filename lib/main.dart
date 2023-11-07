import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: const Text('Expenses'),
      centerTitle: true,
    );
    final double availableheight = MediaQuery.of(context).size.height -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appbar,
      body: AnimatedBuilder(
        animation: _expenseController,
        builder: (context, child) {
          return _expenseController.expenses.isEmpty
              ? const EmptyExpenses()
              : PortraitHomePage(
                  availableheight: availableheight,
                  expenseController: _expenseController,
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            builder: (context) => const ExpenseForm(),
          )
        },
        tooltip: 'add expense',
        child: const Icon(Icons.add),
      ),
    );
  }
}
