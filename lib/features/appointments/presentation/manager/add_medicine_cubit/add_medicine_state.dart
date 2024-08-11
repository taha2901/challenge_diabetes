part of 'add_medicine_cubit.dart';

@immutable
sealed class AddMedicineState {}

final class AddMedicineInitial extends AddMedicineState {}

final class AddMedicineLoaded extends AddMedicineState {}

final class AddMedicineSuccess extends AddMedicineState {
  final AddMedicineModel addMedicineModel;

  AddMedicineSuccess(this.addMedicineModel);
}

final class AddMedicineFailure extends AddMedicineState {
  final String errMessage;

  AddMedicineFailure(this.errMessage);

}

final class RemoveFromMedicineSuccessState extends AddMedicineState {
   final AddMedicineModel removeSuccess;

  RemoveFromMedicineSuccessState(this.removeSuccess);
}

final class RemoveFromMedicineFailureState extends AddMedicineState {}