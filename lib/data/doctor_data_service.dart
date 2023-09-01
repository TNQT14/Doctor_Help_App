import 'package:doctor_help_app/model/user/doctor_model.dart';

abstract class DoctorDataService{
  Future<List<DoctorModel>> getDoctor();
}