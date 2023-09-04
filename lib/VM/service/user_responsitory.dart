import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/model/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserResponsitory{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<List<UserModel>?> getListUser() async{
    List<UserModel> listUsser = [];
    try{
      final getData = await _store.collection('User').get();
      getData.docs.forEach((element) {
        return listUsser.add(UserModel.fromJson(element.data()));
      });
      // print(await listUsser);
      return listUsser;
      // _store.collection('User').get()
      //     .then((value) {
      //       // return value.docs.map((e) => UserModel.fromSnapshot(e)).toList();
      // });
      // _store.collection('User').snapshots().map((event) {
      //   return event.docs.map((e) => UserModelDemo.fromSnapshot(e)).toList();
      // });
    } on FirebaseAuthException catch(e){
      if(kDebugMode){
        print('Failed with error ${e.code}: ${e.message}');
      }
      return listUsser;
    } catch(e){
      throw Exception(e.toString());
    }
  }


}