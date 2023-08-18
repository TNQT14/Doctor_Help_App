import 'package:doctor_help_app/routes.dart';
import 'package:doctor_help_app/screen/home_screen/home_screen.dart';
import 'package:doctor_help_app/screen/profile_screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../containts/containts.dart';
import 'package:line_icons/line_icons.dart';

import '../screen/appointment_screen/appointment_dateTime_screen.dart';
import '../screen/chat_screen/chat_screen.dart';
import '../screen/doctor_detail_screen/doctor_detail_screen.dart';

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
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(LineIcons.home),
            ),
            BottomNavigationBarItem(
              label: 'Chat',
              icon: Icon(CupertinoIcons.chat_bubble_text),
            ),
            BottomNavigationBarItem(
              label: 'Appointment',
              icon: Icon(Icons.list_alt_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(Icons.favorite_outline),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person_outline_outlined),
            ),
          ],
        ),
    );
    }
}

