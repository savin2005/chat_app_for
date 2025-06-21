import 'package:chat_app_for/ViewModel/authservices/authservices.dart';
import 'package:chat_app_for/ViewModel/controller/messagecontroler.dart';
import 'package:chat_app_for/model/message.dart';
import 'package:chat_app_for/model/usermodel.dart';
import 'package:chat_app_for/view/chatsview.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  UserModel data;
  ChatPage({super.key, required this.data});
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MessageController msg = Get.put(MessageController());
    final Authservices auth = Get.put(Authservices());

    List<String> ids = [auth.userid, data.uid!];
    ids.sort();
    String chatRoomId = ids.join("_");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.email ?? "Unknown"),
            Text(
              getLastSeenText(int.parse(data.lastseen.toString()), data.status),
              style: TextStyle(
                fontSize: 12,
                color: data.status == true ? Colors.green : Colors.grey[600],
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              shrinkWrap: true,
              query: FirebaseDatabase.instance
                  .ref()
                  .child("messages")
                  .child(chatRoomId)
                  .orderByChild("time"),
              itemBuilder: (context, snapshot, animation, index) {
                if (snapshot.value == null) return const SizedBox();

                if (snapshot.value is Map) {
                  Map<String, dynamic> messageData =
                      Map<String, dynamic>.from(snapshot.value as Map);

                  MessageModel message = MessageModel.fromJson(messageData);

                  return Chats(snapshot: snapshot, data: message);
                } else {
                  print("Unexpected data type: ${snapshot.value.runtimeType}");
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt,
                  color: Color.fromARGB(255, 122, 122, 122),
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.photo_size_select_actual_rounded,
                  color: Color.fromARGB(255, 122, 122, 122),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (name.text.trim().isNotEmpty) {
                            msg.writeData(
                              MessageModel(
                                messageId: msg.idmsg,
                                status: "sent",
                                msg: name.text,
                                receiverId: data.uid,
                                senderId: auth.userid,
                                time: DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                              ),
                              data.uid!,
                            );
                            name.clear();
                          }
                        },
                        icon: Icon(
                          Icons.send,
                          color: Color.fromARGB(214, 51, 83, 212),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ WhatsApp-style last seen logic
  String getLastSeenText(int? lastSeen, bool? isOnline) {
    if (isOnline == true) {
      return "Online";
    }

    if (lastSeen == null || lastSeen == 0) return "Last seen recently";

    DateTime date = DateTime.fromMillisecondsSinceEpoch(lastSeen);
    DateTime now = DateTime.now();

    if (now.difference(date).inDays == 0) {
      return "Last seen at ${DateFormat('hh:mm a').format(date)}";
    } else if (now.difference(date).inDays == 1) {
      return "Last seen yesterday at ${DateFormat('hh:mm a').format(date)}";
    } else {
      return "Last seen on ${DateFormat('dd MMM yyyy').format(date)} at ${DateFormat('hh:mm a').format(date)}";
    }
  }
}
