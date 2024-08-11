// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/widgets/custom_button.dart';
// import 'package:gluco/core/widgets/custom_show_toast.dart';
// import 'package:gluco/core/widgets/custom_text_field.dart';
// import 'package:gluco/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
// import 'package:gluco/features/activities/presentation/manager/suger_cubit/sugar_check_states.dart';
// import 'package:gluco/features/activities/presentation/view/widgets/SugarChart.dart';
// import 'package:gluco/features/activities/presentation/view/widgets/chartempty.dart';
// import 'package:gluco/features/home/presentation/manager/suger_cubit/sugar_cubit.dart';
// import 'package:gluco/features/home/presentation/manager/suger_cubit/sugar_state.dart';
// import 'package:gluco/features/home/presentation/view/widgets/field+drop_down.dart';

// class PartScreenSuger extends StatefulWidget {
//   final String? text2;
//   final String text3;

//   const PartScreenSuger(this.text2, this.text3);

//   @override
//   State<PartScreenSuger> createState() => _PartScreenSugerState();
// }

// class _PartScreenSugerState extends State<PartScreenSuger> {
//   String? meal;
//   final GlobalKey<FormState> valid = GlobalKey<FormState>();
//   TextEditingController sugarlevelController = TextEditingController();
//   void onmeal(String? mealname) {
//     meal = mealname;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // DateTime currentDate = DateTime.now();
//     // String formattedDate =
//     //     "${currentDate.year}-${currentDate.month}-${currentDate.day}";

//     return SingleChildScrollView(
//       child: Column(children: [
//         BlocConsumer<SugarCubit, Sugarstate>(
//           listener: (context, state) {
//             if (state is AddSugarSuccess) {
//               showToast(msg: 'Added successfully', state: ToastStates.SUCCESS);
//             } else if (state is AddSugarError) {
//               showToast(msg: 'state.errormessage', state: ToastStates.ERROR);
//             }
//           },
//           builder: (context, state) {
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 24),
//                     child: Form(
//                       key: valid,
//                       child: Column(
//                         children: [
//                           CustomTextField(
//                             inputType: TextInputType.number,
//                             suffixText: widget.text2,
//                             hint: widget.text3,
//                             controller: sugarlevelController,
//                           ),
//                           // Textfieldnumber(
//                           //   text2: widget.text2.toString(),
//                           //   text3: widget.text3,
//                           //   controller: sugarlevelController,
//                           // ),
//                           const SizedBox(height: 16),
//                           CustomTextFieldDropdown(mealname: onmeal),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
                  

//                   state is AddSugarLoading
//                       ? const Center(child: CircularProgressIndicator())
//                       : CustomButton(
//                           onTap: () {
//                             if (valid.currentState!.validate()) {
//                               SugarCubit()
//                                   .sugar(sugarlevelController.text, meal!);
//                               DateTime currentDate = DateTime.now();
//                               String formattedDate =
//                                   "${currentDate.year}-${currentDate.month}-${currentDate.day}";
//                               print(formattedDate);
//                               BlocProvider.of<SugarCheckCubit>(context)
//                                   .getsugarlevel(formattedDate);
//                             }
//                           },
//                           text: 'حفظ',
//                           circular: 5,
//                           color: Colors.blue,
//                           textcolor: Colors.white,
//                         ),
//                   const SizedBox(height: 16),
//                   const Row(
//                     children: [
//                       Text("بعد الوجبه"),
//                       Padding(
//                         padding: EdgeInsets.only(right: 5),
//                         child: CircleAvatar(
//                           backgroundColor: Colors.red,
//                           radius: 5,
//                         ),
//                       ),
//                       Padding(padding: EdgeInsets.only(right: 50)),
//                       Text("قبل الوجبه"),
//                       Padding(
//                         padding: EdgeInsets.only(right: 5),
//                         child: CircleAvatar(
//                           backgroundColor: Colors.blue,
//                           radius: 5,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         BlocConsumer<SugarCheckCubit, SugarCheckStates>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             if (state is SugarCheckinitial) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is haveData) {
//               List<FlSpot> beforemeal =
//                   state.beforemeal.asMap().entries.map((entry) {
//                 int index = entry.key;
//                 double value = entry.value;
//                 return FlSpot(index.toDouble(), value);
//               }).toList();
//               List<FlSpot> aftermeal =
//                   state.aftermeal.asMap().entries.map((entry) {
//                 int index = entry.key;
//                 double value = entry.value;
//                 return FlSpot(index.toDouble(), value);
//               }).toList();

