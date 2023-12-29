import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_workshop/pages/addlabour.dart';

class LabourData extends StatefulWidget {
  const LabourData({super.key});

  @override
  State<LabourData> createState() => _LabourDataState();
}

class _LabourDataState extends State<LabourData> {
  List labourDetails = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () {
              Navigator.pushNamed(context, '/BottomNavigationBar');
            },
          ),
          title: Text(
            'labours Details List',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan.shade700,
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.purple.shade50,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(550, 50, 50, 13),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/addlabour');
                      },
                      child: Text(
                        'Add New Labour',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.purple.shade800)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 692,
              color: Colors.purple.shade50,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(180, 70, 230, 90),
                child: Card(
                  color: Colors.purple.shade100,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40.0, 50, 100, 50),
                                  child: DataTable(
                                    showCheckboxColumn: false,
                                    border: TableBorder.all(
                                        color: Colors.black12, width: 0.3),
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                        'Labour Id',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Labour Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Labour Salary',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )),
                                      DataColumn(
                                          label: Text('Edit Action',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      DataColumn(
                                          label: Text('Delete Action',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ],
                                    rows: List.generate(
                                      labourDetails.length,
                                      (index) {
                                        final labourData = labourDetails[index];
                                        final id = labourData['id'].toString();
                                        return DataRow(
                                          cells: [
                                            DataCell(
                                              Text('${index + 1}'),
                                            ),
                                            // DataCell(Text(item['id'].toString())),
                                            DataCell(Text(labourData['l_name']
                                                .toString())),
                                            DataCell(Text(labourData['l_price']
                                                .toString())),
                                            DataCell(TextButton(
                                              onPressed: () {
                                                navigateToEditPage(labourData);
                                              },
                                              child: Text(
                                                'Edit',
                                                style: TextStyle(
                                                    color:
                                                        Colors.green.shade900),
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
                                          ],
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        )));
  }

  Future<void> navigateToEditPage(Map labourData) async {
    final route =
        MaterialPageRoute(builder: (context) => AddLabour(labour: labourData));
    await Navigator.push(context, route);
    // setState(() {
    //   isLoading = true;
    // });
    // fetchData();
  }

  Future<void> deleteById(String id) async {
    final url = 'http://192.168.1.4:8000/api/labourdel/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      final filtered = labourDetails
          .where((element) => element['id'].toString() != id)
          .toList();
      //print(filtered);
      setState(() {
        labourDetails = filtered;
      });
    } else {}
  }

  Future<void> fetchData() async {
    var url = 'http://192.168.1.4:8000/api/viewlabour';
    //print(url);
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // print(response.statusCode);
    //  print(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = json['labourdetails'];
      setState(() {
        labourDetails = result;
      });
    }
  }
}
