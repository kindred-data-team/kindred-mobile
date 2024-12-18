import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:kindred_app/features/doctor/chat/pages/chat_screen.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/pages/bookings_screen.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/pages/doctor_plan.dart';
import 'package:kindred_app/features/doctor/homescreen/presentation/pages/homepage.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  List<Widget> screens = <Widget>[
    const HomePage(),
    // const Text(
    //   'Index 1: Calendar',
    // ),
    const DoctorPlan(name: "Kai", consultationType: "OB", time: "Secret"),
    const BookingsScreen(),
    const ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Chat',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
