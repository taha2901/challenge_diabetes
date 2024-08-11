import 'package:challenge_diabetes/features/home/data/doctor_model/doctor_model.dart';
import 'package:flutter/material.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({
    super.key,
    required this.docs,
  });
  final DoctorModel docs;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "عن الطبيب",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          docs.about.toString(),
        ),
      ],
    );
  }
}
