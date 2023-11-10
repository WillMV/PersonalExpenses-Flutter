import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  final title = TextEditingController(text: 'mercado');

  final value = TextEditingController(text: '12.3');

  DateTime? _date;

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void onSubmit() {
      if (formKey.currentState!.validate() && _date != null) {
        _expenseController.addExpense(
            title: title.text, value: value.text, date: _date!);
        title.clear();
        value.clear();
        Navigator.of(context).pop();
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_date == null
                          ? 'No date selected'
                          : DateFormat('dd MMM y').format(_date!)),
                      ElevatedButton(
                          onPressed: _selectDate,
                          child: const Text('Select date'))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => onSubmit(),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Add Expense'),
                      ))),
                )
              ],
            )),
      ),
    );
  }
}
