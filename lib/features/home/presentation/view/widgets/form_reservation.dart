// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/widgets/custom_button.dart';
// import 'package:gluco/core/widgets/custom_text_field.dart';
// import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
// import 'package:gluco/features/home/presentation/manager/reservation_cubit/reservation_cubit.dart';
// import 'package:gluco/features/home/presentation/view/widgets/DoctorReservation.dart';

// class formReservation extends StatelessWidget {
//   const formReservation({
//     super.key,
//     required this.showDoc,
//     required this.doctorId,
//   });
//   final DoctorModel showDoc;
//   final int doctorId;

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     var nameController = TextEditingController();
//     var sexController = TextEditingController();
//     var ageController = TextEditingController();
//     var phoneController = TextEditingController();
//     var timeController = TextEditingController(); // Controller for time

//     return BlocConsumer<ReservationCubit, ReservationState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Form(
//           key: formKey,
//           child: Column(
//             children: [
//               CustomTextField(
//                 hint: 'أدخل اسمك',
//                 controller: nameController,
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         CustomTextField(
//                           hint: 'الجنس',
//                           controller: sexController,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         CustomTextField(
//                           hint: 'أدخل عمرك',
//                           controller: ageController,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               CustomTextField(
//                 hint: 'أدخل رقم تلفونك',
//                 controller: phoneController,
//               ),
//               const SizedBox(height: 16),
//               CustomTextField(
//                 hint: 'أدخل الوقت (مثلاً 7:0)',
//                 controller: timeController,
//               ),
//               const SizedBox(height: 32),
//               state is ReservationLoaded
//                   ? const Center(child: CircularProgressIndicator())
//                   : CustomButton(
//                       text: 'التالي',
//                       onTap: () {
//                         if (formKey.currentState!.validate()) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DoctorReservation(
//                                 showDoc: showDoc,
//                                 username: nameController.text,
//                                 phone: phoneController.text,
//                                 age: ageController.text,
//                                 sex: sexController.text,
//                                 time: timeController.text,
//                                 doctorId: doctorId,
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                       color: Colors.blue,
//                       textcolor: Colors.white,
//                       width: double.infinity,
//                       circular: 0.0,
//                     ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }



import 'package:challenge_diabetes/core/widgets/custom_button.dart';
import 'package:challenge_diabetes/core/widgets/custom_text_field.dart';
import 'package:challenge_diabetes/features/home/data/doctor_model/doctor_model.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/reservation_cubit/reservation_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/DoctorReservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FormReservation extends StatelessWidget {
  const FormReservation({
    super.key,
    required this.showDoc,
    required this.doctorId,
  });

  final DoctorModel showDoc;
  final int doctorId;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var sexController = TextEditingController();
    var ageController = TextEditingController();
    var phoneController = TextEditingController();
    var dateController = TextEditingController();
    var timeController = TextEditingController();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      }
    }

    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null) {
        timeController.text = picked.format(context);
      }
    }

    return BlocConsumer<ReservationCubit, ReservationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                hint: 'أدخل اسمك',
                controller: nameController,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: 'الجنس',
                      controller: sexController,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      hint: 'أدخل عمرك',
                      controller: ageController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hint: 'أدخل رقم تلفونك',
                controller: phoneController,
              ),
              // const SizedBox(height: 16),
              // GestureDetector(
              //   onTap: () => _selectDate(context),
              //   child: AbsorbPointer(
              //     child: CustomTextField(
              //       hint: 'أدخل التاريخ',
              //       controller: dateController,
              //       suffixIcon:Icons.calendar_today,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectTime(context),
                child: AbsorbPointer(
                  child: CustomTextField(
                    hint: 'أدخل الوقت',
                    controller: timeController,
                    suffixIcon: Icons.access_time
                  ),
                ),
              ),
              const SizedBox(height: 32),
              state is ReservationLoaded
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      text: 'التالي',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorReservation(
                                showDoc: showDoc,
                                username: nameController.text,
                                phone: phoneController.text,
                                age: ageController.text,
                                sex: sexController.text,
                                time: timeController.text,
                                doctorId: doctorId,
                              ),
                            ),
                          );
                        }
                      },
                      color: Colors.blue,
                      textcolor: Colors.white,
                      width: double.infinity,
                      circular: 0.0,
                    ),
            ],
          ),
        );
      },
    );
  }
}
