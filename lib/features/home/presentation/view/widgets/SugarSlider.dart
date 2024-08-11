import 'package:challenge_diabetes/core/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class Sugarslider extends StatelessWidget {
   Sugarslider({super.key, this.beforemeal,this.aftermeal,this.before,this.after});
double? beforemeal;
double? aftermeal;
String? before;
String? after;
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularPercentIndicator(
                radius: 58.0, // Outer circle with a larger radius
                lineWidth: 8.0,
                percent: aftermeal?? 0.0,
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$before/",style: const TextStyle(
                      color: Colors.black
                    ),),
                    Text("$after",style: const TextStyle(
                      color: Colors.black
                    ),)
                  ],
                ),
                progressColor: kSecondaryColor,
              ),
              CircularPercentIndicator(
                radius: 50.0, // Outer circle with a larger radius
                lineWidth: 8.0,
                percent: beforemeal?? 0.0,
                progressColor: const Color.fromARGB(255, 166, 18, 7),
              ),

            ],)
        );
  }
}