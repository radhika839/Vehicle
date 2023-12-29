import 'package:flutter/material.dart';
import 'package:vehicle_workshop/pages/BottomNavigationBar.dart';
import 'package:vehicle_workshop/pages/add.dart';
import 'package:vehicle_workshop/pages/addProduct.dart';
import 'package:vehicle_workshop/pages/addlabour.dart';
import 'package:vehicle_workshop/pages/image.dart';
import 'package:vehicle_workshop/pages/homePage.dart';
import 'package:vehicle_workshop/pages/labour.dart';
import 'package:vehicle_workshop/pages/product.dart';
import 'package:vehicle_workshop/pages/view.dart';
import 'package:vehicle_workshop/screens/signIn_screen.dart';
import 'package:vehicle_workshop/screens/signup_screen.dart';
import 'package:vehicle_workshop/screens/welcome_screen.dart';
import 'package:vehicle_workshop/screens/welcome_screen2.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      //'/welcome_screen2': (context) => MainScreen(),
      '/signIn_screen': (context) => SignInPage(),
      '/signup_screen': (context) => SignUpPage(),
      '/BottomNavigationBar': (context) => MyBottomNavigationBar(),
      '/labour': (context) => LabourData(),
      '/searchPage': (context) => ProductPage(),
      '/homePage': (context) => HomePage(),
      //'/edit': (context) => UpdateData(),
      '/product': (context) => ProductPage(),
      '/image': (context) => imagePickerPage(),
      '/add': (context) => AddPage(),
      '/addProduct': (context) => AddProduct(),
      '/addlabour': (context) => AddLabour(),
      '/view': (context) => ShowData(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
// void main() {
//   runApp(const MyApp());  
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: WelcomeScreen(),
//     );
//   }
// }