//               return Column(
//                 children: [
//                   SizedBox(
//                       width: double.infinity,
//                       height: 300,
//                       child: Sugarchart(beforemeal, aftermeal)),
//                 ],
//               );
//             } else {
//               return SizedBox(
//                   width: double.infinity, height: 300, child: Chartempty());
//             }
//           },
//         ),
//       ]),
//     );
//   }
// }



import 'package:challenge_diabetes/core/widgets/custom_button.dart';
import 'package:challenge_diabetes/core/widgets/custom_show_toast.dart';
import 'package:challenge_diabetes/core/widgets/custom_text_field.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/suger_cubit/sugar_check_states.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/SugarChart.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/chartempty.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/suger_cubit/sugar_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/suger_cubit/sugar_state.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/field+drop_down.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PartScreenSuger extends StatefulWidget {
  final String? text2;
  final String text3;

  const PartScreenSuger(this.text2, this.text3, {super.key});

  @override
  State<PartScreenSuger> createState() => _PartScreenSugerState();
}

class _PartScreenSugerState extends State<PartScreenSuger> {
  String? meal;
  final GlobalKey<FormState> valid = GlobalKey<FormState>();
  TextEditingController sugarlevelController = TextEditingController();

  void onmeal(String? mealname) {
    meal = mealname;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        BlocConsumer<SugarCubit, Sugarstate>(
          listener: (context, state) {
            if (state is AddSugarSuccess) {
              showToast(msg: 'Added successfully', state: ToastStates.SUCCESS);
            } else if (state is AddSugarError) {
              showToast(msg: 'state.errormessage', state: ToastStates.ERROR);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Form(
                      key: valid,
                      child: Column(
                        children: [
                          CustomTextField(
                            inputType: TextInputType.number,
                            suffixText: widget.text2,
                            hint: widget.text3,
                            controller: sugarlevelController,
                          ),
                          const SizedBox(height: 16),
                          CustomTextFieldDropdown(mealname: onmeal),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  state is AddSugarLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          onTap: () {
                            if (valid.currentState!.validate()) {
                              SugarCubit()
                                  .sugar(sugarlevelController.text, meal!,context);
                              DateTime currentDate = DateTime.now();
                              String formattedDate =
                                  "${currentDate.year}-${currentDate.month}-${currentDate.day}";
                              debugPrint(formattedDate);
                              BlocProvider.of<SugarCheckCubit>(context)
                                  .getsugarlevel(formattedDate);
                            }
                          },
                          text: 'حفظ',
                          circular: 5,
                          color: Colors.blue,
                          textcolor: Colors.white,
                        ),
                  const SizedBox(height: 16),
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
                ],
              ),
            );
          },
        ),
        BlocConsumer<SugarCheckCubit, SugarCheckStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SugarCheckloading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HaveData) {
              List<FlSpot> beforemeal = state.beforemeal.asMap().entries.map((entry) {
                int index = entry.key;
                double value = entry.value;
                return FlSpot(index.toDouble(), value);
              }).toList();

              List<FlSpot> aftermeal = state.aftermeal.asMap().entries.map((entry) {
                int index = entry.key;
                double value = entry.value;
                return FlSpot(index.toDouble(), value);
              }).toList();

              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Sugarchart(beforemeal, aftermeal),
                  ),
                ],
              );
            } else {
              return const SizedBox(
                width: double.infinity,
                height: 300,
                child: Chartempty(),
              );
            }
          },
        ),
      ]),
    );
  }
}
