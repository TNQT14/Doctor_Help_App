part of 'fillForm_bloc_cubit.dart';

@immutable
abstract class FillFormBlocState{}

class FillFormBlocInitial extends FillFormBlocState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FilledFormSucess extends FillFormBlocState {
  String name;
  String birthday;
  String phone;
  String address;
  FilledFormSucess({required this.name,
    required this.birthday,
    required this.phone,
    required this.address,
  });
  @override
  List<Object?> get props => [name, birthday,phone, address];
}

class FilledFormLoading extends FillFormBlocState {
  bool isFilling;
  FilledFormLoading({this.isFilling=true});
  @override
  List<Object?> get props => [isFilling];
}

class FilledFormError extends FillFormBlocState {
  @override
  List<Object?> get props => throw UnimplementedError();
}