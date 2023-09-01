import 'package:doctor_help_app/model/user/doctor_model.dart';

abstract class DoctorReponsitory{
  Future<List<DoctorModel>> getDoctor();
}