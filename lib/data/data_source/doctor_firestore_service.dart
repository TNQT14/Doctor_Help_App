import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/data/doctor_data_service.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class DoctorFirestoreService implements DoctorDataService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  CollectionReference doctors = FirebaseFirestore.instance.collection('Doctor');

  @override
  Future<List<DoctorModel>> getDoctor() async {
    List<DoctorModel> doctorList = [];
    await doctors.get().then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        doctorList.add(DoctorModel.fromJson(doc.data() as Map<String, dynamic>));
        print(doctorList);
      });
    });
    return Future.value(doctorList);
  }

  //goi tam de get list data doctor
  Future<List<DoctorModel>?> getListDoctor() async{
    List<DoctorModel> listDoctor = [];
    try{
      final getData = await _store.collection('Doctor').get();
      getData.docs.forEach((element) {
        return listDoctor.add(DoctorModel.fromJson(element.data()));
      });
      print(await listDoctor);
      return listDoctor;
    } on FirebaseAuthException catch(e){
      if(kDebugMode){
        print('Failed with error ${e.code}: ${e.message}');
      }
      return listDoctor;
    } catch(e){
      throw Exception(e.toString());
    }
  }

}