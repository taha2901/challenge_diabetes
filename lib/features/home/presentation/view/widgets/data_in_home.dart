// import 'package:easy_date_timeline/easy_date_timeline.dart';
// import 'package:flutter/material.dart';
// import 'package:gluco/core/widgets/constants.dart';

// class MyTimeLineHome extends StatelessWidget {
//   const MyTimeLineHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: 32.0,
//           ),
//           _changeDayStructureExample(),
//           const SizedBox(
//             height: 32.0,
//           ),
//         ],
//       ),
//     );
//   }

//   EasyDateTimeLine _changeDayStructureExample() {
//   return EasyDateTimeLine(
//     initialDate: DateTime.now(),
//     onDateChange: (selectedDate) {
//       //`selectedDate` the new date selected.
//     },
//     activeColor: kSecondaryColor,
//     headerProps: const EasyHeaderProps(
//       dateFormatter: DateFormatter.monthOnly(),
//     ),
//     dayProps: const EasyDayProps(
//       height: 56.0,
//       width: 56.0,
//       dayStructure: DayStructure.dayNumDayStr,
//       inactiveDayStyle: DayStyle(
//         borderRadius: 48.0,
//         dayNumStyle: TextStyle(
//           fontSize: 18.0,
//           color: Colors.black, // تغيير لون النص إلى الأبيض
//         ),
//         dayStrStyle: TextStyle(
//           fontSize: 12.0,
//           color: Colors.black, // تغيير لون النص إلى الأبيض
//         ),
//       ),
//       activeDayStyle: DayStyle(
//         dayNumStyle: TextStyle(
//           fontSize: 18.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white, // تغيير لون النص إلى الأبيض
//         ),
//         dayStrStyle: TextStyle(
//           fontSize: 12.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white, // تغيير لون النص إلى الأبيض
//         ),
//       ),
//     ),
//   );
// }


//   EasyDateTimeLine _localeExample() {
//     return EasyDateTimeLine(
//       initialDate: DateTime.now(),
//       onDateChange: (selectedDate) {
//         //`selectedDate` the new date selected.
//       },
//       // activeColor: Colors.grey,
//       locale: "ar",
//     );
//   }
// }

// class EasyInfiniteDateTimeLineExample extends StatefulWidget {
//   const EasyInfiniteDateTimeLineExample({super.key});

//   @override
//   State<EasyInfiniteDateTimeLineExample> createState() =>
//       _EasyInfiniteDateTimeLineExampleState();
// }

// class _EasyInfiniteDateTimeLineExampleState
//     extends State<EasyInfiniteDateTimeLineExample> {
//   final EasyInfiniteDateTimelineController _controller =
//       EasyInfiniteDateTimelineController();
//   DateTime? _focusDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         EasyInfiniteDateTimeLine(
//           controller: _controller,
//           firstDate: DateTime(2023),
//           focusDate: _focusDate,
//           lastDate: DateTime(2023, 12, 31),
//           onDateChange: (selectedDate) {
//             setState(() {
//               _focusDate = selectedDate;
//             });
//           },
//         ),
//         Column(
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 _controller.animateToFocusDate();
//               },
//               child: const Text('Animate To Focus Date'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _controller.animateToCurrentData();
//               },
//               child: const Text('Animate To Current Date'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _controller.animateToDate(DateTime(2023, 6, 5));
//               },
//               child: const Text('Animate To 2023-6-5 '),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:challenge_diabetes/core/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class MyTimeLineHome extends StatelessWidget {
  final Function(DateTime) onDateChange;

  const MyTimeLineHome({super.key, required this.onDateChange});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32.0,
          ),
          _changeDayStructureExample(),
          const SizedBox(
            height: 32.0,
          ),
        ],
      ),
    );
  }

  EasyDateTimeLine _changeDayStructureExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        // Pass the selected date to the callback function
        onDateChange(selectedDate);
      },
      activeColor: kSecondaryColor,
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
            color: Colors.black,
          ),
          dayStrStyle: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          dayStrStyle: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
