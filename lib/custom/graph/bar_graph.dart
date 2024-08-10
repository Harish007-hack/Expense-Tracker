import 'package:expense_tracker/custom/graph/bar_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({super.key, required this.monthExpense});
  final List monthExpense;
  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
        janAmount: monthExpense[0],
        febAmount: monthExpense[1],
        marAmount: monthExpense[2],
        aprAmount: monthExpense[3],
        mayAmount: monthExpense[4],
        junAmount: monthExpense[5],
        julAmount: monthExpense[6],
        augAmount: monthExpense[7],
        septAmount: monthExpense[8],
        octAmount: monthExpense[9],
        novAmount: monthExpense[10],
        decAmount: monthExpense[11]);
    barData.initalizeBarData();
    return BarChart(
      BarChartData(
          maxY: 100,
          minY: 0,
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 23,
                  showTitles: true, getTitlesWidget: getBottomTitles),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          barGroups: barData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      width: 20,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(show: true,toY: 100,color: Theme.of(context).colorScheme.primary)
                    ),
                  ],
                ),
              )
              .toList()),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  var style = TextStyle(
    color: Colors.grey.shade400,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(
        'J',
        style: style,
      );
      break;
    case 1:
      text = Text(
        'F',
        style: style,
      );
      break;
    case 2:
      text = Text(
        'M',
        style: style,
      );
      break;
    case 3:
      text = Text(
        'A',
        style: style,
      );
      break;
    case 4:
      text = Text(
        'M',
        style: style,
      );
      break;
    case 5:
      text = Text(
        'J',
        style: style,
      );
      break;
    case 6:
      text = Text(
        'J',
        style: style,
      );
      break;
    case 7:
      text = Text(
        'A',
        style: style,
      );
      break;
    case 8:
      text = Text(
        'S',
        style: style,
      );
      break;
    case 9:
      text = Text(
        'O',
        style: style,
      );
      break;
    case 10:
      text = Text(
        'N',
        style: style,
      );
      break;
    case 11:
      text = Text(
        'D',
        style: style,
      );
      break;
    default:
      text = Text(
        "",
        style: style,
      );
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
