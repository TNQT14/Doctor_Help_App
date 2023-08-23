part of 'user_bloc_cubit.dart';

@immutable
abstract class UserBlocState {}

class UserBlocInitial extends UserBlocState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

//login

class LoginSuccess extends UserBlocState {
  UserCredential userCredential;
  LoginSuccess({required this.userCredential});
  @override
  List<Object?> get props => [userCredential];
}

class LoginLoading extends UserBlocState {
  bool isLoading;
  LoginLoading({this.isLoading=true});
  @override
  List<Object?> get props => [isLoading];
}

class LoginError extends UserBlocState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

//register

class RegisterSuccess extends UserBlocState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class RegisterLoading extends UserBlocState {
  bool isLoading;
  RegisterLoading({this.isLoading=true});
  @override
  List<Object?> get props => [isLoading];
}

class RegisterError extends UserBlocState {
  @override
  List<Object?> get props => throw UnimplementedError();
}