import 'dart:async';

import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDay = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            // onChanged: _saveTitleInput,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  // onChanged: _saveTitleInput,
                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: "\$ ",
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "No date selected"
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) {
                        return;
                      }
                      _selectedCategory = value;
                    });
                    ;
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
