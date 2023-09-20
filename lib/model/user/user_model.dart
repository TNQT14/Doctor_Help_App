import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// class UserModel {
//   String name;
//   String email;
//   // String password;
//   var phone;
//   String address;
//   var birthday;
//   String imageUrl;
//
//   UserModel({
//     // required this.password,
//     required this.email,
//     required this.name,
//     required this.imageUrl,
//     required this.phone,
//     required this.address,
//     required this.birthday,
//   });
//
//   UserModel copyWith({
//     String? name,
//     String? email,
//     String? password,
//     var phone,
//     String? address,
//     String? birthday,
//     String? imageUrl,
//   }) {
//     return UserModel(
//       name: name ?? this.name,
//       email: email ?? this.email,
//       // password: password ?? this.password,
//       phone: phone ?? this.phone,
//       address: address ?? this.address,
//       birthday: birthday ?? this.birthday,
//       imageUrl: imageUrl ?? this.imageUrl,
//     );
//   }
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//         email: json['email'],
//         name: json['name'],
//         imageUrl: json['imageUrl'],
//         phone: int.parse(json['phone'].toString()),
//         address: json['address'],
//         birthday: json['birthday'].toString()
//     );
//   }
//
//   // factory UserModel.fromJson(Map<String, dynamic> json) {
//   //   return UserModel(
//   //       email: (json['email']??'').toString(),
//   //       name: (json['name']??'').toString(),
//   //       imageUrl: (json['imageUrl']??'').toString(),
//   //       phone: (json['phone']??'').toString(),
//   //       address: (json['address']??'').toString(),
//   //       birthday: (json['birthday']??'').toString()
//   //   );
//   // }
//
//   // static UserModel fromSnapshot (DocumentSnapshot snap){
//   //   var user = UserModel(
//   //   email: snap['email'],
//   //       name: snap['name'], imageUrl: snap['imageUrl'],
//   //       phone: snap['phone'],
//   //       address: snap['address'],
//   //       birthday: snap['birthday']);
//   //   return user;
//   // }
//
//   // @override
//   // // TODO: implement props
//   // List<Object?> get props => [name, email, phone, address, birthday, imageUrl];
// }

class UserModel {
  String? name;
  String? email;
  int? phone;
  String? address;
  String? birthday;
  String? imageUrl;

  //review
  double? rating;
  String? job;
  String? review;

  UserModel(
      {
      // required this.password,
      this.email,
      this.name,
      this.imageUrl,
      this.phone,
      this.address,
      this.birthday,
      this.rating,
      this.job,
      this.review});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: (json['email'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      imageUrl: (json['imageUrl'] ?? '').toString(),
      phone: int.parse(json['phone'].toString() ?? 0.toString()),
      // phone: json['phone'].toString(),
      address: (json['address'] ?? '').toString(),
      birthday: (json['birthday'] ?? '').toString(),
      rating: double.parse(json['rating'].toString() ?? 0.toString()),
      job: (json['job'] ?? '').toString(),
      review: (json['review'] ?? '').toString(),
    );
  }
// factory UserModelTest.fromJson(Map<String, dynamic> json) {
//   return UserModelTest(
//       email: json['email']??'',
//       name: json['name']??'',
//       imageUrl: json['imageUrl']??'',
//       phone: json['phone']??'',
//       address: json['address']??'',
//       birthday: json['birthday']??''
//   );
// }
}
