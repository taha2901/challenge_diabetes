import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/api.dart';
import '../../../../../core/widgets/network.dart';
import '../../../data/Weightcheck.dart';
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
    print(weightdata);
    if (weightdata.isNotEmpty) {
      for (int i = 0; i < weightdata.length; i++) {
        weight.add(weightdata[i].weight!);
      }
      print(weight);
      print('token in weight cubit $userToken');
      emit(HaveData(weight, weightdata));
    } else {
      emit(NothaveData());
    }
  }
}
