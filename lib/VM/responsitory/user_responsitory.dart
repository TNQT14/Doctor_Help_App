import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/widgets/show_toast_messes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserResponsitory{
  createUserFirestore(String email, String password) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    user
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if(querySnapshot.docs.isEmpty){
        user.add({
          'email':email,
          'password': password,
          'userId': FirebaseAuth.instance.currentUser?.uid
        });
        showFlutterToastMessage('đăng ký thành công');
      }
    })
        .catchError((onError){
          showFlutterToastMessage(onError.toString());
      print(onError.toString());
    });
  }
}