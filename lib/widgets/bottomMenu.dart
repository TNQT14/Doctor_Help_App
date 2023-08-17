import 'package:doctor_help_app/routes.dart';
import 'package:doctor_help_app/screen/home_screen/home_screen.dart';
import 'package:doctor_help_app/screen/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import '../containts/containts.dart';
import 'package:line_icons/line_icons.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {

  late int index=0;
  final screens =[
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    print('index: $index');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        unselectedItemColor: colorUnSelectedBottomMenu,
        selectedItemColor: colorSelectedBottomMenu,
        currentIndex: index,
        onTap: (int newindex){
          setState(() {
            print('index: $index');
            if(index==0)
              HomeScreen();
            if(index==4)
              ProfileScreen();
            index = newindex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(LineIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat),
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
      );
    }
}

