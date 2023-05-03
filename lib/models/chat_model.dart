class ChatModel {
  final String msg;
  final int chatIndex;
  final bool isUserMessage;

  ChatModel({
    required this.msg,
    required this.chatIndex,
    this.isUserMessage = false,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        msg: json["msg"],
        chatIndex: json["chatIndex"],
        isUserMessage: json["isUserMessage"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "chatIndex": chatIndex,
        "isUserMessage": isUserMessage,
      };
}
