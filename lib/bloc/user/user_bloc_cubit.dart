import 'package:bloc/bloc.dart';
import 'package:doctor_help_app/VM/service/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../widgets/show_toast_messes.dart';

part 'user_bloc_state.dart';

class UserBlocCubit extends Cubit<UserBlocState> {
  UserBlocCubit() : super(UserBlocInitial());
  AuthService _authService = AuthService();

  Future loginCubit(String email, String password) async{
    try{
      emit(LoginLoading());
      final login = await _authService.loginService(email, password);
      emit(LoginLoading(isLoading: false));
      if(login!=null && login.user!=null){
        emit(LoginSuccess(userCredential: login));
        showFlutterToastMessage('Đăng nhập thành công');
      }
    }catch(e){
      emit(LoginLoading(isLoading: false));
      print('loginCubit: $e');
    }
  }
}
