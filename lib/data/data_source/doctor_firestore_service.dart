import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/data/doctor_data_service.dart';
import 'package:doctor_help_app/model/user/customer_of_doc_model.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../screen/appointment_screen/appointment_success_screen.dart';

class DoctorFirestoreService implements DoctorDataService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  CollectionReference doctors = FirebaseFirestore.instance.collection('Doctor');

  @override
  Future<List<DoctorModel>> getDoctor() async {
    List<DoctorModel> doctorList = [];
    await doctors.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doctorList
            .add(DoctorModel.fromJson(doc.data() as Map<String, dynamic>));
        print(doctorList);
      });
    });
    return Future.value(doctorList);
  }

  //goi tam de get list data doctor
  Future<List<DoctorModel>?> getListDoctor() async {
    List<DoctorModel> listDoctor = [];
    try {
      final getData = await _store.collection('Doctor').get();
      getData.docs.forEach((element) {
        return listDoctor.add(DoctorModel.fromJson(element.data()));
      });
      print(await listDoctor);
      return listDoctor;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Failed with error ${e.code}: ${e.message}');
      }
      return listDoctor;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<CustomerOfDocModel>?> getListCustomerOfDoctor() async {
    List<CustomerOfDocModel> listCustomerOfDoctor = [];
    try {
      final getData = await _store.collection('customer_of_doc').get();
      getData.docs.forEach((element) {
        return listCustomerOfDoctor
            .add(CustomerOfDocModel.fromJson(element.data()));
      });
      print(await listCustomerOfDoctor);
      return listCustomerOfDoctor;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Failed with error ${e.code}: ${e.message}');
      }
      return listCustomerOfDoctor;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future fetchAppointment(
      {
      //   required String name,
      // required String job,
      required String dateTime,
      // required String uidDoctor,
      required DoctorModel doctorModel,
      required BuildContext context}) async {
    try {
      await _store
          .collection('appointment_history')
          .doc(_auth.currentUser!.uid)
      //     .set({
      //   'dateTime': dateTime,
      //   'name': doctorModel.name,
      //   'job': doctorModel.job,
      //   'status': 'on_going',
      //   'uidDoctor': doctorModel.uidDoctor,
      //   'imageUrl': doctorModel.imageUrl
      // });
      //     .set({
      //   // 'name': doctorModel.name,
      //   // 'job': doctorModel.job,
      //   'dateTime': dateTime,
      //   'doctor': doctorModel.toJson(),
      //   // 'uidDoctor': doctorModel.uidDoctor,
      //   'status': 'on_going'
      // });
          .collection(doctorModel.uidDoctor).add({
        // 'doctorin4': doctorModel.toJson(),
        // 'dateTime': dateTime
        //   'dateTime': dateTime,
          'name': doctorModel.name,
          'job': doctorModel.job,
          'status': 'on_going',
          'uidDoctor': doctorModel.uidDoctor,
          'imageUrl': doctorModel.imageUrl
      });

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AppointmentSuccessScreen(
                  doctorModel: doctorModel,
                )),
      );
    } catch (e) {
      print(e);
    }
    // await _store.collection('User').doc(userCredential.user!.uid).set({
    //   'userID': userCredential.user!.uid,
    //   'email': email,
    // });
  }

  Future getdata(DoctorModel doctorModel) async{
    List<AppointmentModel> listAppointment = [];
    try{
       final gets = await _store.collection('appointment_history').doc(doctorModel.uidDoctor).get();
       gets.data();
       print(gets.data());
    } catch(e){
      print(e);
    }
  }
}

class AppointmentModel {
  String status;
  String dateTime;
  String name;
  String job;
  String uidDoctor;
  String imageUrl;
  AppointmentModel(
      {required this.uidDoctor,
      required this.dateTime,
      required this.job,
      required this.name,
      required this.status,
      required this.imageUrl});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      name: json['name'].toString() ?? 'Chưa có duex liệu',
      imageUrl: json['imageUrl'].toString() ?? 'Chưa có duex liệu',
      // birthDay: json['birthDay'] as DateTime,
      job: json['job'].toString() ?? 'Chưa có duex liệu',
      uidDoctor: json['uidDoctor'].toString() ?? 'Chưa có duex liệu',
      status: json['status'].toString() ?? 'Chưa có duex liệu',
      dateTime: json['dateTime'].toString() ?? 'Chưa có duex liệu',
    );
  }
}
