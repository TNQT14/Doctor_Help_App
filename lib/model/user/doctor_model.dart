import 'package:doctor_help_app/containts/add_images.dart';

import 'package:doctor_help_app/screen/screens.dart';

String txt = 'From commuter to operational, hobby to heavy duty tasks,'
    ' Dr. Detail provides expert detailing service and cosmetic care for any motorized vehicle.'
    '  Whether it’s an exterior hand wash to full cleaning and detailing, exterior polishing and waxing,'
    ' full interior shampoo & cleaning, addressing the dashboard and door panels, and cleaning glass,'
    ' inside and out, paint touch-ups, and more, Dr. Detail offers excellence in service.';

class DotorModel {
  String name;
  String email;
  int phone;
  String imageUrl;
  double rating;
  String description;
  // String fullname;
  String job;
  String experience;
  String review;

  DotorModel(
      {
        required this.name,
      required this.imageUrl,
      required this.email,
      required this.phone,
      required this.rating,
      required this.description,
      // required this.fullname,
      required this.job,
        required this.experience,
        required this.review,});
}

final DotorModel user1 = DotorModel(
    name: 'Meow Meow',
    imageUrl: imageCat2,
    email: 'Meow@gmail.com',
    phone: 0123456799,
    rating: 3.5,
    description: txt,
    job: 'Desmatologist',
  experience: '3 years',
  review: 'i feel like meow meow meow'
);
