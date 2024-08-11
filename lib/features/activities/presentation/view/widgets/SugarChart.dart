import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Sugarchart extends StatelessWidget {
  final List<FlSpot> beforemeal;
  final List<FlSpot> aftermeal;

  const Sugarchart(this.beforemeal,this.aftermeal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40,left: 10),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: beforemeal,
              isCurved: true,
              color: Colors.blue,
              barWidth: 4,
              belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
            ),
            LineChartBarData(
              spots: aftermeal,
              isCurved: true,
              color: Colors.red,
              barWidth: 4,
              belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
            ),
          ],
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 35,
                ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
                reservedSize: 35,
                ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                ),
            ),
          ),
          gridData: const FlGridData(
            show: true,
            ),
          borderData: FlBorderData(
           show: true,
            border: const Border(
              left: BorderSide.none,
              top: BorderSide.none,
              right: BorderSide(
                color: Color(0xff37434d),
                width: 1,
          ),
          bottom: BorderSide(
                color: Color(0xff37434d),
                width: 1,
          ),
            ),
          ),
        )
      ),
    );
  }
}

