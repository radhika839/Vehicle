import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vehicle_workshop/screens/welcome_screen2.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  var details = jsonDecode(store);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Details',
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(400, 70, 350, 100),
        child: Card(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          // color: Colors.purple.shade50,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.green.shade100,
                Colors.cyan,
              ],
            )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FractionalTranslation(
                        translation: Offset(0, -0.57),
                        child: CircleAvatar(
                          backgroundColor: Colors.purple.shade100,
                          radius: 40,
                          backgroundImage: AssetImage(
                            'assets/images/avatar3.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.purple.shade100,
                    thickness: 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        details['vdetails']['name'].toString() +
                            ' ' +
                            details['vdetails']['last'].toString(),
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Email Id',
                      ),
                      SizedBox(
                        width: 128,
                      ),
                      Text(
                        details['vdetails']['email'].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.purple.shade100,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        details['vdetails']['date'].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.purple.shade100,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Vehicle No',
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Text(
                        details['vdetails']['Vno'].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.purple.shade100,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Vehicle Model',
                      ),
                      SizedBox(
                        width: 88,
                      ),
                      Text(
                        details['vdetails']['Vmake'].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.purple.shade100,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Phone No',
                      ),
                      SizedBox(
                        width: 115,
                      ),
                      Text(
                        details['vdetails']['tel'].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.purple.shade100,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'KMS',
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        details['vdetails']['kms'].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.purple.shade100,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Fuel',
                      ),
                      SizedBox(
                        width: 153,
                      ),
                      Text(
                        details['vdetails']['E'].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.purple.shade100,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Items',
                      ),
                      SizedBox(
                        width: 84,
                      ),
                      Text(
                        details['vdetails']['item'].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.purple.shade100,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Customer Complaint',
                      ),
                      SizedBox(
                        width: 48,
                      ),
                      Text(
                        details['vdetails']['regular'].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
