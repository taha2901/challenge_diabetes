// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/helper/api.dart';
// import 'package:gluco/core/widgets/network.dart';
// import 'package:gluco/features/social/data/social_model/social_model.dart';
// import 'package:meta/meta.dart';

// part 'social_state.dart';

// class SocialCubit extends Cubit<SocialState> {
//   SocialCubit() : super(SocialInitial());

//   static SocialCubit get(BuildContext context) => BlocProvider.of(context);
//   List<SocialModel>? socialModel = [];

//   Future<void> getPosts() async {
//     emit(GetSocialLoaded());
//     DioHelper().getData(url: POSTS, token: userToken).then((value) {
//       socialModel = (value.data as List)
//           .map((social) => SocialModel.fromJson(social))
//           .toList();
//       emit(GetSocialSuccess());
//     }).catchError((onError) {
//       emit(GetSocialError());
//     });
//   }
// }


  
