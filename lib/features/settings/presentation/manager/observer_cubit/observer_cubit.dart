import 'package:bloc/bloc.dart';
import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/features/settings/data/add_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'observer_state.dart';

class ObserverCubit extends Cubit<ObserverState> {
  ObserverCubit() : super(ObserverInitial());

   static ObserverCubit get(context) => BlocProvider.of(context);

  void userObserver({
    required String email,
    required String phone,
    required String relvant_relation,
  }) {
    emit(ObserverLoaded());
    DioHelper().postData(
      data: {},
      url: Add_Observer,
      query: {
        'email': email,
        'phone': phone,
        'relvant_relation': relvant_relation,
      },
      token: 'Bearer $userToken'
    ).then((value) {
      final addObserver = AddObserver.fromJson(value.data);
      debugPrint(addObserver.toString());
      debugPrint(addObserver.email);
      emit(ObserverSuccess(addObserver));
    }).catchError((onError) {
      debugPrint('Error in Observer cubit: ${onError.toString()}');
      emit(ObserverFailure(onError.toString()));
    });
  }
}
