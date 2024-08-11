import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/home/data/reservation_model/reservation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());

  static ReservationCubit get(context) => BlocProvider.of(context);

  void userReservation({
    required String username,
    required String phone,
    required int age,
    required String sex,
    required String date,
    required int docId,
     required String time,
    
  }) {
    emit(ReservationLoaded());

    final requestData = {
      'username': username,
      'phone': phone,
      'age': age,
      'sex': sex,
      'date': date,
      'time': time,
    };

    debugPrint('Request Data: $requestData');
    final url = 'Doctors/Reservation?id=$docId';
    debugPrint('Request URL: $url');

    DioHelper()
        .postData(
      url: url,
      token: 'Bearer $userToken',
      data: requestData,
    )
        .then((value) {
      final reservationModel = ReservationModel.fromJson(value.data);
      emit(ReservationSuccess(reservationModel));
    }).catchError((onError) {
      debugPrint('Error in Reservation cubit: ${onError.toString()}');
      emit(ReservationFailure(onError.toString()));
    });
  }
}
