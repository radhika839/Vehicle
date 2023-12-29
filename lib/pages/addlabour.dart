import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddLabour extends StatefulWidget {
  final Map? labour;
  const AddLabour({super.key, this.labour});

  @override
  State<AddLabour> createState() => _AddLabourState();
}

class _AddLabourState extends State<AddLabour> {
  TextEditingController labourNameController = TextEditingController();
  TextEditingController labourSalaryController = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final labour = widget.labour;
    if (labour != null) {
      isEdit = true;
      final labourName = labour['l_name'].toString();
      final labourSalary = labour['l_price'].toString();
      labourNameController.text = labourName;
      labourSalaryController.text = labourSalary;
    }
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
            isEdit ? 'Update Labour Data' : 'Add New Labour',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan.shade700,
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              height: 400,
              width: 580,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/images/man.png')),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 410,
              child: Column(
                children: [
                  Card(
                    color: Colors.purple.shade50,
                    margin: EdgeInsets.symmetric(horizontal: 350),
                    child: TextFormField(
                      controller: labourNameController,
                      decoration: InputDecoration(
                          hintText: 'Enter Labour Name',
                          label: Text('Labour Name'),
                          icon: Icon(Icons.person),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.purple.shade50,
                    margin: EdgeInsets.symmetric(horizontal: 350),
                    child: TextFormField(
                      controller: labourSalaryController,
                      decoration: InputDecoration(
                          hintText: 'Enter Labour Salary',
                          label: Text('Labour Salary'),
                          icon: Icon(Icons.attach_money),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 350,
                    child: ElevatedButton(
                        onPressed: () {
                          isEdit
                              ? updateData(labourNameController.text.toString(),
                                  labourSalaryController.text.toString())
                              : addLabour(labourNameController.text.toString(),
                                  labourSalaryController.text.toString());
                        },
                        child: Text(
                          isEdit ? 'Update' : 'Add',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        )));
  }

  Future<void> updateData(String l_name, String l_price) async {
    final labour = widget.labour;
    if (labour == null) {
      print('you can not call updated without the data');
      return;
    }
    final id = labour['id'].toString();
    final body = {'l_name': l_name, 'l_price': l_price};
    final url = 'http://192.168.1.4:8000/api/labourupdate/$id';
    final uri = Uri.parse(url);
    print(uri);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'content-type': 'application/json'},
    );
    print(response.body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/labour');
    }
  }

  Future<void> addLabour(String l_name, String l_price) async {
    final body = {'l_name': l_name, 'l_price': l_price};

    const url = 'http://192.168.1.4:8000/api/addlabour';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.statusCode);
    print(response.body);
    if (response.body == 'SuccessFully Added') {
      showSuccessMessage('Labour Added Successfully');
      setState(() {
        Navigator.pushNamed(context, '/labour');
      });
    }
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
