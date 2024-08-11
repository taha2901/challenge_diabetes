import 'package:challenge_diabetes/features/chat/data/msg_model.dart';
import 'package:challenge_diabetes/features/chat/data/user_model.dart';
import 'package:challenge_diabetes/features/chat/presentation/manager/fire_database.dart';
import 'package:challenge_diabetes/features/chat/presentation/view/widgets/chat_msg_card.dart';
import 'package:challenge_diabetes/features/chat/presentation/view/widgets/field_msg_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ChatScreen extends StatefulWidget {
  final String roomId;
  final ChatUser chatUser;
  const ChatScreen({super.key, required this.roomId, required this.chatUser});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController msgCon = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatUser.name!.toString()),
            Text(
              widget.chatUser.lastActivated!.toString(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.trash),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.copy),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('rooms')
                      .doc(widget.roomId)
                      .collection('messages')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MessageModel> messageItems = snapshot.data!.docs
                          .map((e) => MessageModel.fromJson(e.data()))
                          .toList()
                        ..sort(
                          (a, b) => b.createdAt!.compareTo(a.createdAt!),
                        );
                      return messageItems.isNotEmpty
                          ? ListView.builder(
                              reverse: true,
                              itemCount: messageItems.length,
                              itemBuilder: (context, index) {
                                return ChatMessageCard(
                                  messageModel: messageItems[index],
                                  index: index,
                                  roomId:  widget.roomId,
                                );
                              },
                            )
                          : Center(
                              child: GestureDetector(
                                onTap: () => FireData().sendMessage(
                                    widget.chatUser.id!,
                                    'Assalamu Alaikum 👋',
                                    widget.roomId),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "👋",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          "Say Assalamu Alaikum",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            FieldMsgCard(
              chatUser: widget.chatUser,
              roomId: widget.roomId,
            ),

            // Row(
            //   children: [
            //     Expanded(
            //       child: Card(
            //         child: TextField(
            //           controller: msgCon,
            //           maxLines: 5,
            //           minLines: 1,
            //           decoration: InputDecoration(
            //             suffixIcon: Row(
            //               mainAxisAlignment: MainAxisAlignment.end,
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 IconButton(
            //                   onPressed: () {},
            //                   icon: const Icon(Iconsax.emoji_happy),
            //                 ),
            //                 IconButton(
            //                   onPressed: () async {
            //                     ImagePicker picker = ImagePicker();
            //                     XFile? image = await picker.pickImage(
            //                         source: ImageSource.gallery);

            //                     if (image != null) {
            //                       FireStorage().sendImage(
            //                           file: File(image.path),
            //                           roomId: widget.roomId,
            //                           uid: widget.chatUser.id!);
            //                     }
            //                   },
            //                   icon: const Icon(Iconsax.camera),
            //                 ),
            //               ],
            //             ),
            //             border: InputBorder.none,
            //             hintText: "Message",
            //             contentPadding: const EdgeInsets.symmetric(
            //               horizontal: 16,
            //               vertical: 10,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     IconButton.filled(
            //       onPressed: () {
            //         if (msgCon.text.isNotEmpty) {
            //           FireData()
            //               .sendMessage(
            //                   widget.chatUser.id!, msgCon.text, widget.roomId)
            //               .then((value) {
            //             setState(() {
            //               msgCon.text = "";
            //             });
            //           });
            //         }
            //       },
            //       icon: const Icon(Iconsax.send_1),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
