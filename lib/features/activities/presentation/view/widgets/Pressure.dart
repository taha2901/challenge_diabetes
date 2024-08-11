import 'package:challenge_diabetes/core/widgets/constants.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/pressure_cubit/presssure_check_states.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/pressure_cubit/pressure_check_cubit.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/PressureCalender.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/PressureChart.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/chartempty.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/pressure_cubit/pressure_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pressure extends StatelessWidget {
  const Pressure({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PressureCubit(),
      child: Padding(
        padding: const EdgeInsets.only(right: 15, top: 20, left: 15),
        child: ListView(
          children: [
             Pressurecalender(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text("الانقباض"),
                    Padding(
                      padding: EdgeInsets.only(right: 5, left: 70),
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 5,
                      ),
                    ),
                    Text("الانبساط"),
                    Padding(
                      padding: EdgeInsets.only(right: 5, left: 70),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 5,
                      ),
                    ),
                    Text("ضربات القلب"),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 5,
                      ),
                    ),
                  ],
                ),
                BlocConsumer<PresssureCheckCubit,PresssureCheckStates>(
                    builder: (context, state) {
                      if (state is GetPresssureDatainitial) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GetPressureDataSuccess) {
                        List<FlSpot> heart = state.heart.asMap().entries.map((entry) {
                        int index = entry.key;
                        double value = entry.value.toDouble();
                        return FlSpot(index.toDouble(), value);
                      }).toList();
                      List<FlSpot> diastolicpressure = state.diastolicpressure.asMap().entries.map((entry) {
                        int index = entry.key;
                        double value = entry.value.toDouble();
                        return FlSpot(index.toDouble(), value);
                      }).toList();
                      List<FlSpot> systolicpressure = state.systolicpressure.asMap().entries.map((entry) {
                        int index = entry.key;
                        double value = entry.value.toDouble();
                        return FlSpot(index.toDouble(), value);
                      }).toList();
                      return Column(
                        children: [
                          SizedBox(
                             width: double.infinity, 
                            height: 300,
                            child: Pressurechart( heart, diastolicpressure, systolicpressure)
                            ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                              "تفاصيل اخرى",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                             ),
                              ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:state.pressurdata.length ,
                            itemBuilder:(context,index){
                              return Padding(
                                padding: const EdgeInsets.only(top:10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryLightColor,
                                   borderRadius: BorderRadius.circular(10)
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child:Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("الانقباض:"),
                                          Text(state.pressurdata[index].diastolicpressure.toString()),
                                          const Padding(padding:EdgeInsets.only(left: 150)),
                                          const Text("الانبساط:"),
                                          Text(state.pressurdata[index].systolicpressure.toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("عدد ضربات القلب:"),
                                          Text(state.pressurdata[index].heartrate.toString()),
                                          const Padding(padding:EdgeInsets.only(left: 110)),
                                          const Text("الوقت:"),
                                          Text(state.pressurdata[index].time!.minute.toString()),
                                          const Text(":"),
                                          Text(state.pressurdata[index].time!.hour.toString()),
                                
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text("حاله الضغط:"),
                                          Text(state.pressurdata[index].status.toString())
                                        ],
                                      )
                                    ],
                                  ) ,
                                ),
                              );
                            }
                            )
                            ],)
                        ],);
                      } else {
                        return const SizedBox(
                            width: double.infinity, 
                            height: 300,
                            child: Chartempty());
                      }
                    },
                    listener: (contex, state) {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}


