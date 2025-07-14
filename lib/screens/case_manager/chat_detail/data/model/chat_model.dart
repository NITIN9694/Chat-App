class SendChatMessageModel {
  final String senderId;
  final String receiverId;
  final String message;
  final String sendBy;
  final DateTime timestamp;

  SendChatMessageModel({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.sendBy,
    required this.timestamp,
  });

  factory SendChatMessageModel.fromJson(Map<String, dynamic> json) {
    return SendChatMessageModel(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      sendBy: json['sendBy'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

class GetChatModel {
  String? roomId;
  int? total;
  int? page;
  int? limit;
  List<MessagesModel>? messages;

  GetChatModel({this.roomId, this.total, this.page, this.limit, this.messages});

  GetChatModel.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    if (json['messages'] != null) {
      messages = <MessagesModel>[];
      json['messages'].forEach((v) {
        messages!.add(new MessagesModel.fromJson(v));
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

class MessagesModel {
  String? senderId;
  String? receiverId;
  String? sendBy;
  String? message;
  String? status;
  String? sId;
  String? timestamp;

  MessagesModel(
      {this.senderId,
        this.receiverId,
        this.sendBy,
        this.message,
        this.status,
        this.sId,
        this.timestamp});

  MessagesModel.fromJson(Map<String, dynamic> json) {
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


class SendMessageModel {
  String? sId;
  String? roomId;
  int? iV;
  String? createdAt;
  String? lastMessage;
  List<SendMessageListModel>? messages;
  List<String>? participants;
  String? updatedAt;

  SendMessageModel(
      {this.sId,
        this.roomId,
        this.iV,
        this.createdAt,
        this.lastMessage,
        this.messages,
        this.participants,
        this.updatedAt});

  SendMessageModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    roomId = json['roomId'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    lastMessage = json['lastMessage'];
    if (json['messages'] != null) {
      messages = <SendMessageListModel>[];
      json['messages'].forEach((v) {
        messages!.add(new SendMessageListModel.fromJson(v));
      });
    }
    participants = json['participants'].cast<String>();
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['roomId'] = this.roomId;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['lastMessage'] = this.lastMessage;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['participants'] = this.participants;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class SendMessageListModel {
  String? senderId;
  String? receiverId;
  String? sendBy;
  String? message;
  String? status;
  String? sId;
  String? timestamp;

  SendMessageListModel(
      {this.senderId,
        this.receiverId,
        this.sendBy,
        this.message,
        this.status,
        this.sId,
        this.timestamp});

  SendMessageListModel.fromJson(Map<String, dynamic> json) {
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
