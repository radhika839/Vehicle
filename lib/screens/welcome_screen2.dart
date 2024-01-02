import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

var store;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  List vdetails = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade700,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 480,
            ),
            Text('Vehicle WorkShop'),
            SizedBox(
              width: 480,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.1),
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signIn_screen');
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(400, 50, 350, 100),
              child: ListView.builder(
                  itemCount: vdetails.length,
                  itemBuilder: (context, index) {
                    final item = vdetails[index];
                    final id = item['id'].toString();
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: GestureDetector(
                        onTap: () {
                          fetchById(id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 500, 0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.purple.shade50,
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
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 50, 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      70, 5, 100, 0),
                                              child: Text(
                                                item['name'].toString() +
                                                    ' ' +
                                                    item['last'].toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Email Id:',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 138,
                                            ),
                                            Text(
                                              item['email'].toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Create Date:',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 117,
                                            ),
                                            Text(
                                              item['date'].toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Vehicle No:',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 120,
                                            ),
                                            Text(
                                              item['Vno'].toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Vehicle Make:',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 103,
                                            ),
                                            Text(
                                              item['Vmake'].toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Telephone No:',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 100,
                                            ),
                                            Text(
                                              item['tel'].toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'KMS:',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 158,
                                            ),
                                            Text(
                                              item['kms'].toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Fuel:',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 161,
                                            ),
                                            Text(
                                              item['E'].toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Customer Complaints:',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 48,
                                            ),
                                            Text(
                                              item['regular'].toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchById(String id) async {
    //print(id);
    final url = 'http://192.168.1.4:8000/api/srecord/$id';
    final uri = Uri.parse(url);
    // print(uri);
    final response = await http.get(
      uri,
      //server parse it string into json by itself
      headers: {'content-type': 'application/json'},
    );
    // print(response.statusCode);
    store = response.body;
    //print(store);
    //print(response.body);
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/view');
    }
  }

  Future<void> fetchData() async {
    final url = 'http://192.168.1.4:8000/api/view?search=';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      //give me a data as decode format
      final json = jsonDecode(response.body) as Map;
      final result = json['vdetails'] as List;

      //we will get the data and update the state
      setState(() {
        vdetails = result;
      });
    }
  }
}
