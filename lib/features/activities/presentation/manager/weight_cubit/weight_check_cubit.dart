import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/activities/data/Weightcheck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weight_check_states.dart';

class WeightCheckCubit extends Cubit<WeightCheckStates> {
  WeightCheckCubit() : super(WeightCheckinitial());

  Future<void> fetchweightdata(String date) async {
    List<Weightcheck> weightdata = [];
    List<int> weight = [];

    var respons = await DioHelper().fetchData(
      url:
          'http://diabetes.runasp.net/api/Selecting_data/user\'s weight_data?specificDate=$date',
      token: userToken!,
    );
    emit(WeightCheckloading());
    var data = respons.data;
    if (respons.statusCode == 200 && data != null) {
      for (int i = 0; i < data.length; i++) {
        weightdata.add(Weightcheck.fromJson(data[i]));
      }
    }
    debugPrint(weightdata.toString());
    if (weightdata.isNotEmpty) {
      for (int i = 0; i < weightdata.length; i++) {
        weight.add(weightdata[i].weight!);
      }
      debugPrint(weight.toString());
      debugPrint('token in weight cubit $userToken');
      emit(HaveData(weight, weightdata));
    } else {
      emit(NothaveData());
    }
  }
}
