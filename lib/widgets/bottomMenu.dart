import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../containts/containts.dart';
import 'package:line_icons/line_icons.dart';
import '../screen/screens.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {

  late int _index=0;
  final screens =[
    HomeScreen(),
    ChatScreen(),
    AppointmentDateTimeScreen(),
    DoctordetailScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    print('index: $_index');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: colorUnSelectedBottomMenu,
          selectedItemColor: colorSelectedBottomMenu,
          currentIndex: _index,
          onTap: (int newindex){
            setState(() {
              print('index: $_index');
              _index = newindex;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon:  Container(
                  width: 22,
                  height: 29,
                  child: Image.asset(
                      _index==0 ? iconSelectHome: iconHome)
              ),
            ),
            BottomNavigationBarItem(
              label: 'Chat',
              icon:  Container(
                  width: 22,
                  height: 29,
                  child: Image.asset(
                      _index==1 ? iconSelectedChat: iconChat)
              ),
            ),
            BottomNavigationBarItem(
              label: 'Appointment',
              icon: Container(
                  width: 22,
                  height: 29,
                  child: Image.asset(
                      _index==2 ? iconSelectedList: iconList)
              ),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Container(
                  width: 22,
                  height: 29,
                  child: Image.asset(
                      _index==3 ? iconSelectedHeart: iconHeart)
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Container(
                  width: 22,
                  height: 29,
                  child: Image.asset(
                      _index==4 ? iconSelectedProfile: iconProfileNav)
              ),
            ),
          ],
        ),
    );
    }
}

