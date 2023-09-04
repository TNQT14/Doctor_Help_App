part of 'doctor_cubit.dart';

@immutable
abstract class DoctorState extends Equatable {}

class DoctorInitial extends DoctorState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

//get list doctor

class DoctorLoading extends DoctorState {
  bool isLoading;
  DoctorLoading({this.isLoading = true});
  @override
  List<Object?> get props => [isLoading];
}
class DoctorSuccess extends DoctorState {
  List<DoctorModel> listDoctor;
  DoctorSuccess({required this.listDoctor});
  @override
  List<Object?> get props => [listDoctor];
}

class DoctorError extends DoctorState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

