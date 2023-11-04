import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/expense_controller.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({
    super.key,
  });

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final ExpenseController _expenseController = ExpenseController.instance;

  final formKey = GlobalKey<FormState>();

  final title = TextEditingController();

  final value = TextEditingController();

  final date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onSubmit() {
      if (formKey.currentState!.validate()) {
        _expenseController.addExpense(
            title: title.text, value: value.text, date: date.text);
        title.clear();
        value.clear();
        date.clear();
        Navigator.of(context).pop();
      }
    }

    return Form(
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
                  enableSuggestions: true,
                  onFieldSubmitted: (_) => onSubmit(),
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
                  onFieldSubmitted: (_) => onSubmit(),
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
                    onPressed: () => onSubmit(),
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Add'),
                    ))),
              )
            ],
          ),
        ));
  }
}
