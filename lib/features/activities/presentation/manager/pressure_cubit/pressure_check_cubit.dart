import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/api.dart';
import '../../../../../core/widgets/network.dart';
import '../../../data/pressurecheck.dart';
import 'presssure_check_states.dart';

class PresssureCheckCubit extends Cubit<PresssureCheckStates> {
  PresssureCheckCubit() : super(GetPresssureDatainitial());
  static PresssureCheckCubit get(context) => BlocProvider.of(context);

  Future<void> fetchpressuredata(String date) async {
    emit(GetPresssureDataLoading());
    List<Pressurecheck> pressurdata = [];
    List<int> heart = [];
    List<int> diastolicPressure = [];
    List<int> systolicPressure = [];

    var respons = await DioHelper().fetchData(
      url:
          'http://diabetes.runasp.net/api/Selecting_data/user\'s presure_data?specificDate=$date',
      token: userToken!,
    );
    var data = respons.data;
    print(data);
    if (respons.statusCode == 200 && data != null) {
      for (int i = 0; i < data.length; i++) {
        pressurdata.add(Pressurecheck.fromJson(data[i]));
      }
      debugPrint("pressuredata:$pressurdata");
    }
    if (pressurdata.isNotEmpty) {
      for (int i = 0; i < pressurdata.length; i++) {
        heart.add(pressurdata[i].heartrate!);
        diastolicPressure.add(pressurdata[i].diastolicpressure!);
        systolicPressure.add(pressurdata[i].systolicpressure!);
      }
      debugPrint('token in pressure cubit $userToken');
      emit(GetPressureDataSuccess(
          diastolicPressure, systolicPressure, heart, pressurdata));
    } else {
      emit(GetPressureDataFailure());
    }
  }
}
