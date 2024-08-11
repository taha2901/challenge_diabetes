import 'package:challenge_diabetes/features/activities/data/BarData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChartSteps extends StatelessWidget {
   ChartSteps(this.weeklysummary, {super.key});
List weeklysummary;
  @override
  Widget build(BuildContext context) {
    BarData mybardata=BarData(
         Firstday:weeklysummary[0],
        secondday:weeklysummary[1],
        thirsday:weeklysummary[2],
        fourthday:weeklysummary[3],
        fifthday:weeklysummary[4],
        sixthday:weeklysummary[5],
        sevenday:weeklysummary[6],
        eightday:weeklysummary[7],
        nineday:weeklysummary[8],
    );
    mybardata.initializeBarData();
    return BarChart(
        BarChartData(
           maxY: 100,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(
              show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),

          ),
          barGroups: mybardata.bardata.map(
                  (data) => BarChartGroupData(
                      x: data.x!,
                    barRods: [
                      BarChartRodData(
                          toY: data.y!,
                        color: Colors.grey[800],
                        width: 10,
                        borderRadius: BorderRadius.circular(3),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 100,
                          color: Colors.grey[200]
                        )
                      )
                    ]
                  )).toList()
        )
    );
  }
}
