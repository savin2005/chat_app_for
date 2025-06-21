import 'package:chat_app_for/ViewModel/authservices/authservices.dart';
import 'package:chat_app_for/ViewModel/controller/messagecontroler.dart';
import 'package:chat_app_for/model/usermodel.dart';
import 'package:chat_app_for/view/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Homescreen extends StatelessWidget {
  UserModel data;
  Homescreen({super.key, required this.data});
  final MessageController msg = Get.put(MessageController());
  final Authservices auth = Get.put(Authservices());

  @override
  Widget build(BuildContext context) {
    List<String> ids = [auth.userid, data.uid!];
    ids.sort();
    String chatRoomId = ids.join("_");
    return ListTile(
      onTap: () { msg.updateMessageStatus(chatRoomId: chatRoomId, messageId: msg.idmsg, status: "delivered");
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatPage(
            data: data,
          ),
        ));
      },
      leading: Stack(
          alignment: Alignment.bottomRight, children: [Image(image: NetworkImage(data.profileImage!)),Icon(
        Icons.do_not_disturb_on_total_silence, // You can use Icons.done_all for double tick
        size: 12,
        color: data.status == true? Colors.green:Colors.grey,
      ),
      ]),
      title: Text(data.email!),
    );
  }
}
