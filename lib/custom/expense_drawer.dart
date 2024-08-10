import 'package:expense_tracker/screens/about.dart';
import 'package:flutter/material.dart';

class ExpenseDrawer extends StatelessWidget {
  const ExpenseDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.attach_money,
              size: 50,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                leading: Icon(Icons.house),
                title: Text("H O M E"),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AboutMe(),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text("A B O U T"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
