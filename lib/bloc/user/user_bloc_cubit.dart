import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_bloc_state.dart';

class UserBlocCubit extends Cubit<UserBlocState> {
  UserBlocCubit() : super(UserBlocInitial());
}
