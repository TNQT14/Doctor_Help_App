import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/data/doctor_data_service.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';

class DoctorFirestoreService implements DoctorDataService{

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

}