import 'package:expense_tracker/expenses_item.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/expense.dart';
import 'expenses_list/expenses_list.dart';

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

  void _openAddExpense() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            child: ListView.builder(
              itemCount: _registeredExpenses.length,
              itemBuilder: (ctx, index) {
                return ExpenseItem(expense: _registeredExpenses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
