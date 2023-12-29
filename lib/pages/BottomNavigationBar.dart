import 'package:flutter/material.dart';
import 'package:vehicle_workshop/pages/homePage.dart';
import 'package:vehicle_workshop/pages/labour.dart';
import 'package:vehicle_workshop/pages/product.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentIndex = 0;
  final List<Widget> children = [HomePage(), ProductPage(), LabourData()];
  void onTappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: children[currentIndex]),
      bottomNavigationBar: Stack(children: [
        BottomNavigationBar(
            //  type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.white,
            onTap: onTappedBar,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Product'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Labour'),
            ]),
      ]),
    );
  }
}
