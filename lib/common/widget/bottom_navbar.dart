import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:variegata_project/pages/catalog_shop/dashboard_catalog.dart';
import 'package:variegata_project/pages/dashboard/dashboard_page.dart';
import 'package:variegata_project/pages/profile/profile_page.dart';

class BotNavbar extends StatefulWidget {
  const BotNavbar({Key? key}) : super(key: key);

  @override
  State<BotNavbar> createState() => _BotNavbarState();
}

class _BotNavbarState extends State<BotNavbar> {
  // ignore: unused_field
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  List<Widget> tabItems = [
    DashboardPage(),
    const KatalogShop(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: tabItems,
      ),
      bottomNavigationBar: MotionTabBar(
        labels: const ["Home", "Search", "Profile"],
        initialSelectedTab: "Home",
        tabIconColor: Colors.grey[400],
        tabSelectedColor: const Color(0xFF94AF9F),
        onTabItemSelected: (int index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        icons: const [
          Icons.home,
          Icons.search_rounded,
          Icons.person,
        ],
        textStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
