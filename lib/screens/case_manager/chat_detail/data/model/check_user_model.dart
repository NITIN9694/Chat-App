

class CheckUserModel {
  final String userId;
  final String username;
  final bool isOnline;

  CheckUserModel({
    required this.userId,
    required this.username,
    required this.isOnline,
  });

  factory CheckUserModel.fromJson(Map<String, dynamic> json) {
    return CheckUserModel(
      userId: json['user_id'] ?? '',
      username: json['username'] ?? '',
      isOnline: json['is_online'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'is_online': isOnline,
    };
  }
}
