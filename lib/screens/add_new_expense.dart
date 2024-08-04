import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class AddNewExpense extends StatefulWidget {
  const AddNewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _AddNewExpenseState();
  }
}

class _AddNewExpenseState extends State<AddNewExpense> {
  final _titleController = TextEditingController();
  final _amountController =
      TextEditingController(); // Declare and initialize _amountController
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose(); // Dispose _amountController
    super.dispose();
  }

  Future<void> _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      // You can use the picked date here
      setState(() {
        _selectedDate = picked;
      });

      log(picked.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _amountController, // Use _amountController here
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$ ',
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                flex: 2,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate != null
                            ? formatter.format(_selectedDate!)
                            : 'No Date Selected',
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(
                          Icons.calendar_month,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(children: [
            DropdownButton(
              value: _selectedCategory,
             // dropdownColor: Theme.of(context).colorScheme.primary,
              style: Theme.of(context).textTheme.bodyMedium,
              items: Category.values.map(
                (category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name.toUpperCase(),
                    ),
                  );
                },
              ).toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the AddNewExpense screen
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _submitExpenseData,
              child: const Text('Save Expense'),
            ),
          ]),
        ],
      ),
    );
  }

  void _submitExpenseData() {
    final enterAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enterAmount == null || enterAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      /// show error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invalid Input',
                style: Theme.of(context).textTheme.titleLarge),
            content: const Text(
                'Please make sure a valid title, amount, date, and category was entered.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Okay'))
            ],
          );
        },
      );
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enterAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }
}
