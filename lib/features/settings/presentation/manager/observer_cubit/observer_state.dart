part of 'observer_cubit.dart';

@immutable
sealed class ObserverState {}

final class ObserverInitial extends ObserverState {}


final class ObserverLoaded extends ObserverState {}

final class ObserverSuccess extends ObserverState {
  final AddObserver addObserver;

  ObserverSuccess(this.addObserver);
}

final class ObserverFailure extends ObserverState {
  final String errMessage;

  ObserverFailure(this.errMessage);
}
