

class CheckUserModel {
  final String message;
  final int status;

  CheckUserModel({
    required this.message,
    required this.status,
  });

  factory CheckUserModel.fromJson(Map<String, dynamic> json) {
    return CheckUserModel(
      message: json['message'] ?? '',
      status: json['status'] ?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,

    };
  }
}



class CreateRoomModel {
  final String message;
  final String roomID;
  final int status;

  CreateRoomModel(
      {  required this.message,
    required this.roomID,
    required this.status,
  });

  factory CreateRoomModel.fromJson(Map<String, dynamic> json) {
    return CreateRoomModel(
      message: json['message'] ?? '',
      roomID:json["roomId"]??"",
      status: json['status'] ?? 0,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'roomId':roomID
    };
  }
}

