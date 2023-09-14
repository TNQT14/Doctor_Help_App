import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../VM/service/user_responsitory.dart';
import '../../widgets/show_toast_messes.dart';
part 'fillForm_bloc_state.dart';

class FillFormBlocCubit extends Cubit<FillFormBlocState> {
  FillFormBlocCubit() : super(FillFormBlocInitial());
  UserResponsitory _userResponsitory = UserResponsitory();
  // FillFormBlocCubit(super.initialState);

  static FillFormBlocCubit get(context) => BlocProvider.of(context);
  Future filledForm(BuildContext context,String name,String birthday,String phone,String address) async {
    try {
      print("filledForm1 : ${name.length}");
      print("Tên ${name.length}");
      print("birthday ${birthday.length}");
      print("phone ${phone.length}");
      print("address ${address.length}");
      emit(FilledFormLoading());
      // final filled = await _userResponsitory.updateUserDetail(
      //     name, birthday, phone, address);
      // emit(FilledFormLoading(isFilling: false));
      if (
      // filled !=null &&
      // filled.name != null &&
      // filled.birthday != null &&
      // filled.phone != null &&
      // filled.address != null
      // name != null &&
      //     birthday != null &&
      //     phone != null &&
      //     address != null
      name.isNotEmpty && birthday.isNotEmpty && phone.isNotEmpty&& address.isNotEmpty
      ) {
        print("filledForm2: name");
        emit(FilledFormSucess(
            name: name, birthday: birthday, phone: phone, address: address));
        showFlutterToastMessage('Cập nhập thành công');
        emit(FilledFormLoading(isFilling: false));
      }
    }catch(e)
    {
      emit(FilledFormLoading(isFilling: false));
      print(e);
    }
  }
}