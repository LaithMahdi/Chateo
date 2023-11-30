class MessageModel {
  final String senderId;
  final String message;
  final DateTime date;
  final bool isSender;

  MessageModel({
    required this.senderId,
    required this.message,
    required this.date,
    required this.isSender,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['senderId'],
      message: json['content'],
      date: DateTime.parse(json['createdAt']),
      isSender: json['isSender'],
    );
  }
}
