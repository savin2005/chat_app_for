import 'package:chat_app_for/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final idmsg= "";

  Future<void> writeData(MessageModel model, String receiverId) async {
    await _sendMessageData(model.toJson(), receiverId);
  }

  Future<void> _sendMessageData(
      Map<String, dynamic> messageData, String receiverId) async {
    try {
      String userId = _auth.currentUser!.uid;
      List<String> ids = [userId, receiverId];
      ids.sort();
      String chatRoomId = ids.join("_");

      await _databaseRef
          .child("messages")
          .child(chatRoomId)
          .push()
          .set(messageData);
      print("Message sent to room: $chatRoomId");
    } catch (e) {
      print("Error sending message: $e");
    }
  }  Future<void> updateMessageStatus({
    required String chatRoomId,
    required String messageId,
    required String status,
  }) async {
    try {

      await _databaseRef
          .child('messages')
          .child(chatRoomId)
          .child(messageId)
          .update({'status': status});
      print('Status updated to $status');
    } catch (e) {
      print('Failed to update status: $e');
    }
  }
}
