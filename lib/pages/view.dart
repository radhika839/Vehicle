import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:vehicle_workshop/screens/welcome_screen2.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  //List vdetails = [];
  var details = jsonDecode(store);
  //var det=details['vdetails'].toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          'Customer Details',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.1,
              image: AssetImage("assets/images/bg1.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'First Name:',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      details['vdetails']['name'].toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  //  Text(
  //                     details['vdetails']['regular'].toString(),
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 15.0,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   )