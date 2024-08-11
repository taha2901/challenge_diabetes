part of 'reservation_cubit.dart';

@immutable
sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

final class ReservationLoaded extends ReservationState {}

final class ReservationSuccess extends ReservationState {
  final ReservationModel reservation;

  ReservationSuccess(this.reservation);
}

final class ReservationFailure extends ReservationState {
  final String errMessage;

  ReservationFailure(this.errMessage);
}