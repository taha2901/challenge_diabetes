import 'package:challenge_diabetes/features/home/data/doctor_model/doctor_model.dart';
import 'package:flutter/material.dart';

class defineDoctor extends StatelessWidget {
  const defineDoctor({
    super.key,
    required this.showDoc,
  });
  final DoctorModel showDoc;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  showDoc.photo.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  showDoc.userName.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0xFF000000)),
                ),
                Text(
                  showDoc.doctorspecialization.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0xFF000000)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      showDoc.address.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      showDoc.appointment.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.shopping_cart_checkout_sharp,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "سعر الكشف",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                    Text(
                      " : ${showDoc.detectionPrice.toString()} جنيه ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 15,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "مده الانتظار",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                    Text(
                      " : 20 دقيقه",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 6,
            ),
            const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
