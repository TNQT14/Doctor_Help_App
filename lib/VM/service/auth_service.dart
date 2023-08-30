import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //login
  Future<UserCredential> loginService(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      await _fireStore.collection('User').doc(userCredential.user!.uid).set({
        'userID':userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));
      // showFlutterToastMessage('Đăng nhập thành công');
     // print('userCredential: $userCredential');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      showFlutterToastMessage(e.toString());
      print('Error login: $e');
      rethrow;
    }
  }

  //regieter

  Future <UserCredential?> regieterService(String email, String password, String retypePassword) async{
    try{
      if(retypePassword==password){
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        await _fireStore.collection('User').doc(userCredential.user!.uid).set({
          'userID':userCredential.user!.uid,
          'email': email,
        });
        showFlutterToastMessage('Tạo tài khoản thành công');

        return userCredential;
      }
      else{
        showFlutterToastMessage('Mật khẩu và Nhập lại mật khẩu không khớp.');
        return null;
      }
    } on FirebaseAuthException catch (e){
      showFlutterToastMessage(e.toString());
      print('Error register: $e');
      return null;
    }
  }


//log out
Future logoutService(BuildContext context) async{
    try{
      await _auth.signOut();
      showFlutterToastMessage('Đăng xuất thành công');
      Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      showFlutterToastMessage(e.toString());
      print('Error logout: $e');
      return null;
    }
}
}
