
class CaseManagerChatMessageModel {
  final String message;
  final String timestamp;
  final bool isSender;

  CaseManagerChatMessageModel({
    required this.message,
    required this.timestamp,
    required this.isSender,
  });
  factory CaseManagerChatMessageModel.fromJson(Map<String, dynamic> json) {
    return CaseManagerChatMessageModel(
      message: json['message'] ?? '',
      timestamp: json['timestamp'] ?? '',
      isSender: json['isSender'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'timestamp': timestamp,
      'isSender': isSender,
    };
  }
}
