import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WrapProvider extends StatelessWidget {
  const WrapProvider({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<UserBlocCubit>(create: (BuildContext context)=> UserBlocCubit()),
      ], child: child);
  }
}