class ExpenseData {
  ExpenseData({
    required this.expanseTitle,
    required this.expenseAmount,
    this.date,
  });
  String expanseTitle;
  String expenseAmount;
  int? date;
  int? month;
  int? year;
}
