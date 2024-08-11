part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavLoadState extends FavouriteState {}

class FavSuccesState extends FavouriteState {
  final List<FavouriteModel> favList;

  FavSuccesState({required this.favList});
}

class FavErrorState extends FavouriteState {}

class AddToFavoritesSuccessState extends FavouriteState {}

class AddToFavoritesErrorState extends FavouriteState {}

class RemoveFromFavoritesSuccessState extends FavouriteState {}

class RemoveFromFavoritesErrorState extends FavouriteState {}
