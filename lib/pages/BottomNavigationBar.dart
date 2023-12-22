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




//import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   final Widget? Text;
//   const HomeScreen({super.key, this.Text});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final List<Widget> _screens = [
//     // Content for Home tab
//     Container(
//       color: Colors.yellow.shade100,
//       alignment: Alignment.center,
//       child: const Text(
//         'Profile',
//         style: TextStyle(fontSize: 40),
//       ),
//     ),
//     // Content for Feed tab
//     Container(
//       color: Colors.purple.shade100,
//       alignment: Alignment.center,
//       child: const Text(
//         'Home',
//         style: TextStyle(fontSize: 40),
//       ),
//     ),
//     // Content for Favorites tab
//     // Container(
//     //   color: Colors.red.shade100,
//     //   alignment: Alignment.center,
//     //   child: const Text(
//     //     'Favorites',
//     //     style: TextStyle(fontSize: 40),
//     //   ),
//     // ),
//     // Content for Settings tab
//     Container(
//       color: Colors.pink.shade300,
//       alignment: Alignment.center,
//       child: const Text(
//         'Settings',
//         style: TextStyle(fontSize: 40),
//       ),
//     )
//   ];

//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Welcome To My Vehicle WorkShop",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//       bottomNavigationBar: MediaQuery.of(context).size.width < 640
//           ? BottomNavigationBar(
//               currentIndex: _selectedIndex,
//               unselectedItemColor: Colors.grey,
//               selectedItemColor: Colors.indigoAccent,
//               // called when one tab is selected
//               onTap: (int index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//               // bottom tab items
//               items: const [
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.person), label: 'Profile'),
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.home), label: 'Home'),
//                   // BottomNavigationBarItem(
//                   //     icon: Icon(Icons.favorite), label: 'Favorites'),
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.settings), label: 'Settings')
//                 ])
//           : null,
//       body: Row(
//         children: [
//           if (MediaQuery.of(context).size.width >= 640)
//             NavigationRail(
//               onDestinationSelected: (int index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//               selectedIndex: _selectedIndex,
//               destinations: const [
//                 NavigationRailDestination(
//                     icon: Icon(Icons.person), label: Text('Profile')),
//                 NavigationRailDestination(
//                     icon: Icon(Icons.home), label: Text('Home')),
//                 // NavigationRailDestination(
//                 //     icon: Icon(Icons.favorite), label: Text('Favorites')),
//                 NavigationRailDestination(
//                     icon: Icon(Icons.settings), label: Text('Settings')),
//               ],

//               labelType: NavigationRailLabelType.all,
//               selectedLabelTextStyle: const TextStyle(
//                 color: Colors.teal,
//               ),

//               unselectedLabelTextStyle: const TextStyle(),
//               // Called when one tab is selected
//               // leading: Column(
//               //   children: const [
//               //     SizedBox(
//               //       height: 8,
//               //     ),
//               //     CircleAvatar(
//               //       radius: 20,
//               //       child: Icon(Icons.person),
//               //     ),
//               //   ],
//               // ),
//             ),
//           Expanded(child: _screens[_selectedIndex])
//         ],
//       ),
//     );
//   }
// }
