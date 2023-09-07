import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/data_source/doctor_firestore_service.dart';
import '../../model/user/doctor_model.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  DoctorFirestoreService _doctorFirestoreService = DoctorFirestoreService();

  Future getListDataDoctor()async{
    try{
      emit(DoctorLoading());
      final listDoctor = await _doctorFirestoreService.getListDoctor();
      emit(DoctorLoading(isLoading: false));
      if(listDoctor!=null){
        emit(DoctorSuccess(listDoctor: listDoctor));
      }
    }catch(e){
      emit(DoctorLoading());
      print('getListDataDoctor error: $e');
    }
  }
}
