import 'package:api_project/Screens/home_screen.dart';
import 'package:api_project/Screens/notification.dart';
import 'package:api_project/Screens/order_screen.dart';
import 'package:api_project/Screens/profile_screen.dart';
import 'package:api_project/constants.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Widget> pages = const [
    HomeScreen(),
    NotificationScreen(),
    OrderScreen(),
    ProfileScreen()
  ];
  int selectedIndex = 0;
  int temp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
            temp = value;
          });
        },
        elevation: 2.0,
        selectedItemColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        unselectedItemColor: lightTextColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: selectedIndex == 0 ? Colors.blue : lightTextColor,
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: const Icon(
                Icons.notifications_active,
                color: Colors.blue,
                size: 25,
              ),
              icon: Icon(
                Icons.notifications_active,
                color: selectedIndex == 1 ? Colors.blue : lightTextColor,
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: const Icon(
                Icons.receipt,
                color: Colors.blue,
                size: 25,
              ),
              icon: Icon(
                Icons.receipt,
                color: selectedIndex == 2 ? Colors.blue : lightTextColor,
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: const Icon(
                Icons.person_3_outlined,
                color: Colors.blue,
                size: 25,
              ),
              icon: Icon(
                Icons.person_3_outlined,
                color: selectedIndex == 3 ? Colors.blue : lightTextColor,
                size: 25,
              ),
              label: ""),
        ],
      ),
    );
  }
}
