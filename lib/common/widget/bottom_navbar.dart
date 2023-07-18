import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:variegata_project/pages/dashboard/dashboard_page.dart';
import 'package:variegata_project/pages/profile_page.dart';

class BotNavbar extends StatefulWidget {
  const BotNavbar({super.key});

  @override
  State<BotNavbar> createState() => _BotNavbarState();
}

class _BotNavbarState extends State<BotNavbar> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    DashboardPage(),
    Center(child: Text("1")),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Color(0xFF94AF9F),
            inactiveColor: Colors.grey,
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Wishlist'),
            activeColor: Color(0xFF94AF9F),
            inactiveColor: Colors.grey,
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.person_2_sharp),
            title: Text('Profile'),
            activeColor: Color(0xFF94AF9F),
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
