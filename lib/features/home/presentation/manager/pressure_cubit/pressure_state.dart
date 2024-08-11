
abstract class PressureState {}
final class AddPressureSuccess extends PressureState {}
final class AddPressureLoading extends PressureState {}
final class AddPressureError extends PressureState {
  String errormessage;
  AddPressureError(this.errormessage);
}

