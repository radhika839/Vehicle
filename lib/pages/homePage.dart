import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_workshop/pages/add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List vdetails = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    // final ScrollController controller = ScrollController();
    // final ScrollController controller2 = ScrollController();

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Customer Details List',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Container(
          color: Colors.black,
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/carlogo.jpg'),
                    alignment: Alignment.topLeft,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Center(
                        child: SafeArea(
                          child: Text(
                            'WE CAN REPAIR ANYTHING',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/add');
                        },
                        child: Text(
                          'New Customer Registration',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(30),
                          // ),
                        ),
                      ),
                    )
                  ],
                ),
                height: height * 0.3,
                width: width * 1.0,
              ),
              Container(
                color: Colors.purple.shade50,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Scrollbar(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            child: DataTable(
                              border: TableBorder.all(
                                  color: Colors.grey.shade600, width: 0.5),
                              columnSpacing: 0.5,
                              horizontalMargin: 10,
                              columns: [
                                DataColumn(
                                    label: Center(
                                  //widthFactor: 0.5,
                                  child: Text(
                                    'User Id',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                                DataColumn(
                                    label: Center(
                                  child: Text('First Name',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                )),
                                DataColumn(
                                    label: Text('Last Name',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Center(
                                  widthFactor: 1.5,
                                  child: Text('Email Id',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                )),
                                DataColumn(
                                    label: Center(
                                  child: Text(' Create Date',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                )),
                                DataColumn(
                                    label: Text('Vehicle No',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Vehicle Make',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Telephone No',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('KMS',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Fuel',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Center(
                                  // widthFactor: 1.3,
                                  child: Text('Selected Items',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                )),
                                DataColumn(
                                    label: Text('Custmoer Complaints',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Front Image',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Edit Action',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Delete Action',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                              ],
                              rows: List.generate(
                                vdetails.length,
                                (index) {
                                  final item = vdetails[index];
                                  final id = item['id'].toString();
                                  print(item);
                                  return DataRow(cells: [
                                    DataCell(
                                      Text('${index + 1}'),
                                    ),
                                    DataCell(Text(item['name'].toString())),
                                    DataCell(Text(item['last'].toString())),
                                    DataCell(Text(item['email'].toString())),
                                    DataCell(Text(item['date'].toString())),
                                    DataCell(Text(item['Vno'].toString())),
                                    DataCell(Text(item['Vmake'].toString())),
                                    DataCell(Text(item['tel'].toString())),
                                    DataCell(Text(item['kms'].toString())),
                                    DataCell(Text(item['E'].toString())),
                                    DataCell(Text(item['item'].toString())),
                                    DataCell(Text(item['regular'].toString())),
                                    DataCell(Text(item['front'].toString())),
                                    DataCell(TextButton(
                                      onPressed: () {
                                        navigateToEditPage(item);
                                      },
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                            color: Colors.green.shade900),
                                      ),
                                    )),
                                    DataCell(TextButton(
                                      onPressed: () {
                                        deleteById(id);
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                            color: Colors.red.shade900),
                                      ),
                                    )),
                                  ]);
                                },
                              ).toList(growable: false),
                              showBottomBorder: true,
                            ),
                          ),
                        ),
                      );
                    }),
                height: height * 0.574,
                width: width * 1.0,
              )
            ],
          ),
        ));
  }

  Future<void> navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(builder: (context) => AddPage(todo: item));
    await Navigator.push(context, route);
    // setState(() {
    //   isLoading = true;
    // });
    // fetchData();
  }

  Future<void> deleteById(String id) async {
    final url = 'http://192.168.1.4:8000/api/delete/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      final filtered =
          vdetails.where((element) => element['id'].toString() != id).toList();
      print(filtered);
      setState(() {
        vdetails = filtered;
      });
    } else {}
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
