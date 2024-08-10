import 'package:cloud_firestore/cloud_firestore.dart';
class FirestoreServices{
  final expenseNote = FirebaseFirestore.instance.collection("Expense");

  //SET EXPENSE
  Future<void> setExpanse(String title,String expense,int date, int month, int year) async {
    await expenseNote.add({
      'title': title,
      'expense': expense,
      'day' : date,
      'month' : month,
      'year' : year,
    });
  }

  //GET EXPENSE
  Stream<QuerySnapshot<Map<String, dynamic>>> getExpenses() {
    return expenseNote.snapshots();
  }

  //UPDATE EXPENSE

  //DELETE EXPENSE



}