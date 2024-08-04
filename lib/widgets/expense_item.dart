import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("\$${expense.amount}"),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcon[expense.category]),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(expense.formatDate),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
