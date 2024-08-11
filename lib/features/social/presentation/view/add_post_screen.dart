// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/widgets/custom_show_toast.dart';
// import 'package:gluco/features/social/presentation/manager/add_posts_cubit/add_post_cubit.dart';
// class AddPostScreen extends StatelessWidget {
//   @override
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController _contentController = TextEditingController();
  
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AddPostCubit(),
//       child: BlocConsumer<AddPostCubit, AddPostState>(
//         listener: (context, state) {
//           if (state is PostSocialSuccess) {
//             Navigator.pop(context);
//             showToast(
//               msg: 'Added Successful',
//               state: ToastStates.SUCCESS,
//             );
//           }
//           if (state is PostSocialError) {
//             showToast(
//               msg: 'Failed',
//               state: ToastStates.ERROR,
//             );
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Add Post'),
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     TextField(
//                       controller: _contentController,
//                       decoration: const InputDecoration(
//                         hintText: 'Enter your post content...',
//                       ),
//                       maxLines: 5,
//                     ),
//                     const SizedBox(height: 16),
//                     state is PostSocialLoaded
//                         ? const Center(child: CircularProgressIndicator())
//                         : ElevatedButton(
//                             onPressed: () {
//                               if (formKey.currentState!.validate()) {
//                                 AddPostCubit.get(context).addPost(
//                                   content: _contentController.text,
//                                   context: context,
//                                 );
//                               }
//                             },
//                             child: const Text('Add Post'),
//                           ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
