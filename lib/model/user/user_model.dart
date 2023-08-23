import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  String? email;
  String? password;
  int? phone;
  String? address;
  String? birthday;
  String? imageUrl;

  UserModel({
    this.password,
    this.email,
    this.name,
    this.imageUrl,
    this.phone,
    this.address,
    this.birthday,
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
      password: password ?? this.password,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      birthday: birthday ?? this.birthday,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
