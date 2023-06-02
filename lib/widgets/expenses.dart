import 'package:expense_tracker/expenses_item.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'diesel',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.leisure, // Add a category for the expense
    ),
    Expense(
      title: 'socks',
      amount: 19.09,
      date: DateTime.now(),
      category: Category.leisure, // Add a category for the expense
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("The Chart"),
          ExpensesList(expenses: _registeredExpenses),
        ],
      ),
    );
  }
}
