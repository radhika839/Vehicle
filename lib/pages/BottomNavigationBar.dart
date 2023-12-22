import 'package:flutter/material.dart';
import 'package:vehicle_workshop/pages/homePage.dart';
import 'package:vehicle_workshop/pages/homePage2.dart';
import 'package:vehicle_workshop/pages/profilePage.dart';
import 'package:vehicle_workshop/pages/searchPage.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentIndex = 0;
  final List<Widget> children = [HomePage(), SearchPage(), ProfilePage()];
  void onTappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: children[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: onTappedBar,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
