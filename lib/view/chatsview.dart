import 'package:chat_app_for/ViewModel/authservices/authservices.dart';
import 'package:chat_app_for/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';

// ignore: must_be_immutable
class Chats extends StatelessWidget {
  MessageModel data;
  DataSnapshot snapshot;
  Chats({super.key, required this.data, required this.snapshot});

  final Authservices auth = Get.put(Authservices());

  @override
  Widget build(BuildContext context) {
    bool isCurrentUser = data.senderId == auth.userid;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
              decoration: BoxDecoration(
                color: isCurrentUser ? Colors.blueAccent : Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft:
                      isCurrentUser ? Radius.circular(12) : Radius.circular(0),
                  bottomRight:
                      isCurrentUser ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              child: Text(
                data.msg ?? "",
                style: TextStyle(
                  color: isCurrentUser ? Colors.white : Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              DateFormat("HH:mm").format(DateTime.fromMillisecondsSinceEpoch(
                  int.parse(data.time.toString()) ?? 0)),
              style: TextStyle(fontSize: 10, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
