import 'package:challenge_diabetes/features/home/presentation/view/widgets/tick_heart.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/two_square_container.dart';
import 'package:flutter/material.dart';

import 'package:challenge_diabetes/features/home/presentation/view/widgets/data_in_home.dart';

import 'widgets/tick_services.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> _refresh() async {
    // محاكاة تأخير لتحميل البيانات
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  void _handleDateChange(DateTime selectedDate) {
    // تنفيذ أي عملية عند تغيير التاريخ
    print('التاريخ المحدد: ${selectedDate.toLocal()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'تتبع الانشطه',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            SliverToBoxAdapter(
              child: MyTimeLineHome(
                onDateChange: _handleDateChange,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            const SliverToBoxAdapter(
              child: TwoSquareContainer(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            SliverToBoxAdapter(
              child: TicksOfHeart(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 18,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'الخدمات',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            const SliverToBoxAdapter(
              child: TicksOfServices(),
            ),
          ],
        ),
      ),
    );
  }
}
