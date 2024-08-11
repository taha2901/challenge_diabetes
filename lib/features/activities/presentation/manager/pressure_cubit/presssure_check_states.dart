import '../../../data/pressurecheck.dart';

abstract class PresssureCheckStates {}

class GetPresssureDatainitial extends PresssureCheckStates {}

class GetPresssureDataLoading extends PresssureCheckStates {}

class GetPressureDataSuccess extends PresssureCheckStates {
  List<int> diastolicpressure;
  List<int> systolicpressure;
  List<int> heart;
  List<Pressurecheck> pressurdata = [];
  GetPressureDataSuccess(this.diastolicpressure, this.systolicpressure,
      this.heart, this.pressurdata);
}

class GetPressureDataFailure extends PresssureCheckStates {}
