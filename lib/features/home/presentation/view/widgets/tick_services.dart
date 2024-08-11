import 'package:challenge_diabetes/features/home/presentation/view/widgets/doctor.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/gluco_measurments.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicksOfServices extends StatelessWidget {
  const TicksOfServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Services(
            text: 'قياس السكر',
            icon: FontAwesomeIcons.hospital,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GlucoseMeasurement()),
              );
            },
          ),
        ),
        const SizedBox(width: 23),
        Expanded(
          child: Services(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Doctor(),
                ),
              );
            },
            text: 'دكتور',
            icon: FontAwesomeIcons.userDoctor,
          ),
        ),
        const SizedBox(width: 23),
        const Expanded(
          child: Services(
            text: 'رياضه',
            icon: Icons.run_circle_sharp,
          ),
        ),
      ],
    );
  }
}
