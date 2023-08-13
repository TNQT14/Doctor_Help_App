import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../containts/containts.dart';
import '../../widgets/widgets.dart';



class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorF9f9fe,
      // tabBarWidget là 1 cái funtion cần tham số truyền vào có dạng tabBarWidget(title1, title2, tab1, tab2)
      // cho mn dễ nhìn nên tui code nó theo dạng cho phép null (tức là có thể truyền tham số vào hoặc không)
      // muốn truyền vào tham số nào thì gọi tên nó như code bên dưới
      // trong đó: title1: text của tab1, title2: text của tab2, tab1: phần thân của màn hình 1, tab2: phần thân của màn hình 2
      // code trong tab như code trong 1 màn hình bình thường, xem TabBar flutter để biết thâm chi tiết
        body: tabBarWidget(
          title1: 'History',
          title2: 'Register',
          tab1: Container(
            // color: Colors.yellow,
              child: Center(child: Text('tap 1'))),
         tab2: Container(
            // color: Colors.yellow,
              child: Center(child: Text('tap 1'))),
        ));
  }
}


