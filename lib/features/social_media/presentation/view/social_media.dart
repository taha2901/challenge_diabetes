import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/constants.dart';
import 'package:gluco/features/chat/presentation/view/chat_home_screen.dart';
import 'package:gluco/features/social_media/presentation/view/add.dart';
import 'package:gluco/features/social_media/presentation/view/search.dart';
import 'package:gluco/features/social_media/presentation/view/widgets/post_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMedia();
}

class _SocialMedia extends State<SocialMedia> {
  @override
  Widget build(BuildContext context) {
    CollectionReference posts = FirebaseFirestore.instance.collection("posts");
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          centerTitle: true,
          title: const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "06",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: "16",
                  style: TextStyle(
                      fontSize: 26,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Iconsax.search_normal_1_copy),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Search();
                  },
                ));
              },
            ),
            IconButton(
              icon: const Icon(Iconsax.message),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ChatHomeScreen();
                  },
                ));
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: StreamBuilder(
            stream: posts.orderBy('date', descending: true).snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  dynamic data = snapshot.data!;
                  dynamic item = data.docs[index];

                  return PostCard(
                    item: item,
                  );
                },
              );
            }));
  }
}
