class SendMessageModel {
  String? message;
  SaveResult? saveResult;
  List<Messages>? messages;
  bool? status;

  SendMessageModel({this.message, this.saveResult, this.messages, this.status});

  SendMessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    saveResult = json['saveResult'] != null
        ? new SaveResult.fromJson(json['saveResult'])
        : null;
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.saveResult != null) {
      data['saveResult'] = this.saveResult!.toJson();
    }
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class SaveResult {
  String? readStatus;
  int? id;
  String? roomId;
  String? senderId;
  String? receiverId;
  String? sendBy;
  String? message;
  String? dateTime;
  String? updatedAt;
  String? createdAt;

  SaveResult(
      {this.readStatus,
        this.id,
        this.roomId,
        this.senderId,
        this.receiverId,
        this.sendBy,
        this.message,
        this.dateTime,
        this.updatedAt,
        this.createdAt});

  SaveResult.fromJson(Map<String, dynamic> json) {
    readStatus = json['read_status'];
    id = json['id'];
    roomId = json['room_id'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    sendBy = json['sendBy'];
    message = json['message'];
    dateTime = json['date_time'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['read_status'] = this.readStatus;
    data['id'] = this.id;
    data['room_id'] = this.roomId;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['sendBy'] = this.sendBy;
    data['message'] = this.message;
    data['date_time'] = this.dateTime;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Messages {
  int? id;
  String? senderId;
  String? sendBy;
  String? receiverId;
  bool? unread;
  String? dateTime;
  String? msg;
  String? status;

  Messages(
      {this.id,
        this.senderId,
        this.sendBy,
        this.receiverId,
        this.unread,
        this.dateTime,
        this.msg,
        this.status});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['senderId'];
    sendBy = json['sendBy'];
    receiverId = json['receiverId'];
    unread = json['unread'];
    dateTime = json['dateTime'];
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['senderId'] = this.senderId;
    data['sendBy'] = this.sendBy;
    data['receiverId'] = this.receiverId;
    data['unread'] = this.unread;
    data['dateTime'] = this.dateTime;
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}
