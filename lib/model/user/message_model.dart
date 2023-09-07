import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;

  MessageModel(
      {required this.timestamp,
      required this.message,
      required this.receiverID,
      required this.senderEmail,
      required this.senderID});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        timestamp: json['timestamp'],
        message:  json['message'],
        receiverID:  json['reciverID'],
        senderEmail:  json['senderEmail'],
        senderID:  json['senderID']);
  }

  Map<String, dynamic> toJson() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'reciverID': receiverID,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
