import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/core/widgets/constants.dart';
import 'package:challenge_diabetes/features/social_media/data/user.dart';
import 'package:challenge_diabetes/features/social_media/presentation/manager/provider/user_provider.dart';
import 'package:challenge_diabetes/features/social_media/presentation/manager/services/cloud.dart';
import 'package:challenge_diabetes/features/social_media/presentation/view/comment_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final item;
  const PostCard({super.key, required this.item});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int commentCount = 0;

  getCommentCount() async {
    try {
      QuerySnapshot comment = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.item['postId'])
          .collection('comments')
          .get();
      if (this.mounted) {
        setState(() {
          commentCount = comment.docs.length;
        });
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  void initState() {
    getCommentCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel userData = Provider.of<UserProvider>(context).userModel!;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Row(
              children: [
                widget.item['profilePic'] == ""
                    ? const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/man.png'))
                    : CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.item['profilePic']),
                      ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.item['displayName']),
                    Text("@" + widget.item['username']),
                  ],
                ),
                const Spacer(),
                Text(DateFormat('dd MMM yyyy')
                    .format(widget.item['date'].toDate())),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: widget.item['postImage'] != ""
                      ? Container(
                          margin: const EdgeInsets.all(12),
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                widget.item['postImage'],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.item['description'],
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    CloudMethods().likePost(
                        postId: widget.item['postId'],
                        uid: userData.uid,
                        like: widget.item['like']);
                    getCommentCount();
                  },
                  icon: widget.item['like'].contains(userData.uid)
                      ? const Icon(
                          Icons.favorite,
                          color: kPrimaryColor,
                        )
                      : const Icon(Icons.favorite_outline),
                ),
                Text(widget.item['like'].length.toString()),
                const Gap(20),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentScreen(
                            postId: widget.item['postId'],
                          ),
                        ));
                    getCommentCount();
                  },
                  icon: const Icon(Icons.comment),
                ),
                Text(commentCount.toString()),
                const Spacer(),

                if (ChachHelper.getData(key: 'id') == widget.item['uid'])
                  IconButton(
                    onPressed: () {
                      print(
                          'Current user id: ${ChachHelper.getData(key: 'id')}');
                      debugPrint('Post user id: ${widget.item['uid']}');

                      CloudMethods().deletePost(widget.item['postId']);
                    },
                    icon: const Icon(Icons.delete),
                  )
                else
                  Container(), 
              ],
            ),
          ],
        ),
      ),
    );
  }
}
