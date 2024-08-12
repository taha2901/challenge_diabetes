import 'package:challenge_diabetes/features/home/presentation/view/widgets/data_picker_screen.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/part_screen_pressure.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/part_screen_suger.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/part_screen_weight.dart';
import 'package:flutter/material.dart';

class GlucoseMeasurement extends StatefulWidget {
  const GlucoseMeasurement({super.key});

  @override
  State<GlucoseMeasurement> createState() => _MyAppState();
}

class _MyAppState extends State<GlucoseMeasurement> {
  Color _color1 = Colors.grey;
  Color _color2 = Colors.grey;
  Color _color3 = Colors.grey;
  int? index = 2;
  List<bool> selecteditem = [false, false, false];
  List design = [
    const PartScreenSuger("mg/dl", "قياس السكر"),
    PartScreenWeight("Kg", "قياس الوزن"),
    PartScreenPressure(
        "mmHg", "mmHg", "bpm", "الانقباض", "الانبساط", "معدل ضربات القلب")
  ];
  Widget uiDesign() {
    if (index == 0) {
      return design[2];
    } else if (index == 1) {
      return design[1];
    } else {
      return design[0];
    }
  }

  Widget appBarTitle() {
    if (index == 0) {
      return const Text("قياس الضغط");
    } else if (index == 1) {
      return const Text("الوزن");
    } else {
      return const Text("قياس السكر");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBarTitle(),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            )),
            SliverToBoxAdapter(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.14,
                      height: MediaQuery.of(context).size.width * 0.14,
                      decoration: BoxDecoration(
                        color: _color1,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: IconButton(
                          onPressed: () {
                            index = 0;
                            _toggleColor(1);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.add_box_outlined,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "قياس الضغط",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.14,
                      height: MediaQuery.of(context).size.width * 0.14,
                      decoration: BoxDecoration(
                        color: _color2,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: IconButton(
                          onPressed: () {
                            index = 1;
                            _toggleColor(2);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.add_box_sharp,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "وزن",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.14,
                      height: MediaQuery.of(context).size.width * 0.14,
                      decoration: BoxDecoration(
                        color: _color3,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: IconButton(
                          onPressed: () {
                            index = 2;
                            _toggleColor(3);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.add_call,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "قياس السكر",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    )
                  ],
                ),
              ],
            )),
            SliverToBoxAdapter(
              child: uiDesign(),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleColor(int buttonNumber) {
    setState(() {
      _color1 = (buttonNumber == 1) ? Colors.blue : Colors.grey;
      _color2 = (buttonNumber == 2) ? Colors.blue : Colors.grey;
      _color3 = (buttonNumber == 3) ? Colors.blue : Colors.grey;
    });
  }
}
