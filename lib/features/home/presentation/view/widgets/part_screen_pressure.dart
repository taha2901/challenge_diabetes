import 'package:challenge_diabetes/core/widgets/custom_button.dart';
import 'package:challenge_diabetes/core/widgets/custom_show_toast.dart';
import 'package:challenge_diabetes/core/widgets/custom_text_field.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/pressure_cubit/presssure_check_states.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/pressure_cubit/pressure_check_cubit.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/PressureChart.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/chartempty.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/pressure_cubit/pressure_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/pressure_cubit/pressure_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class PartScreenPressure extends StatelessWidget {
  String? text1;
  String? text2;
  String? text3;
  String? text4;
  String? text5;
  String? text6;

  PartScreenPressure(
      this.text1, this.text2, this.text3, this.text4, this.text5, this.text6,
      {super.key});

  TextEditingController contractController = TextEditingController();
  TextEditingController extraversionController = TextEditingController();
  TextEditingController heartController = TextEditingController();

  GlobalKey<FormState> valid = GlobalKey();

  @override
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";

    //هنا كان multiblco (PresssureCheckCubit()..fetchpressuredata , PressureCubit)
    return BlocConsumer<PressureCubit, PressureState>(
      listener: (context, state) {
        if (state is AddPressureSuccess) {
          showToast(msg: "added", state: ToastStates.SUCCESS);
          PresssureCheckCubit().fetchpressuredata(formattedDate);
        } else if (state is AddPressureError) {
          showToast(msg: state.errormessage, state: ToastStates.ERROR);
        } else {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Form(
                  key: valid,
                  child: Column(
                    children: [
                      CustomTextField(
                        inputType: TextInputType.number,
                        suffixText: text1,
                        hint: text4,
                        controller: contractController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.03,
                      ),
                      CustomTextField(
                        inputType: TextInputType.number,
                        suffixText: text2,
                        hint: text5,
                        controller: extraversionController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.03,
                      ),
                      CustomTextField(
                        inputType: TextInputType.number,
                        suffixText: text3,
                        hint: text6,
                        controller: heartController,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              GestureDetector(
                onTap: () async {
                  if (valid.currentState!.validate()) {
                    BlocProvider.of<PressureCubit>(context).pressure(
                        contractController.text,
                        extraversionController.text,
                        heartController.text,
                        context);
                    DateTime currentDate = DateTime.now();
                    String formattedDate =
                        "${currentDate.year}-${currentDate.month}-${currentDate.day}";
                    BlocProvider.of<PresssureCheckCubit>(context)
                        .fetchpressuredata(formattedDate);
                  }
                },
                child: Column(
                  children: [
                    CustomButton(
                      text: 'حفظ',
                      circular: 5,
                      color: Colors.blue,
                      textcolor: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
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
                    BlocConsumer<PresssureCheckCubit, PresssureCheckStates>(
                      builder: (context, state) {
                        if (state is GetPresssureDatainitial) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is GetPressureDataSuccess) {
                          List<FlSpot> heart =
                              state.heart.asMap().entries.map((entry) {
                            int index = entry.key;
                            double value = entry.value.toDouble();
                            return FlSpot(index.toDouble(), value);
                          }).toList();
                          List<FlSpot> diastolicpressure = state
                              .diastolicpressure
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            double value = entry.value.toDouble();
                            return FlSpot(index.toDouble(), value);
                          }).toList();
                          List<FlSpot> systolicpressure = state.systolicpressure
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            double value = entry.value.toDouble();
                            return FlSpot(index.toDouble(), value);
                          }).toList();
                          return Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 300,
                                child: Pressurechart(
                                    heart, diastolicpressure, systolicpressure),
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
                      listener: (context, state) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
