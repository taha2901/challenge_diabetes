import 'package:flutter/material.dart';

class DoctorOffer extends StatelessWidget {
  const DoctorOffer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF203640),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '(امراض القلب) دكتور احمد ضاحي',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.calendar_today,
                        color: Color(0xffFFCC70),
                        size: 15,
                      ),
                    ),
                    Text(
                       'السبت / 7 مساءا',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                     'الكشف بنصف الثمن 90 جنيه',
                      style: TextStyle(color: Colors.white),
                    ),
                    // Text(
                    //   '90 جنيه',
                    //   style: TextStyle(
                    //     color: Color(0xffFFCC70),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            Image.asset(
              'assets/DoctorAhmed.png',
            ),
          ],
        ),
      ),
    );
  }
}
