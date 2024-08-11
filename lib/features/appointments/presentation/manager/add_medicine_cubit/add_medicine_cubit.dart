import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/appointments/data/add_medicine_model.dart';
import 'package:challenge_diabetes/features/appointments/presentation/manager/get_medicine_cubit/get_medicine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/api.dart';

part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit() : super(AddMedicineInitial());

  static AddMedicineCubit get(BuildContext context) => BlocProvider.of(context);

  void addMedicine({
    required String name,
    required String dosage,
    required String times,
    required String date,
    required BuildContext context,
  }) {
    DioHelper().postData(
      url: ADD_Medicine,
      token: 'Bearer $userToken',
      data: {
        'name': name,
        'dosage': dosage,
        'times': times,
        'time': date,
      },
    ).then((value) {
      AddMedicineModel addMedicineModel = AddMedicineModel.fromJson(value.data);
      emit(AddMedicineSuccess(addMedicineModel));

      GetMedicineCubit.get(context).getMedicines();
    }).catchError((onError) {
      emit(AddMedicineFailure(onError.toString()));
    });
  }

  void removeFromMedicine({required String id, BuildContext? context}) async {
    try {
      final response = await DioHelper().deleteData(
        url: '$REMOVE_Medicine?id=$id',
        token: 'Bearer $userToken',
      );

      final addMedicineModel = AddMedicineModel.fromJson(response.data);
      if (context != null) {
        GetMedicineCubit.get(context).getMedicines();
      }
      emit(RemoveFromMedicineSuccessState(addMedicineModel));
    } catch (onError) {
      debugPrint(onError.toString());
      emit(RemoveFromMedicineFailureState());
    }
  }
}
