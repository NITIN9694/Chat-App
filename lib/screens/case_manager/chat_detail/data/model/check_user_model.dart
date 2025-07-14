

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


class UserChatModel {
  String? roomId;
  int? total;
  int? page;
  int? limit;
  List<UserChatModelMessages>? messages;

  UserChatModel(
      {this.roomId, this.total, this.page, this.limit, this.messages});

  UserChatModel.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    if (json['messages'] != null) {
      messages = <UserChatModelMessages>[];
      json['messages'].forEach((v) {
        messages!.add(new UserChatModelMessages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomId'] = this.roomId;
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserChatModelMessages {
  String? senderId;
  String? receiverId;
  String? sendBy;
  String? message;
  String? status;
  String? sId;
  String? timestamp;

  UserChatModelMessages(
      {this.senderId,
        this.receiverId,
        this.sendBy,
        this.message,
        this.status,
        this.sId,
        this.timestamp});

  UserChatModelMessages.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    sendBy = json['sendBy'];
    message = json['message'];
    status = json['status'];
    sId = json['_id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['sendBy'] = this.sendBy;
    data['message'] = this.message;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
