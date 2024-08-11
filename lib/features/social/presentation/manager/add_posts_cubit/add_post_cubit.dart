
// import 'package:bloc/bloc.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/helper/api.dart';
// import 'package:gluco/core/widgets/network.dart';
// import 'package:gluco/features/social/data/add_post_model.dart';
// import 'package:gluco/features/social/presentation/manager/get_posts/social_cubit.dart';
// import 'package:meta/meta.dart';

// part 'add_post_state.dart';

// class AddPostCubit extends Cubit<AddPostState> {
//   AddPostCubit() : super(AddPostInitial());
//   static AddPostCubit get(context) => BlocProvider.of(context);

//   void addPost({
//     required String content,
//     required BuildContext context,
//   }) {
//     emit(PostSocialLoaded());
//     DioHelper()
//         .postData(
//             url: 'Posts',
//             data: {
//               'content': content,
//             },
//             token: 'Bearer $userToken')
//         .then((value) {
//       final addPostModel = AddPostModel.fromJson(value.data);
//       emit(PostSocialSuccess(addPostModel));

//       // تحديث قائمة المنشورات
//       SocialCubit.get(context).getPosts();
//     }).catchError((onError) {
//       print('Error in login cubit: ${onError.toString()}');
//       emit(PostSocialError());
//     });
//   }

//    void addLikes({
//     required int postId,
//     required BuildContext context,
//   }) {
//     emit(PostSocialLoaded());
//     DioHelper()
//         .postData(url: 'Posts/Like?postId=$postId', token: 'Bearer $userToken')
//         .then((value) {
//       emit(PostLikesSuccess(postId));
//     }).catchError((onError) {
//       print('Error in add like: ${onError.toString()}');
//       emit(PostSocialError());
//     });
//   }
// }
