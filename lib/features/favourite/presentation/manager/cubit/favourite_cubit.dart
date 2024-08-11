import 'package:bloc/bloc.dart';
import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/favourite/data/favourite_model/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  static FavouriteCubit get(context) => BlocProvider.of(context);
  List<FavouriteModel> favoriteList = [];
  Set<String> favoriteID = {};

  void getFavouriteData() async {
    favoriteID.clear();
    emit(FavLoadState());
    try {
      final response = await DioHelper().getData(
        url: GET_FAVOURITES,
        token: 'Bearer $userToken',
      );

      if (response.data is List) {
        final dataList = response.data as List;
        favoriteList = dataList.map((item) => FavouriteModel.fromJson(item)).toList();
      } else if (response.data is Map<String, dynamic>) {
        final favoriteItem = FavouriteModel.fromJson(response.data as Map<String, dynamic>);
        favoriteList = [favoriteItem];
      }

      // تحديث favoriteID
      favoriteList.forEach((favorite) {
        favoriteID.add(favorite.doctor?.id.toString() ?? '');
      });

      debugPrint('Favourite Number is ${favoriteList.length}');
      emit(FavSuccesState(favList: favoriteList)); 
    } catch (e) {
      debugPrint(e.toString());
      emit(FavErrorState());
    }
  }

  void addToFavorites({required String doctorId}) async {
    await DioHelper().postData(
      url: Add_Favourite,
      token: 'Bearer $userToken',
      data: {'doctorId': doctorId, "userId": "string"},
    ).then((value) async {
      favoriteID.add(doctorId);
      getFavouriteData();
      emit(AddToFavoritesSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(AddToFavoritesErrorState());
    });
  }


  void removeFromFavorites({required String doctorId}) async {
    await DioHelper().deleteData(
      url: Remove_Favourite,
      token: 'Bearer $userToken',
      data: {'doctorId': doctorId},
    ).then((value) async {
     favoriteID.remove(doctorId);
      getFavouriteData();
      emit(RemoveFromFavoritesSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(RemoveFromFavoritesErrorState());
    });
  }
}
