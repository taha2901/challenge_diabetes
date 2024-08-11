import 'package:challenge_diabetes/features/activities/presentation/manager/pressure_cubit/pressure_check_cubit.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Pressurecalender extends StatelessWidget {
  Pressurecalender({super.key});
  String? formattedDate;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32.0,
          ),
          _changeDayStructureExample(context),
          const SizedBox(
            height: 32.0,
          ),
        ],
      ),
    );
  }

  EasyDateTimeLine _changeDayStructureExample(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";

    var pressureCheckCubit = context.read<PresssureCheckCubit>();
    pressureCheckCubit.fetchpressuredata(formattedDate);
    return EasyDateTimeLine(
      initialDate: currentDate,
      onDateChange: (selectedDate) async {
        String formattedDate =
            "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
        var pressureCheckCubit = context.read<PresssureCheckCubit>();
        pressureCheckCubit.fetchpressuredata(formattedDate);
        debugPrint(formattedDate);
      },
      activeColor: const Color(0xffFFBF9B),
      headerProps: const EasyHeaderProps(
        dateFormatter: DateFormatter.monthOnly(),
      ),
      dayProps: const EasyDayProps(
        height: 56.0,
        width: 56.0,
        dayStructure: DayStructure.dayNumDayStr,
        inactiveDayStyle: DayStyle(
          borderRadius: 48.0,
          dayNumStyle: TextStyle(
            fontSize: 18.0,
          ),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

