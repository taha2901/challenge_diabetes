// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/helper/api.dart';
// import 'package:gluco/core/widgets/network.dart';
// import 'package:gluco/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
// import 'package:gluco/features/home/data/add_suger_model/add_suger_model.dart';
// import 'package:gluco/features/home/presentation/manager/suger_cubit/sugar_state.dart';

// class SugarCubit extends Cubit<Sugarstate> {
//   SugarCubit() : super(AddSugarSuccess());
//   static SugarCubit get(context) => BlocProvider.of(context);
//   AddSugerModel? addSugerModel;
//   void sugar(String sugarlevel, String mealname) async {
//     emit(AddSugarLoading());
//     try {
//       var data = await DioHelper().addData(
//         url: 'http://nouraapi.runasp.net/api/Measurements/blood sugar level',
//         body: {"sugar_reading": sugarlevel, "measurement_date": mealname},
//         Contenttype: 'application/json',
//         token: userToken!,
//       );

//       if (data.statusCode == 200) {
//         emit(AddSugarSuccess());
//         // Update the sugar level data after adding
//         DateTime currentDate = DateTime.now();
//         String formattedDate =
//             "${currentDate.year}-${currentDate.month}-${currentDate.day}";
//         // SugarCheckCubit.get(context).getsugarlevel(formattedDate);
//       } else if (data.statusCode == 500) {
//         emit(AddSugarError("internal server error, please try again"));
//       }
//     } catch (e) {
//       emit(AddSugarError(e.toString()));
//     }
//   }
// }


import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/suger_cubit/sugar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SugarCubit extends Cubit<Sugarstate> {
  SugarCubit() : super(AddSugarSuccess());
  static SugarCubit get(context) => BlocProvider.of(context);

  void sugar(String sugarlevel, String mealname, BuildContext context) async {
    emit(AddSugarLoading());
    try {
      var data = await DioHelper().addData(
        url: 'http://diabetes.runasp.net/api/Measurements/blood sugar level',
        body: {
          "sugar_reading": sugarlevel,
          "measurement_date": mealname
        },
        Contenttype: 'application/json',
        token: userToken!,
      );

      if (data.statusCode == 200) {
        emit(AddSugarSuccess());
        // Update the sugar level data after adding
        DateTime currentDate = DateTime.now();
        String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";
        BlocProvider.of<SugarCheckCubit>(context).getsugarlevel(formattedDate);
      } else if (data.statusCode == 500) {
        emit(AddSugarError("internal server error, please try again"));
      }
    } catch (e) {
      emit(AddSugarError(e.toString()));
    }
  }
}
