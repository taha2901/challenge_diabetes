
import 'package:challenge_diabetes/features/activities/presentation/view/widgets/ChartSteps.dart';
import 'package:flutter/material.dart';

class NumOfSteps extends StatelessWidget {
   const NumOfSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'assets/img_3.png',
                width: 94,
                height: 120,
              ),
            ),
            const Padding(padding: EdgeInsets.only(right: 10)),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("199 من الخطوات ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const Text("الهدف 8000 من الخطوات",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Container(
                    padding: const EdgeInsets.only(top: 20, right: 30),
                    width: 250,
                    child: const Text(
                        "لم تحقق حته ربع هدفك اليوم انت تعلم ان الرياضه ضروريه و مهمه لاجلك"),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
        //  MyTimeLineHome(),
        SizedBox(
            height: 212,
            child: ChartSteps(
                const [3.0, 5.0, 8.0, 10.0, 12.0, 14.0, 16.0, 18.0, 20.0])),
        const Text(
          "اليوم",
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}
