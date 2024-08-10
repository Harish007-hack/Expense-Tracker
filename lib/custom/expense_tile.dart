import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key, required this.title, required this.expense});
  final String title;
  final String expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        title: Text(
          title,
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 20),
        ),
        trailing: Text(
          "\$ $expense",
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 15),
        ),
        tileColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
