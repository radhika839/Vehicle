import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
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
      // backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/signIn_screen');
          },
          tooltip: 'Sign In',
        ),
        title: Text('Vehicle WorkShop'),
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.5,
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(130, 70, 200, 100),
              child: Card(
                color: Colors.purple.shade50,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100.0, 50, 0, 50),
                          child: DataTable(
                            showCheckboxColumn: false,
                            border: TableBorder.all(
                                color: Colors.black12, width: 0.3),
                            // columnSpacing: 10,
                            // horizontalMargin: 10,
                            // minWidth: 600,
                            columns: [
                              DataColumn(
                                  label: Text(
                                'User Id',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                              DataColumn(
                                  label: Text(
                                'First Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                              DataColumn(
                                  label: Text(
                                'Last Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                              DataColumn(
                                  label: Text(
                                'Email Id',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                              // DataColumn(
                              //     label: Text(
                              //   'Create Date',
                              //   style:
                              //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              // )),
                              // DataColumn(
                              //     label: Text(
                              //   'Vehicle No',
                              //   style:
                              //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              // )),
                              // DataColumn(
                              //     label: Text(
                              //   'Vehicle Make',
                              //   style:
                              //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              // )),
                              // DataColumn(
                              //     label: Text(
                              //   'Telephone No',
                              //   style:
                              //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              // )),
                              // DataColumn(
                              //     label: Text(
                              //   'KMS',
                              //   style:
                              //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              // )),
                              // DataColumn(
                              //     label: Text(
                              //   'Fuel',
                              //   style:
                              //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              // )),
                              // DataColumn(
                              //     label: Text(
                              //   'Items',
                              //   style:
                              //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              // )),
                              DataColumn(
                                  label: Text(
                                'Customer Complaints',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                              // DataColumn(
                              //     label: Text(
                              //   'image',
                              //   style:
                              //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              // )),
                            ],
                            rows: List.generate(
                              vdetails.length,
                              (index) {
                                final item = vdetails[index];
                                final id = item['id'].toString();
                                //print(item);
                                return DataRow(
                                  onSelectChanged: (bool? select) {
                                    if (select!) {
                                      fetchById(id);
                                    }
                                  },
                                  cells: [
                                    DataCell(
                                      Text('${index + 1}'),
                                    ),
                                    // DataCell(Text(item['id'].toString())),
                                    DataCell(Text(item['name'].toString())),
                                    DataCell(Text(item['last'].toString())),
                                    DataCell(Text(item['email'].toString())),
                                    // DataCell(Text(item['date'].toString())),
                                    // DataCell(Text(item['Vno'].toString())),
                                    // DataCell(Text(item['Vmake'].toString())),
                                    // DataCell(Text(item['tel'].toString())),
                                    // DataCell(Text(item['kms'].toString())),
                                    // DataCell(Text(item['E'].toString())),
                                    // DataCell(Text(item['item'].toString())),
                                    DataCell(Text(item['regular'].toString())),
                                    // DataCell(
                                    //   Image.network(item['front'].toString()),
                                    // ),
                                  ],
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      );
                    }),
              ),
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
