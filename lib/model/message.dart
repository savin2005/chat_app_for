class MessageModel {
  String? messageId; // Add messageId
  String? senderId;
  String? receiverId;
  String? msg;
  String? time;
  String? status;

  MessageModel({
    this.messageId, // Include in constructor
    this.senderId,
    this.msg,
    this.receiverId,
    this.time,
    this.status,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json["messageId"], // Use passed messageId
      senderId: json['senderId'],
      msg: json['msg'],
      receiverId: json['receiverId'],
      time: json["time"],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'msg': msg,
      'time': time,
      'status': status,
      "messageId": messageId,
    };
  }

  MessageModel copyWith({
    String? messageId,
    String? senderId,
    String? receiverId,
    String? msg,
    String? time,
    String? status,
  }) {
    return MessageModel(
      messageId: messageId ?? this.messageId,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      time: time ?? this.time,
      msg: msg ?? this.msg,
      status: status ?? this.status,
    );
  }
}
