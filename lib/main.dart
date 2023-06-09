import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 237, 237, 237));

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          useMaterial3: true,
          // scaffoldBackgroundColor: Color.fromARGB(255, 237, 237, 237)
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: const Color.fromARGB(255, 237, 237, 237),
            foregroundColor: kColorScheme.primaryContainer,
          )),
      home: const Expenses(),
    ),
  ); //check things you can declare in theme
}
