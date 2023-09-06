import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/model/user/user_model.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../onboarding_screen/onboarding_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){

        if(snapshot.hasData) {
          return NavigationMenu();
        }
        else{
          return LoginRegisterBackground();
        }
      },
    );
  }
}

///onboarding check user loged or not

// Future check(BuildContext context) async{
//   var _auth = await FirebaseAuth.instance.currentUser;
//   if(_auth!=null){
//     return Navigator.pushNamed(context, NavigationMenu.routeName);
//   }
//   return Navigator.pushNamed(context, LoginRegisterBackground.routeName);
// }
//
// class AuthGate extends StatefulWidget {
//   const AuthGate({Key? key}) : super(key: key);
//
//   @override
//   State<AuthGate> createState() => _AuthGateState();
// }
//
// class _AuthGateState extends State<AuthGate> {
//   var _auth = FirebaseAuth.instance.currentUser;
//
//   @override
//   void initState(){
//     super.initState();
//     Future.delayed(Duration(milliseconds: 10,), ()async{
//       await check(context);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Onboarding', style: txt32w7,),
//             Image.asset(imageCat)
//           ],
//         ),
//       ),
//     );
//   }
// }

