import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/helper/serverfailure.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/sport_cubit/sport_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';


class SportCubit extends Cubit<SportState> {
  SportCubit() : super(AddWeightSuccess());
  static SportCubit get(context) => BlocProvider.of(context);
  void sport(String weight, String sport) async {
    try {
      var data = await DioHelper().addData(
          url: 'http://diabetes.runasp.net/api/Measurements/weight',
          body: {"weight": weight, "sport": true},
          Contenttype: 'application/json',
          token: userToken!);
      if (data.statusCode == 201) {
        emit(AddWeightSuccess());
      } else if (data.statusCode == 500) {
        emit(AddWeightError("inteernal server error, please try again"));
      }
    } on DioException catch (e) {
      emit(AddWeightError(ServerFailure.fromDioError(e).errorMessage));
    } catch (e) {
      emit(AddWeightError(e.toString()));
    }
  }
}


// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/helper/api.dart';
// import 'package:gluco/core/helper/serverfailure.dart';
// import 'package:dio/dio.dart';
// import 'package:gluco/core/widgets/network.dart';
// import 'package:gluco/features/home/presentation/manager/sport_cubit/sport_state.dart';

// class SportCubit extends Cubit<SportState> {
//   SportCubit() : super(AddWeightSuccess());
//   static SportCubit get(context) => BlocProvider.of(context);

//   void sport(String weight, String sport) async {
//     emit(AddWeightLoading());

//     try {
//       var data = await DioHelper().postData(
//         url: 'http://nouraapi.runasp.net/api/Measurements/weight',
//         data: {
//           "weight": weight,
//           "sport": true
//         },
//         token: userToken!,
//       );

//       if (data.statusCode == 201) {
//         emit(AddWeightSuccess());
//       } else if (data.statusCode == 500) {
//         emit(AddWeightError("Internal server error, please try again"));
//       } else {
//         emit(AddWeightError("Unexpected error, please try again"));
//       }
//     } on DioError catch (e) {
//       emit(AddWeightError(ServerFailure.fromDioError(e).errorMessage));
//     } catch (e) {
//       emit(AddWeightError(e.toString()));
//     }
//   }
// }
