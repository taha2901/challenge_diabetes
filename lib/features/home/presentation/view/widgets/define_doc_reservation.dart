import 'package:challenge_diabetes/features/home/data/doctor_model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DefineInReservation extends StatelessWidget {
  const DefineInReservation({
    super.key,
    required this.showDoc,
  });
  final DoctorModel showDoc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.011),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.015),
            ),
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.011),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(''),
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.height * 0.07,
                          backgroundImage: NetworkImage(
                            showDoc.photo.toString(),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height *
                                          0.03),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.005),
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.blue,
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.011,
                    ),
                    Text(
                      'د/ ${showDoc.userName} ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.3),
                          color: Colors.blue),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01),
                        child: const Icon(
                          Iconsax.coin,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'السعر',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${showDoc.detectionPrice} ج',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.grey),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.3),
                          color: Colors.blue),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.account_box_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'الخبره',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${showDoc.doctorspecialization}',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.grey),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.3),
                          color: Colors.blue),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Iconsax.location,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'الموقع',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${showDoc.address}',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.grey),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
