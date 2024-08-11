import 'package:challenge_diabetes/core/widgets/custom_button.dart';
import 'package:challenge_diabetes/core/widgets/custom_show_toast.dart';
import 'package:challenge_diabetes/features/home/data/doctor_model/doctor_model.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/reservation_cubit/reservation_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/BarApp.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/custom_icon.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/define_doc_reservation.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/time_line_cal_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DoctorReservation extends StatefulWidget {
  const DoctorReservation({
    super.key,
    required this.showDoc,
    required this.username,
    required this.sex,
    required this.age,
    required this.phone,
    required this.time,
    required this.doctorId,
  });

  final DoctorModel showDoc;
  final String username;
  final String sex;
  final String age;
  final String phone;
  final String time;
  final int doctorId;

  @override
  // ignore: library_private_types_in_public_api
  _DoctorReservationState createState() => _DoctorReservationState();
}

class _DoctorReservationState extends State<DoctorReservation> {
  DateTime? _selectedDate;

  void _onDateChange(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BarApp(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.favorite,
                  text: 'حجز',
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                        child: DefineInReservation(showDoc: widget.showDoc),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Text(
                        "الايام",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      DateSelectionPage(onDateChange: _onDateChange),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: BlocConsumer<ReservationCubit,
                                  ReservationState>(
                                listener: (context, state) {
                                  if (state is ReservationSuccess) {
                                    showToast(
                                      msg: 'Reservation Success',
                                      state: ToastStates.SUCCESS,
                                    );
                                  } else if (state is ReservationFailure) {
                                    showToast(
                                      msg: 'Reservation Failed',
                                      state: ToastStates.ERROR,
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  if (state is ReservationLoaded) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return CustomButton(
                                    text: 'تأكيد',
                                    onTap: () {
                                      if (_selectedDate != null &&
                                          widget.age.isNotEmpty) {
                                        final String arabicDigits = widget.age
                                            .replaceAllMapped(
                                                RegExp(r'[٠١٢٣٤٥٦٧٨٩]'),
                                                (match) {
                                          final String digit = match.group(0)!;
                                          return String.fromCharCode(
                                            digit.codeUnitAt(0) -
                                                0x0660 +
                                                0x0030,
                                          );
                                        });

                                        int ageInt =
                                            int.tryParse(arabicDigits) ?? 0;

                                        if (ageInt > 0) {
                                          ReservationCubit.get(context)
                                              .userReservation(
                                            username: widget.username,
                                            phone: widget.phone,
                                            age: ageInt,
                                            sex: widget.sex,
                                            date: _selectedDate!
                                                .toLocal()
                                                .toString()
                                                .split(' ')[0],
                                            time: widget.time,
                                            docId: widget.doctorId,
                                          );
                                        } else {
                                          showToast(
                                            msg: 'برجاء إدخال عمر صحيح',
                                            state: ToastStates.ERROR,
                                          );
                                        }
                                      } else {
                                        showToast(
                                          msg:
                                              'برجاء إدخال جميع البيانات المطلوبة',
                                          state: ToastStates.ERROR,
                                        );
                                      }
                                    },
                                    color: Colors.blue,
                                    textcolor: Colors.white,
                                    width: double.infinity,
                                    circular: 0.0,
                                  );
                                },
                              ),
                            ),
                            const CustomIcon(
                              icon: Iconsax.message,
                              color: Colors.blue,
                              colorIcon: Colors.white,
                              circular: 30,
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     const Text("التعليقات"),
                      //     const Spacer(),
                      //     IconButton(
                      //       onPressed: () {},
                      //       icon: const Icon(Icons.add, color: Colors.blue),
                      //     ),
                      //     const Text(
                      //       "اضافه تعليق",
                      //       style: TextStyle(color: Colors.blue),
                      //     ),
                      //   ],
                      // ),
                      // ListView.builder(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemCount: 5,
                      //   itemBuilder: (context, index) => const Comments(),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
