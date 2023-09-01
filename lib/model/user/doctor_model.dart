import 'dart:convert';

import 'package:doctor_help_app/containts/add_images.dart';

import 'package:doctor_help_app/screen/screens.dart';

String txt = 'From commuter to operational, hobby to heavy duty tasks,'
    ' Dr. Detail provides expert detailing service and cosmetic care for any motorized vehicle.'
    '  Whether it’s an exterior hand wash to full cleaning and detailing, exterior polishing and waxing,'
    ' full interior shampoo & cleaning, addressing the dashboard and door panels, and cleaning glass,'
    ' inside and out, paint touch-ups, and more, Dr. Detail offers excellence in service.';

class DoctorModel {
  String name;
  String email;
  int phone;
  String imageUrl;
  double rating;
  String description;
  DateTime birthDay;
  // String fullname;
  String job;
  String experience;
  String review;

  DoctorModel(
      {
        required this.name,
      required this.imageUrl,
      required this.email,
      required this.phone,
      required this.rating,
      required this.description,
        required this.birthDay,
      // required this.fullname,
      required this.job,
        required this.experience,
        required this.review,});

  factory DoctorModel.fromJson(Map<String, dynamic> json){
  return DoctorModel(
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String,
  email: json['email'] as String,
  phone: json['phone'] as int,
  rating: json['rating'] as double,
  description: json['description'] as String,
  birthDay: json['birthDay'] as DateTime,
  job: json['job'] as String,
  experience: json['experience'] as String,
  review: json['review'] as String);
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'imageUrl': imageUrl,
      'email': email,
      'phone': phone,
      'rating': rating,
      'description': description,
      'birthDay': birthDay,
      'job': job,
      'experience': experience,
      'review': review,
    };
  }


}

final DoctorModel user1 = DoctorModel(
    name: 'Meow Meow',
    imageUrl: imageCat2,
    email: 'Meow@gmail.com',
    phone: 0123456799,
    birthDay:  DateTime.parse('1969-07-20'),
    rating: 3.5,
    description: txt,
    job: 'Desmatologist',
    experience: '3 years',
    review: 'i feel like meow meow meow'
);


//List
final List<DoctorModel> listdoc =[
  DoctorModel(
      name: 'Meow 1',
      imageUrl: imageCat2,
      email: 'Meow@gmail.com',
      phone: 0123456799,
      birthDay:  DateTime.parse('1969-07-20'),
      rating: 3.5,
      description: txt,
      job: 'kêu meow meow',
      experience: '3 years',
      review: 'i feel like meow meow meow'
  ),
  DoctorModel(
      name: 'Meow 2',
      imageUrl: imageCat2,
      email: 'Meow@gmail.com',
      phone: 0123456799,
      birthDay:  DateTime.parse('1969-07-20'),
      rating: 3.5,
      description: txt,
      job: 'just meow meow like meo1',
      experience: '3 years',
      review: 'i feel like meow meow meow'
  ),
  DoctorModel(
      name: 'Meow Cale',
      imageUrl: imageCale,
      email: 'Meow@gmail.com',
      phone: 0123456799,
      birthDay:  DateTime.parse('1969-07-20'),
      rating: 3.5,
      description: txt,
      job: 'đẹp trai',
      experience: '3 years',
      review: 'i feel like meow meow meow'
  ),
  DoctorModel(
      name: 'Meow Cale cưng vcl',
      imageUrl: imageCale2,
      email: 'Meow@gmail.com',
      phone: 0123456799,
      birthDay:  DateTime.parse('1969-07-20'),
      rating: 3.5,
      description: txt,
      job: 'trai đẹp',
      experience: '3 years',
      review: 'i feel like meow meow meow'
  )
];


