import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realestate/data.dart/data.dart';
import 'package:realestate/navbar/profile.dart';
import 'package:realestate/navbar/saved.dart';
import 'package:realestate/navbar/search.dart';
import 'package:realestate/screans/homepage.dart';
import 'package:realestate/screans/sign_up.dart';

class TapScrean extends StatefulWidget {
  const TapScrean({super.key});

  @override
  State<TapScrean> createState() => _TapScreanState();
}

class _TapScreanState extends State<TapScrean> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
  // ignore: deprecated_member_use
  backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9), // Softer background
  activeColor: color, // Your accent color
  inactiveColor: Colors.white70, // Better contrast with grey background
  currentIndex: currentPage, // Sync with controller
  iconSize: 28, // Optimal icon size
  height: 60, // Better touch target
  border: Border(top: BorderSide(color: Colors.grey.shade300)), // Add top border
  onTap: (index) {
    _pageController.jumpToPage(index);
    setState(() => currentPage = index);
  },
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      activeIcon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_outline),
      activeIcon: Icon(Icons.bookmark),
      label: 'Saved',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {},
          children: [
            Homepage(),
            Search(propertyKey: '',  propertyImage: '', propertyValue: '',),
            Saved(),
            Profile(),
          ]),
    );
  }
}
