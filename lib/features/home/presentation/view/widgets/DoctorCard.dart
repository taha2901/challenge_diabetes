import 'package:challenge_diabetes/features/home/data/doctor_model/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doc});
  final DoctorModel doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.31,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                doc.photo.toString(),
                fit: BoxFit.fill,
              ),
            ),
            Text(doc.userName.toString(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    fontWeight: FontWeight.bold)),
            Text(doc.doctorspecialization.toString(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035)),
            Text(doc.address.toString(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035)),
            Text(
              doc.appointment.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035),
            ),
          ],
        ),
      ),
    );
  }
}
