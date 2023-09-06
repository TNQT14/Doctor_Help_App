import 'package:bloc/bloc.dart';
import 'package:doctor_help_app/VM/service/auth_service.dart';
import 'package:doctor_help_app/VM/service/user_responsitory.dart';
import 'package:doctor_help_app/model/user/user_model.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../widgets/show_toast_messes.dart';

part 'user_bloc_state.dart';

class UserBlocCubit extends Cubit<UserBlocState> {
  static UserBlocCubit get(context) => BlocProvider.of(context);
  UserBlocCubit() : super(UserBlocInitial());
  AuthService _authService = AuthService();
  UserResponsitory _userResponsitory = UserResponsitory();
  List<UserModel> userLogin = [];



  Future loginCubit(BuildContext context, String email, String password) async{
    try{
      emit(LoginLoading());
      final login = await _authService.loginService(email, password);
      emit(LoginLoading(isLoading: false));
      if(login!=null && login.user!=null){
        emit(LoginSuccess(userCredential: login));
        await getUserData();
        showFlutterToastMessage('Đăng nhập thành công');

        Navigator.pushNamed(context, NavigationMenu.routeName);
      }
    }catch(e){
      emit(LoginLoading(isLoading: false));
      print('loginCubit: $e');
    }
  }

  Future getUserData ()async{

    try{
      emit(UserLoading());
      final listUser = await _userResponsitory.getListUser();
      emit(UserLoading(isLoading: false));
      if(listUser!=null){
        userLogin = listUser;
        emit(UserSuccess(listUser: listUser));
      }
    }catch(e){
      emit(UserLoading(isLoading: false));
      print(e);
    }
  }
}
