import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/model/user/message_model.dart';
import 'package:doctor_help_app/model/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserResponsitory {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<List<UserModel>?> getListUser() async {
    List<UserModel> listUser = [];
    try {
      final getData = await _store.collection('User').get();
      getData.docs.forEach((element) {
        return listUser.add(UserModel.fromJson(element.data()));
      });
      // print(await listUsser);
      return listUser;
      // _store.collection('User').get()
      //     .then((value) {
      //       // return value.docs.map((e) => UserModel.fromSnapshot(e)).toList();
      // });
      // _store.collection('User').snapshots().map((event) {
      //   return event.docs.map((e) => UserModelDemo.fromSnapshot(e)).toList();
      // });
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Failed with error ${e.code}: ${e.message}');
      }
      return listUser;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel?> getUserDetail() async {
    UserModel userModel;
    try {
      String uid = _auth.currentUser!.uid;
      userModel = await _store.collection('User').doc(uid).get().then((value) {
        return UserModel.fromJson(value.data()!);
      });
      // print(userModel);
      return userModel;
    } catch (e) {
      throw Exception(e.toString());
    }

  }
  Future<UserModel?> updateUserDetail(
      String name,
      String birthday,
      String phone,
      String address,
      ) async{
    UserModel userModel = UserModel(
      name: name,
      birthday: birthday,
      phone: int.parse(phone),
      address: address,
    );
    try{
      String uid = _auth.currentUser!.uid;
      await _store.collection('User').doc(uid).update(
        {
          'name': name,
          'birthday': birthday,
          'phone': phone,
          'address': address,
        }
      );
      return userModel;
    } catch(e){
      throw Exception(e.toString());
    }
  }

  //send and get mess

  Future<void> sendMess(String receiverID, String mess) async {
    final String _userUid = _auth.currentUser!.uid;
    final String _userEmail = _auth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    MessageModel newMessage = MessageModel(
        timestamp: timestamp,
        message: mess,
        receiverID: receiverID,
        senderEmail: _userEmail,
        senderID: _userUid);

    List<String> ids = [_userUid, receiverID];
    ids.sort();
    String chatroomID = ids.join('_');

    await _store
        .collection('chat_rooms')
        .doc(chatroomID)
        .collection('Messages')
        .add(newMessage.toJson());
  }

  Stream<QuerySnapshot> getMessage(String userID, String orderUserID) {
    List<String> ids = [userID, orderUserID];
    ids.sort();
    String chatroomID = ids.join('_');
    return _store
        .collection('chat_rooms')
        .doc(chatroomID)
        .collection('Messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
