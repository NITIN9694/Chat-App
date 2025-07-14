class MessageModel {
  String? message;
  bool? status;
  List<MessageModelData>? data;
  int? totalCount;
  int? pageSize;
  int? pageNo;

  MessageModel(
      {this.message,
        this.status,
        this.data,
        this.totalCount,
        this.pageSize,
        this.pageNo});

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <MessageModelData>[];
      json['data'].forEach((v) {
        data!.add(new MessageModelData.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    pageNo = json['pageNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    data['pageSize'] = this.pageSize;
    data['pageNo'] = this.pageNo;
    return data;
  }
}

class MessageModelData {
  int? msgId;
  int? userId;
  String? role;
  bool? unread;
  String? dateTime;
  String? msg;

  MessageModelData(
      {this.msgId,
        this.userId,
        this.role,
        this.unread,
        this.dateTime,
        this.msg});

  MessageModelData.fromJson(Map<String, dynamic> json) {
    msgId = json['msgId'];
    userId = json['userId'];
    role = json['role'];
    unread = json['unread'];
    dateTime = json['dateTime'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msgId'] = this.msgId;
    data['userId'] = this.userId;
    data['role'] = this.role;
    data['unread'] = this.unread;
    data['dateTime'] = this.dateTime;
    data['msg'] = this.msg;
    return data;
  }
}
