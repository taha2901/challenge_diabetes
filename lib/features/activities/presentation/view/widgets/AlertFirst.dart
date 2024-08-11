

import 'package:challenge_diabetes/core/widgets/constants.dart';
import 'package:challenge_diabetes/core/widgets/custom_show_toast.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/suger_cubit/sugar_check_states.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/SugarCalender.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/SugarChart.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/chartempty.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertFirst extends StatelessWidget {
  const AlertFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SugarCheckCubit(),
      child: Padding(
        padding: const EdgeInsets.only(right: 15, top: 20, left: 15),
        child: ListView(
          children: [
           Sugarcalender(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text("بعد الوجبه"),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 5,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 50)),
                    Text("قبل الوجبه"),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 5,
                      ),
                    ),
                  ],
                ),
                BlocConsumer<SugarCheckCubit, SugarCheckStates>(
                  listener: (context, state) {
                    if (state is NothaveData) {
                      showToast(
                          msg: 'لا يوجد بيانات', state: ToastStates.ERROR);
                    }
                    if (state is HaveData) {
                      showToast(
                          msg: 'تم تحديث البيانات', state: ToastStates.SUCCESS);
                    }
                  },
                  builder: (context, state) {
                    if (state is SugarCheckinitial) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HaveData) {
                      List<FlSpot> beforemeal =
                          state.beforemeal.asMap().entries.map((entry) {
                        int index = entry.key;
                        double value = entry.value;
                        return FlSpot(index.toDouble(), value);
                      }).toList();
                      List<FlSpot> aftermeal =
                          state.aftermeal.asMap().entries.map((entry) {
                        int index = entry.key;
                        double value = entry.value;
                        return FlSpot(index.toDouble(), value);
                      }).toList();
                      return Column(
                        children: [
                          SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: Sugarchart(beforemeal,aftermeal)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "تفاصيل اخرى",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.sugardata.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: kPrimaryLightColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Text("مستوى السكر:"),
                                                Text(state.sugardata[index]
                                                    .sugar_reading
                                                    .toString()),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 50)),
                                                const Text("الوقت:"),
                                                Text(state.sugardata[index]
                                                    .measurement_date
                                                    .toString()),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text("الحاله:"),
                                                Text(state
                                                    .sugardata[index].status
                                                    .toString()),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 50)),
                                                const Text("الساعه:"),
                                                Text(state.sugardata[index]
                                                    .time!.minute
                                                    .toString()),
                                                const Text(":"),
                                                Text(state
                                                    .sugardata[index].time!.hour
                                                    .toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          )
                        ],
                      );
                    } else {
                      return SizedBox(
                          width: double.infinity, 
                          height: 300,
                          child: Chartempty());
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
