import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        backgroundColor: Colors.grey,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              currentPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              
                icon: Icon(Icons.home,
                    color: currentPage == 0 ? color: Colors.white),
                label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search,color: currentPage == 1 ? color: Colors.white), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border
                ,color: currentPage == 2 ? color: Colors.white), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person,
            color: currentPage == 3 ? color: Colors.white), label: ''),
          ]),
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {},
          children: [
            Homepage(),
            Search(),
            Saved(),
            Profile(),
          ]),
    );
  }
}
