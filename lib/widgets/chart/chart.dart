// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/chart/chart_bar.dart';
import 'package:expense_tracker/models/expense.dart' as ExpenseModel;

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.expenses}) : super(key: key);

  final List<ExpenseModel.Expense> expenses;

  List<ExpenseModel.ExpenseSummary> get summary {
    return [
      ExpenseModel.ExpenseSummary.forCategory(
          expenses, ExpenseModel.Category.food),
      ExpenseModel.ExpenseSummary.forCategory(
          expenses, ExpenseModel.Category.leisure),
      ExpenseModel.ExpenseSummary.forCategory(
          expenses, ExpenseModel.Category.travel),
      ExpenseModel.ExpenseSummary.forCategory(
          expenses, ExpenseModel.Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final summary in summary) {
      if (summary.totalExpenses > maxTotalExpense) {
        maxTotalExpense = summary.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final summary in summary) // alternative to map()
                  ChartBar(
                    fill: summary.totalExpenses == 0
                        ? 0
                        : summary.totalExpenses / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: summary
                .map(
                  (summary) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        ExpenseModel.categoryIcons[summary.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
