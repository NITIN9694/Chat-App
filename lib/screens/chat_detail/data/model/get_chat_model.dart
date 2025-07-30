

class GetChatModel {
  String? message;
  bool? status;
  List<MessagesModel>? messages;
  String? roomId;
  int? total;
  int? limit;
  int? page;

  GetChatModel(
      {this.message,
        this.status,
        this.messages,
        this.roomId,
        this.total,
        this.limit,
        this.page});

  GetChatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['messages'] != null) {
      messages = <MessagesModel>[];
      json['messages'].forEach((v) {
        messages!.add(new MessagesModel.fromJson(v));
      });
    }
    roomId = json['roomId'];
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['roomId'] = this.roomId;
    data['total'] = this.total;
    data['limit'] = this.limit;
    data['page'] = this.page;
    return data;
  }
}

class MessagesModel {
  int? id;
  String? senderId;
  String? sendBy;
  String? receiverId;
  bool? unread;
  String? dateTime;
  String? msg;
  String? status;

  MessagesModel(
      {this.id,
        this.senderId,
        this.sendBy,
        this.receiverId,
        this.unread,
        this.dateTime,
        this.msg,
        this.status});

  MessagesModel.fromJson(Map<String, dynamic> json) {
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



