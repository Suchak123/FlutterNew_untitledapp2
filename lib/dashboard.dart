import 'package:flutter/material.dart';
import 'package:untitledapp2/service/base_auth_service.dart';

import 'list_view.dart';
import 'profile.dart';
import 'topPicks.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _currentIndex = 0;

  final pages = [
    TopPicks(),
    ListViewScreen(),
    Profile(),
  ];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.holiday_village),
              label: 'Dashboard'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.safety_check),
              label: 'List View'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.important_devices),
              label: 'Account'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profile'
          ),
        ],

      ),
      body: pages.elementAt(_currentIndex),

    );
  }
}
