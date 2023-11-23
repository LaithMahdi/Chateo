class MessageModel {
  String senderId;
  String receiverId;
  DateTime createdAt;
  String content;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.createdAt,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'createdAt': createdAt.toIso8601String(),
      'content': content,
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      createdAt: DateTime.parse(json['createdAt']),
      content: json['content'],
    );
  }
}
