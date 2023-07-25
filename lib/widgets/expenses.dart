import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpensesState extends StatefulWidget {
  const ExpensesState({super.key});

  @override
  State<ExpensesState> createState() => _ExpensesStateState();
}

class _ExpensesStateState extends State<ExpensesState> {
  final List<Expense> _registerExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema",
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            child: ExpensesList(expenses: _registerExpenses),
          )
        ],
      ),
    );
  }
}
