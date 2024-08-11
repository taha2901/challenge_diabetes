import 'package:flutter/material.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/AlertFirst.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/Pressure.dart';
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/Weight.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});
  static String id = 'Activities';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
            title: const Text("الانشطه"),
            centerTitle: true,
            bottom: const TabBar(
              dividerHeight: 5,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  child: Text("سكر"),
                ),
                Tab(
                  child: Text("ضغط"),
                ),
                Tab(
                  child: Text("وزن"),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              AlertFirst(),
              Pressure(),
              Weight(),
            ],
          ),
        ),
      ),
    );
  }
}
