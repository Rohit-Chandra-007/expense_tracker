import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenseList, required this.onRemoveExpense});

  final List<Expense> expenseList;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) => Dismissible(
        //direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          onRemoveExpense(expenseList[index]);
        },
        key: ValueKey(expenseList[index]),
        child: ExpenseItem(
          expense: expenseList[index],
        ),
      ),
    );
  }
}
