import 'package:bloc/bloc.dart';
import 'package:doctor_help_app/model/user/customer_of_doc_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/data_source/doctor_firestore_service.dart';
import '../../model/user/doctor_model.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context) => BlocProvider.of(context);
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

  Future getListCustomer()async{
    try{
      emit(CustomerLoading());
      final listcustomer = await _doctorFirestoreService.getListCustomerOfDoctor();
      emit(CustomerLoading(isLoading: false));
      if(listcustomer!=null){
        emit(CustomerSuccess(listcustomer: listcustomer));
      }
    }catch(e){
      emit(CustomerLoading());
      print('getListDataDoctor error: $e');
    }
  }
}
