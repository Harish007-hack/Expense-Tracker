import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/custom/expense_drawer.dart';
import 'package:expense_tracker/custom/expense_tile.dart';
import 'package:expense_tracker/custom/graph/bar_graph.dart';
import 'package:expense_tracker/screens/add_expanse.dart';
import 'package:expense_tracker/services/auth/firestore_services.dart';
import 'package:flutter/material.dart';

class ExpenseDashboard extends StatefulWidget {
  const ExpenseDashboard({super.key});

  @override
  State<ExpenseDashboard> createState() => _ExpenseDashboardState();
}

class _ExpenseDashboardState extends State<ExpenseDashboard> {
  final FirestoreServices _fireStoreServices = FirestoreServices();

  List<double> getMonthlyExpense(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot) {
    //sort the docs
    //use map to get int
    // and sum it up for the month
    List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    List<double> monthlyExpense = [];
    for (var i = 0; i < 12; i++) {
      double sumedUpValue = 0;
      List sortedList = snapshot
          .where((element) => element.data()['month'] == months[i])
          .toList();
      sortedList.isNotEmpty
          ? sortedList
              .map((e) => double.parse(e.data()['expense']))
              .toList()
              .forEach(
                (element) => sumedUpValue += element,
              )
          : null;
      monthlyExpense.add(sumedUpValue);
    }
    return monthlyExpense;
  }

  @override
  Widget build(BuildContext context) {
    List months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: _fireStoreServices.getExpenses(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
              final fectchedDataList = snapshot.data!.docs;
              final List<double> monthlyExpense =
                  getMonthlyExpense(fectchedDataList);
              return Text("\$ ${monthlyExpense[DateTime.now().month -1 ]}");
              }else{
                return const CircularProgressIndicator();
              }
            },
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                months[DateTime.now().month - 1],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
        drawer: const ExpenseDrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          tooltip: "Add an Expense",
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) => const AddExpanse(),
          ),
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: StreamBuilder(
            stream: _fireStoreServices.getExpenses(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final fectchedDataList = snapshot.data!.docs;
                final List<double> monthlyExpense =
                    getMonthlyExpense(fectchedDataList);
                return Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: BarGraph(
                          monthExpense: monthlyExpense,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: fectchedDataList.length,
                        itemBuilder: (context, index) {
                          return ExpenseTile(
                            title: "${fectchedDataList[index].data()['title']}",
                            expense:
                                "${fectchedDataList[index].data()['expense']}",
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
