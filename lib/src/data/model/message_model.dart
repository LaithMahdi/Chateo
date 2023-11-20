class MessageModel {
  String senderId;
  String receiverId;
  DateTime createdAt;
  String content;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.createdAt,
  });
}
