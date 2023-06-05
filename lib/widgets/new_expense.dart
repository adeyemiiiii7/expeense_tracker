import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  void _saveTitleInput(String InputValue) {}
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: _saveTitleInput,
              maxLength: 50,
              decoration: InputDecoration(label: Text('Title')),
            )
          ],
        ));
  }
}
