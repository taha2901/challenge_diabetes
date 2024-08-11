import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/core/widgets/constants.dart';
import 'package:challenge_diabetes/features/auth/presentation/view/widget/text_field.dart';
import 'package:challenge_diabetes/features/chat/data/room_model.dart';
import 'package:challenge_diabetes/features/chat/presentation/manager/fire_database.dart';
import 'package:challenge_diabetes/features/chat/presentation/view/widgets/chat_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  TextEditingController emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userId = ChachHelper.getData(key: 'id');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Enter Friend Email",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        IconButton.filled(
                          onPressed: () {},
                          icon: const Icon(Iconsax.scan_barcode),
                        )
                      ],
                    ),
                    CustomField(
                      showBorder: false,
                      controller: emailCon,
                      icon: Iconsax.direct,
                      lable: "Email",
                      
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer),
                        onPressed: () {
                          if (emailCon.text.isNotEmpty) {
                            FireData()
                                .createRoom(emailCon.text)
                                .then((onValue) {
                              setState(() {
                                emailCon.text = "";
                              });
                              
                              debugPrint('emailCon.text $emailCon.text');
                              Navigator.pop(context);
                            }).catchError((error) {
                              debugPrint("Error: $error");
                            });
                          }
                        },
                        child: const Center(
                          child: Text("Create Chat"),
                        ))
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Iconsax.message_add),
      ),
      appBar: AppBar(
        title: const Text("شات"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('rooms')
                      .where('member', arrayContains: userId)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ChatRoom> items = snapshot.data!.docs
                          .map((e) => ChatRoom.fromJson(e.data()))
                          .toList()
                        ..sort(
                          (a, b) =>
                              b.lastMessageTime!.compareTo(a.lastMessageTime!),
                        );
                      if (items.isEmpty) {
                        return const Center(
                          child: Text("No chat rooms found"),
                        );
                      } else {
                        debugPrint("Number of chat rooms: ${items.length}");
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return ChatCard(
                                items: items[index],
                              );
                            });
                      }
                    } else if (snapshot.hasError) {
                      debugPrint("StreamBuilder Error: ${snapshot.error}");
                      return const Center(
                        child: Text("Error loading chat rooms"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
