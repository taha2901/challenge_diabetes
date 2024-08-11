import 'package:challenge_diabetes/core/widgets/constants.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/pressure_cubit/pressure_check_cubit.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/suger_cubit/sugar_check_states.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/weight_cubit/weight_check_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/SugarSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TwoSquareContainer extends StatelessWidget {
  const TwoSquareContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SugarCheckCubit()..getsugarlevel(formattedDate),
        ),
        BlocProvider(
          create: (context) =>
              PresssureCheckCubit()..fetchpressuredata(formattedDate),
        ),
        BlocProvider(
          create: (context) =>
              WeightCheckCubit()..fetchweightdata(formattedDate),
        ),
      ],
      child: Row(
        children: [
          Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kPrimaryLightColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      BlocConsumer<SugarCheckCubit, SugarCheckStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is HaveData &&
                              state.beforemeal.isNotEmpty &&
                              state.aftermeal.isEmpty) {
                            double beforemeal = (state
                                .beforemeal[(state.beforemeal.length) - 1]);
                            if (beforemeal > 300) {
                              beforemeal = 300 / 300;
                            } else {
                              beforemeal = beforemeal / 300;
                            }

                            return Sugarslider(
                              beforemeal: beforemeal,
                              aftermeal: 0.0,
                              before: (state
                                      .beforemeal[(state.beforemeal.length) - 1]
                                      .toInt())
                                  .toString(),
                              after: "0",
                            );
                          } else if (state is HaveData &&
                              state.aftermeal.isNotEmpty &&
                              state.beforemeal.isEmpty) {
                            double aftermeal =
                                (state.aftermeal[(state.aftermeal.length) - 1]);
                            if (aftermeal > 300) {
                              aftermeal = 300 / 300;
                            } else {
                              aftermeal = aftermeal / 300;
                            }
                            return Sugarslider(
                              
                              beforemeal: 0.0,
                              aftermeal: aftermeal,
                              before: "0",
                              after: (state
                                      .aftermeal[(state.aftermeal.length) - 1]
                                      .toInt())
                                  .toString(),
                            );
                          } else if (state is HaveData &&
                              state.aftermeal.isNotEmpty &&
                              state.beforemeal.isNotEmpty) {
                            double beforemeal = (state
                                .beforemeal[(state.beforemeal.length) - 1]);
                            double aftermeal =
                                (state.aftermeal[(state.aftermeal.length) - 1]);
                            if (beforemeal > 300 && aftermeal > 300) {
                              beforemeal = 300 / 300;
                              aftermeal = 300 / 300;
                            } else if (beforemeal > 300 && aftermeal < 300) {
                              beforemeal = 300 / 300;
                              aftermeal = aftermeal / 300;
                            } else if (aftermeal > 300 && beforemeal < 300) {
                              aftermeal = 300 / 300;
                              beforemeal = beforemeal / 300;
                            } else {
                              aftermeal = aftermeal / 300;
                              beforemeal = beforemeal / 300;
                            }
                            return Sugarslider(
                              beforemeal: beforemeal,
                              aftermeal: aftermeal,
                              before: ((state.beforemeal[
                                          (state.beforemeal.length) - 1])
                                      .toInt())
                                  .toString(),
                              after: (state
                                      .aftermeal[(state.aftermeal.length) - 1]
                                      .toInt())
                                  .toString(),
                            );
                          } else {
                            return Center(
                                child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularPercentIndicator(
                                  radius:
                                      50.0, // Outer circle with a larger radius
                                  lineWidth: 6.0,
                                  percent: 0.0,
                                  // center: Text("100%"),
                                  progressColor: Colors.blue,
                                ),
                                CircularPercentIndicator(
                                  radius:
                                      45.0, // Outer circle with a larger radius
                                  lineWidth: 6.0,
                                  percent: 0.0,
                                  center: const Text("..."),
                                  progressColor: Colors
                                      .yellow, // Make background transparent to avoid overlap issues
                                ),
                              ],
                            ));
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                              ),
                            ),
                            const Text("صائم"),
                            const Spacer(),
                            Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                              ),
                            ),
                            const Text("فاطر"),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}