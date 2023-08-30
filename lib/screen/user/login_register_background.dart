import 'package:doctor_help_app/screen/user/login_screen/login_screen.dart';
import 'package:doctor_help_app/screen/user/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../containts/containts.dart';
import '../../widgets/widgets.dart';

class LoginRegisterBackground extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  LoginRegisterBackground({
    super.key,
  });
  static String routeName = 'LoginRegisterBackground';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
          onTap: ()=> unfocusKeyboard(),
          child: Scaffold(
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints){
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight
                    ),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 36.h,
                            width: 195.w,
                            margin: EdgeInsets.only(left: 20.w, top: 12.h),
                            child: TabBar(
                              dividerColor:Colors.transparent,
                              indicatorColor: Colors.transparent,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
                              indicatorWeight: 0,
                              indicator: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: colorKmain,
                                      ),
                                      borderRadius: BorderRadius.circular(8))
                              ),
                              unselectedLabelColor: Colors.grey.shade500,
                              labelColor: colorKmain,
                              tabs: [
                                Tab(
                                  icon: Text(
                                    'Login',
                                    style: txt14w6,
                                  ),
                                ),
                                Tab(
                                    icon: Text(
                                      'Register',
                                      style: txt14w6,
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            height: 750.h,
                            child: TabBarView(children: [
                              LoginScreen(),
                             RegisterScreen()
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
