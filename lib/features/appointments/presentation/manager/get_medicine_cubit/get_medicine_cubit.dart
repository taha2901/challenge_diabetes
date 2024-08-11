import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/appointments/data/get_medicine_model/get_medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'get_medicine_state.dart';

class GetMedicineCubit extends Cubit<GetMedicineState> {
  GetMedicineCubit() : super(GetMedicineInitial());

  static GetMedicineCubit get(context) => BlocProvider.of(context);
  List<GetMedicineModel> medicine = [];

  void getMedicines() {
    emit(GetMedicineLoaded());
    DioHelper()
        .getData(url: GET_MEDICINES, token: 'Bearer $userToken')
        .then((value) {
      medicine = (value.data as List)
          .map((medicine) => GetMedicineModel.fromJson(medicine))
          .toList();
      emit(GetMedicineSuccess(medicine: medicine));
    }).catchError((onError) {
      emit(GetMedicineFailure(errMsg: onError.toString()));
    });
  }

  // List<AddMedicineModel> addMedicineModel = [];
  // void removeFromMedicine({required String id}) async {
  //   await DioHelper().deleteData(
  //     url: '$REMOVE_Medicine?id=$id',
  //     token: 'Bearer $userToken',
  //   ).then((value) async {
  //   //  favoriteID.remove(id);
  //   addMedicineModel.removeWhere((med) => med.id == id);
  //     getMedicines();
  //     emit(RemoveFromMedicineSuccessState());
  //   }).catchError((onError) {
  //     debugPrint(onError.toString());
  //     emit(RemoveFromMedicineFailureState());
  //   });
  // }
}
