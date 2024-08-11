import 'package:flutter/material.dart';
class MedicalRecords extends StatefulWidget {
  const MedicalRecords({super.key});
static String id = 'MedicalRecords';
  @override
  State<MedicalRecords> createState() => _MedicalRecordsState();
}

class _MedicalRecordsState extends State<MedicalRecords> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title:const Text("سجلاتى الطبيه"),
            centerTitle: true,
            leading:const Icon(Icons.arrow_forward_ios),
            bottom:const TabBar(
              dividerHeight: 5,
                indicatorWeight: 5,
                tabs: [
              Tab(child: Text("حجوزات الدكاتره"),),
              Tab(child: Text("التقرير"),),
              Tab(child: Text("تفاصيل اخرى"),)
            ]),
          ),
          body:const TabBarView(
              children: [
                Reservation(),
                Reports(),
                AnotherDetails(),
              ],),
        ),
      ),
    );
  }
}


class Reservation extends StatelessWidget {
  const Reservation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Doctor Reservation");
  }
}

class AnotherDetails extends StatelessWidget {
  const AnotherDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text("anotherDetials");
  }
}
class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("reports");
  }
}