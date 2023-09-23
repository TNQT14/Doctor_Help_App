import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/screen/user/login_register_background.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../../screen/user/forgot_password_screen/check_your_email_screen.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //login
  Future<UserCredential> loginService(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      await _fireStore.collection('User').doc(userCredential.user!.uid).set({
        'userID': userCredential.user!.uid,
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

  //register

  Future<UserCredential?> registerService(
      String email, String password, String retypePassword) async {
    try {
      if (retypePassword == password) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        await _fireStore.collection('User').doc(userCredential.user!.uid).set({
          'userID': userCredential.user!.uid,
          'email': email,
        });
        showFlutterToastMessage('Tạo tài khoản thành công');

        return userCredential;
      } else {
        showFlutterToastMessage('Mật khẩu và Nhập lại mật khẩu không khớp.');
        return null;
      }
    } on FirebaseAuthException catch (e) {
      showFlutterToastMessage(e.toString());
      print('Error register: $e');
      return null;
    }
  }

//log out
  Future logoutService(BuildContext context) async {
    try {
      await _auth.signOut();
      showFlutterToastMessage('Đăng xuất thành công');
      // Navigator.pop(context);
      Navigator.pushNamed(context, LoginRegisterBackground.routeName);
    } on FirebaseAuthException catch (e) {
      showFlutterToastMessage(e.toString());
      print('Error logout: $e');
      return null;
    }
  }

  //forgot password
  Future<UserCredential?> forgotPassword({required String email, required BuildContext context}) async{
    try{
      // _auth.sendPasswordResetEmail(email: email);
      // final newPassword = generateRandomPassword();
      //
      // sendNewPasswordByEmail(email, newPassword);
      //
      // _auth.currentUser!.updatePassword(newPassword);

      // await updateUserPasswordInFirestore(email, newPassword);
      // Gửi email đặt lại mật khẩu từ Firebase
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showFlutterToastMessage("Mật khẩu mới đã được gửi đến email của bạn");
      print('Email đặt lại mật khẩu đã được gửi thành công.');

      // Navigator.pushNamed(context, CheckYourEmailScreen.routeName);

      // // Tạo mật khẩu mới ngẫu nhiên
      // final newPassword = generateRandomPassword();
      //
      // // Gửi mật khẩu mới qua email
      // await sendNewPasswordByEmail(email, newPassword);
    }on FirebaseAuthException catch(e){
      showFlutterToastMessage("Email không đúng hoặc không tồn tại");
      print('Error login: $e');
      rethrow;
    }
  }
  String generateRandomPassword() {
    final random = Random.secure();
    const charset = "0123456789";

    return List.generate(8, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  Future<void> sendNewPasswordByEmail(String email, String newPassword) async {
    final smtpServer = gmail('tnquangthai2002@gmail.com', 'agaozdyswcmuqfxu');
    final message = Message()
      ..from = Address('tnquangthai2002@gmail.com', 'Doctor Help App')
      ..recipients.add(email)
      ..subject = 'Mật khẩu mới'
      ..text = 'Mật khẩu mới của bạn là: $newPassword';

    try {
      final sendReport = await send(message, smtpServer);
      print('Email đã được gửi đi: $sendReport');
    } catch (e) {
      print('Lỗi khi gửi email: $e');
      throw e;
    }
  }

  Future<void> updateUserPasswordInFirestore(String email, String newPassword) async {

    try {
      final user = _auth.currentUser;
      await user?.updatePassword(newPassword);
      final querySnapshot = await _fireStore
          .collection('User')
          .where('email', isEqualTo: email)
          .get();


      if (querySnapshot.docs.isNotEmpty) {

        print('Cập nhật thành công: $email');
      } else {
        print('Không tìm thấy người dùng với email: $email');
      }
    } catch (e) {
      print('Lỗi khi cập nhật mật khẩu trong Firestore: $e');
      throw e;
    }
  }
//change password

}
