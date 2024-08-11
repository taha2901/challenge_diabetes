import 'package:flutter/material.dart';

class ChartEmpty extends StatelessWidget {
  const ChartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'لا توجد بيانات',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}