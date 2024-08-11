import 'package:challenge_diabetes/core/widgets/custom_button.dart';
import 'package:challenge_diabetes/features/favourite/presentation/manager/cubit/favourite_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/confirm_reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_diabetes/features/home/data/doctor_model/doctor_model.dart';



class DoctorDetails extends StatelessWidget {
  const DoctorDetails({super.key, required this.docDetails, required this.doctorId});
  final DoctorModel docDetails;
  final int doctorId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.only(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(docDetails.photo.toString()),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(docDetails.userName.toString()),
                          Text(docDetails.doctorspecialization.toString()),
                          const Text('4.1  تقييم الزوار'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.location_on_sharp, size: 15),
                    const SizedBox(width: 8),
                    Text(docDetails.address.toString()),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.calendar_today, size: 15),
                    const SizedBox(width: 8),
                    Text(docDetails.appointment.toString()),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.shopping_cart_checkout_sharp, size: 15),
                    const SizedBox(width: 8),
                    Text('سعر الكشف:  ${docDetails.detectionPrice} ج'),
                  ],
                ),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.timer_outlined, size: 15),
                    SizedBox(width: 8),
                    Text('مده الانتظار: 20 دقيقه'),
                  ],
                ),
                const SizedBox(height: 8),
                CustomButton(
                  text: 'احجز',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ConfirmReservation(
                          showDoc: docDetails,
                          doctorId: doctorId,
                        ),
                      ),
                    );
                  },
                  color: Colors.blue,
                  textcolor: Colors.white,
                  width: double.infinity,
                  circular: 0.0,
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            return Positioned(
              left: MediaQuery.of(context).size.height * 0.014,
              top: MediaQuery.of(context).size.height * 0.014,
              child: GestureDetector(
                child: Icon(
                  Icons.favorite,
                  size: 23,
                  color: FavouriteCubit.get(context)
                          .favoriteID
                          .contains(docDetails.id.toString())
                      ? Colors.red
                      : Colors.grey,
                ),
                onTap: () {
                  if (FavouriteCubit.get(context).favoriteID.contains(docDetails.id.toString())) {
                    // الطبيب موجود بالفعل في المفضلة، قم بإزالته
                    FavouriteCubit.get(context).removeFromFavorites(doctorId: docDetails.id.toString());
                  } else {
                    // الطبيب غير موجود في المفضلة، قم بإضافته
                    FavouriteCubit.get(context).addToFavorites(doctorId: docDetails.id.toString());
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
// import 'package:gluco/features/home/presentation/view/widgets/confirm_reservation.dart';

// class DoctorDetails extends StatelessWidget {
//   const DoctorDetails({super.key, required this.docDetails, required this.doctorId});
//   final DoctorModel docDetails;
//   final int doctorId;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(docDetails.userName.toString()),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: NetworkImage(docDetails.photo.toString()),
//             ),
//             const SizedBox(height: 12),
//             Text(docDetails.userName.toString()),
//             Text(docDetails.doctorspecialization.toString()),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ConfirmReservation(
//                       showDoc: docDetails,
//                       doctorId: doctorId,
//                     ),
//                   ),
//                 );
//               },
//               child: const Text('حجز موعد'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }