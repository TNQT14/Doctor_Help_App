import 'package:doctor_help_app/screen/doctor/appointment_screen/appointment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'containts/containts.dart';
import 'package:line_icons/line_icons.dart';
import 'screen/screens.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});
  static String routeName = 'NavigationMenu';

  @override
  State<NavigationMenu> createState() => _NavigationMenu();
}

class _NavigationMenu extends State<NavigationMenu> {

  late int _index=0;
  final screens =[
    HomeScreen(),
    ChatScreen(),
    AppointmentScreen(),
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

