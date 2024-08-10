import 'package:expense_tracker/custom/graph/indivial_bar.dart';
class BarData {
  BarData({
    required this.janAmount,
    required this.febAmount,
    required this.marAmount,
    required this.aprAmount,
    required this.mayAmount,
    required this.junAmount,
    required this.julAmount,
    required this.augAmount,
    required this.septAmount,
    required this.octAmount,
    required this.novAmount,
    required this.decAmount,
  });
  final double janAmount;
  final double febAmount;
  final double marAmount;
  final double aprAmount;
  final double mayAmount;
  final double junAmount;
  final double julAmount;
  final double augAmount;
  final double septAmount;
  final double octAmount;
  final double novAmount;
  final double decAmount;

  List<IndivialBar> barData = [];

  void initalizeBarData() {
    barData = [
      IndivialBar(x: 0, y: janAmount),
      IndivialBar(x: 1, y: febAmount),
      IndivialBar(x: 2, y: marAmount),
      IndivialBar(x: 3, y: aprAmount),
      IndivialBar(x: 4, y: mayAmount),
      IndivialBar(x: 5, y: junAmount),
      IndivialBar(x: 6, y: julAmount),
      IndivialBar(x: 7, y: augAmount),
      IndivialBar(x: 8, y: septAmount),
      IndivialBar(x: 9, y: octAmount),
      IndivialBar(x: 10, y: novAmount),
      IndivialBar(x: 11, y: decAmount),
    ];
  }
}
