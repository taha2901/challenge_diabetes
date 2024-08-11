part of 'doctor_cubit.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorssLoadingState extends DoctorState {}

class DoctorsSuccessState extends DoctorState {
  final List<DoctorModel> doctorModels;

  DoctorsSuccessState({required this.doctorModels});
}

class DoctorsErrorState extends DoctorState {
  final String error;

  DoctorsErrorState(this.error);
}

class DoctorFilteredState extends DoctorState {
  final List<DoctorModel> filteredDoctors;

  DoctorFilteredState(this.filteredDoctors);
}
