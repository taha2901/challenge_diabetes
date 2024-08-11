
part of 'get_medicine_cubit.dart';

@immutable
sealed class GetMedicineState {}

final class GetMedicineInitial extends GetMedicineState {}

final class GetMedicineLoaded extends GetMedicineState {}

final class GetMedicineSuccess extends GetMedicineState {
 final List<GetMedicineModel> medicine;
  GetMedicineSuccess({required this.medicine});
  
}

final class GetMedicineFailure extends GetMedicineState {
  final String errMsg;

  GetMedicineFailure({required this.errMsg});
}


// final class RemoveFromMedicineSuccessState extends GetMedicineState {}

// final class RemoveFromMedicineFailureState extends GetMedicineState {}
