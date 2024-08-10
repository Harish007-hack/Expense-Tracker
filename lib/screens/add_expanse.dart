import 'package:expense_tracker/models/expense_data.dart';
import 'package:expense_tracker/services/auth/firestore_services.dart';
import 'package:flutter/material.dart';

class AddExpanse extends StatefulWidget {
  const AddExpanse({super.key});

  @override
  State<AddExpanse> createState() => _AddExpanseState();
}

class _AddExpanseState extends State<AddExpanse> {
  ExpenseData expensesDetails = ExpenseData(
    expanseTitle: "",
    expenseAmount: "",
  );
  final formkey = GlobalKey<FormState>();
  final FirestoreServices _firestoreServices = FirestoreServices();

  void getDate() async {
    final date = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2030));
    if (date == null) return;
    setState(() {
      expensesDetails.date = date.day;
      expensesDetails.month = date.month;
      expensesDetails.year = date.year;
    });
  }

  void _saveInfo() {
    bool validate = formkey.currentState!.validate();
    if (!validate) return;
    formkey.currentState!.save();
    _firestoreServices.setExpanse(expensesDetails.expanseTitle, expensesDetails.expenseAmount, expensesDetails.date!,expensesDetails.month!,expensesDetails.year!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  maxLength: 100,
                  decoration: const InputDecoration(
                    hintText: "Expanse Title",
                  ),
                  onSaved: (newValue) {
                    expensesDetails.expanseTitle = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter proper values"),
                          duration: Duration(seconds: 5),
                        ),
                      );
                      return "Proper Values";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Amount",
                        ),
                        onSaved: (newValue) {
                          expensesDetails.expenseAmount = newValue!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty || int.tryParse(value) == null) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter proper values"),
                                duration: Duration(seconds: 5),
                              ),
                            );
                            return "Proper Values";
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () => getDate(),
                            child: Text(
                              expensesDetails.date == null
                                  ? "select date"
                                  : "${expensesDetails.date!}/${expensesDetails.month!}/${expensesDetails.year!}",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Text("Cancel")),
                    const SizedBox(
                      width: 15,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 195, 91, 214)),
                      onPressed: () {
                        _saveInfo();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Add Expense"),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
