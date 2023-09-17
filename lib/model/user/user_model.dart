import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserModel extends Equatable {
  String? name;
  String? email;
  // String password;
  int? phone;
  String? address;
  String? birthday;
  String? imageUrl;

  UserModel({
    // required this.password,
    this.email ='',
    this.name = '',
    this.imageUrl = '',
    this.phone = 00000000,
    this.address = '',
    this.birthday = '',
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    int? phone,
    String? address,
    String? birthday,
    String? imageUrl,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      // password: password ?? this.password,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      birthday: birthday ?? this.birthday,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        phone: int.parse(json['phone']),
        address: json['address'],
        birthday: json['birthday']);
  }

  // static UserModel fromSnapshot (DocumentSnapshot snap){
  //   var user = UserModel(
  //   email: snap['email'],
  //       name: snap['name'], imageUrl: snap['imageUrl'],
  //       phone: snap['phone'],
  //       address: snap['address'],
  //       birthday: snap['birthday']);
  //   return user;
  // }

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, phone, address, birthday, imageUrl];
}

// class UserModel{
//   String name;
//   String email;
//   String password;
//   int phone;
//   String address;
//   String birthday;
//   String imageUrl;
// }
