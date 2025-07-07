

class AddNewUserModel {
  final String responseCode;
  final String message;
  final String status;

  AddNewUserModel({
    required this.responseCode,
    required this.message,
    required this.status,
  });
  factory AddNewUserModel.fromJson(Map<String, dynamic> json) {
    return AddNewUserModel(
      responseCode: json['response_code'] ?? '',
      message: json['message'] ?? '',
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response_code': responseCode,
      'message': message,
      'status': status,
    };
  }
}
