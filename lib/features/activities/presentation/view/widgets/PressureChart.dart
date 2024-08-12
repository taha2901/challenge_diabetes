import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Pressurechart extends StatelessWidget {
  List<FlSpot>? heart;
  List<FlSpot>? diastolicpressure;
  List<FlSpot>? systolicpressure;

  Pressurechart(this.heart,this.diastolicpressure,this.systolicpressure, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: heart!,
              isCurved: true,
              color: Colors.blue,
              barWidth: 4,
              belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
            ),
            LineChartBarData(
              spots: diastolicpressure!,
              isCurved: true,
              color: Colors.red,
              barWidth: 4,
              belowBarData: BarAreaData(show: true, color: Colors.red.withOpacity(0.3)),
            ),
            LineChartBarData(
              spots: systolicpressure!,
              isCurved: true,
              color: Colors.yellow,
              barWidth: 4,
              belowBarData: BarAreaData(show: true, color: Colors.yellow.withOpacity(0.3)),
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

