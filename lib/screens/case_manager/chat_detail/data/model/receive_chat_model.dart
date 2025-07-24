


class ReceiveMessageModel {
  String? roomId;
  String? senderId;
  String? receiverId;
  String? sendBy;
  String? message;
  String? dateTime;

  ReceiveMessageModel(
      {this.roomId,
        this.senderId,
        this.receiverId,
        this.sendBy,
        this.message,
        this.dateTime});

  ReceiveMessageModel.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    sendBy = json['sendBy'];
    message = json['message'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['sendBy'] = this.sendBy;
    data['message'] = this.message;
    data['date_time'] = this.dateTime;
    return data;
  }
}
