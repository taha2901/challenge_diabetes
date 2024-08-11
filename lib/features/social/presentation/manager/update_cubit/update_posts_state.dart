part of 'update_posts_cubit.dart';

@immutable
sealed class UpdatePostsState {}

final class UpdatePostsInitial extends UpdatePostsState {}

final class UpdatePostsLoaded extends UpdatePostsState {}

final class UpdatePostsSuccess extends UpdatePostsState {}

final class UpdatePostsFailure extends UpdatePostsState {
  final String errMessage;

  UpdatePostsFailure(this.errMessage);
}
