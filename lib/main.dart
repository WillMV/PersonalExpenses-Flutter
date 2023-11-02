import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';
import 'package:personal_expenses/widgets/expense_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
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

  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final value = TextEditingController();
  final date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: _expenseController,
        builder: (context, child) {
          return Stack(children: [
            Column(
                children: _expenseController.expenses
                    .map((e) => ExpenseCard(expense: e))
                    .toList()),
          ]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            builder: (context) => Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: title,
                          autocorrect: true,
                          validator: (value) =>
                              value!.isEmpty ? 'Plese insert a title' : null,
                          decoration: const InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: value,
                          keyboardType: TextInputType.number,
                          autocorrect: true,
                          validator: (value) =>
                              value!.isEmpty ? 'Please insert a value' : null,
                          decoration: const InputDecoration(
                            labelText: 'Value',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: date,
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length < 8 ||
                                value.length > 10) {
                              return "Plese insert a valid date in format DD/MM/YYYY";
                            }
                            return null;
                          },
                          autocorrect: true,
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                _expenseController.addExpense(
                                    title: title.text,
                                    value: double.parse(value.text),
                                    date: date.text);
                              }
                            },
                            child: const Center(
                                child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text('Add'),
                            ))),
                      )
                    ],
                  ),
                )),
          )
        },
        tooltip: 'add expense',
        child: const Icon(Icons.add),
      ),
    );
  }
}
