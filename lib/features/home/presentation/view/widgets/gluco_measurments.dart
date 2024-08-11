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
  List Design = [
    const PartScreenSuger("mg/dl", "قياس السكر"),
    PartScreenWeight("Kg", "قياس الوزن"),
    PartScreenPressure(
        "mmHg", "mmHg", "bpm", "الانقباض", "الانبساط", "معدل ضربات القلب")
  ];
  Widget uiDesign() {
    if (index == 0) {
      return Design[2];
    } else if (index == 1) {
      return Design[1];
    } else {
      return Design[0];
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: appBarTitle(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: MyDatePickerScreen()),
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
                      width: 55,
                      height: 55,
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
                    const Text("قياس الضغط")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
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
                    const Text("وزن")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
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
                    const Text("قياس السكر")
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
