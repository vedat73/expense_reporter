import 'package:expense_reporter/models/expense.dart';
import 'package:expense_reporter/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenseList;
  final void Function(Expense expense) onRemoveExpense;
  const ExpensesList(
      {super.key, required this.expenseList, required this.onRemoveExpense});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //builder constructor sayesinde ihtiyaç halinde liste oluşturulacak
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenseList[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenseList[index]);
        },
        child: ExpenseItem(
          expense: expenseList[index],
        ),
      ),
      itemCount: expenseList.length,
    );
  }
}
