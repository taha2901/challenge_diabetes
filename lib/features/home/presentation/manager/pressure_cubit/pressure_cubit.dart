import 'package:bloc/bloc.dart';
import 'package:challenge_diabetes/core/helper/serverfailure.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/pressure_cubit/pressure_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';

class PressureCubit extends Cubit<PressureState> {
  static PressureCubit get(context) => BlocProvider.of(context);
  PressureCubit() : super(AddPressureSuccess());
  void pressure(
    String contraction,
    String extraversion,
    String heart,
    BuildContext context,
  ) async {
    emit(AddPressureLoading());
    try {
      var data = await DioHelper().addData(
        url: 'http://diabetes.runasp.net/api/Measurements/blood pressure',
        body: {
          "diastolic_pressure": contraction,
          "systolic_pressure": extraversion,
          "heart_rate": heart
        },
        contenttype: 'application/json',
        token: userToken!,
      );
      if (data.statusCode == 200) {
        emit(AddPressureSuccess());
      } else if (data.statusCode == 500) {
        emit(AddPressureError("internal server error, please try again"));
      }
    } catch (e) {
      if (e is DioException) {
        emit(AddPressureError(ServerFailure.fromDioError(e).errorMessage));
      } else {
        emit(AddPressureError(e.toString()));
      }
    }

   
  }
}



// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/helper/api.dart';
// import 'package:dio/dio.dart';
// import 'package:gluco/core/helper/serverfailure.dart';
// import 'package:gluco/core/widgets/network.dart';
// import 'package:gluco/features/home/presentation/manager/pressure_cubit/pressure_state.dart';

// class PressureCubit extends Cubit<PressureState> {
//   static PressureCubit get(context) => BlocProvider.of(context);
//   PressureCubit() : super(AddPressureSuccess());

//   void pressure(
//     String contraction,
//     String extraversion,
//     String heart,
//     BuildContext context,
//   ) async {
//     emit(AddPressureLoading());
//     try {
//       var data = await DioHelper().postData(
//         url: 'http://nouraapi.runasp.net/api/Measurements/blood pressure',
//         data: {
//           "diastolic_pressure": contraction,
//           "systolic_pressure": extraversion,
//           "heart_rate": heart,
//         },
//         token: userToken!,
//       );

//       if (data.statusCode == 200) {
//         emit(AddPressureSuccess());
//       } else if (data.statusCode == 500) {
//         emit(AddPressureError("Internal server error, please try again"));
//       } else {
//         emit(AddPressureError("Unexpected error, please try again"));
//       }
//     } catch (e) {
//       if (e is DioError) {
//         emit(AddPressureError(ServerFailure.fromDioError(e).errorMessage));
//       } else {
//         emit(AddPressureError(e.toString()));
//       }
//     }
//   }
// }
