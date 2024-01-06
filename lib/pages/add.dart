import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  final Map? todo;
  const AddPage({super.key, this.todo});

  @override
  State<AddPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<AddPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController vnoController = TextEditingController();
  TextEditingController vmakeController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController kmsController = TextEditingController();
  TextEditingController EController = TextEditingController();
  TextEditingController regularController = TextEditingController();
  bool isEdit = false;

  bool jack = false;
  bool stepney = false;
  bool tool_kit = false;
  bool tape = false;
  bool battery = false;
  bool mirror_rh = false;
  bool mirrior_lh = false;
  bool mats = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final name = todo['name'].toString();
      final lastName = todo['last'].toString();
      final emailId = todo['email'].toString();
      final date = todo['date'].toString();
      final vehicleNo = todo['Vno'].toString();
      final vehicleModel = todo['Vmake'].toString();
      final phoneNo = todo['tel'].toString();
      final kms = todo['kms'].toString();
      final fuel = todo['E'].toString();
      final itemString = todo['item'].toString();
      final complaints = todo['regular'].toString();
      // print(itemString);
      if (itemString != null) {
        List items = itemString.split(',');
        // print(items);
        if (items.contains('Jack & Tommy')) {
          jack = true;
        }
        if (items.contains('Stepney')) {
          stepney = true;
        }
        if (items.contains('Tool Kit')) {
          tool_kit = true;
        }
        if (items.contains('Tape')) {
          tape = true;
        }
        if (items.contains('Battery')) {
          battery = true;
        }
        if (items.contains('Mirror RH')) {
          mirror_rh = true;
        }
        if (items.contains('Mirror LH')) {
          mirrior_lh = true;
        }
        if (items.contains('Mats')) {
          mats = true;
        }
      }
      nameController.text = name;
      lastController.text = lastName;
      emailController.text = emailId;
      dateController.text = date;
      vnoController.text = vehicleNo;
      vmakeController.text = vehicleModel;
      telController.text = phoneNo;
      kmsController.text = kms;
      EController.text = fuel;
      regularController.text = complaints;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade700,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // height: 1500,
          color: Colors.white,
          // height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                isEdit
                    ? 'Updating Customer Registration Form'
                    : 'New Customer Registration Form',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                //  color: Colors.deepPurple.shade100,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter Customer First Name',
                      label: Text('First Name'),
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // color: Colors.deepPurple.shade100,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: TextFormField(
                    controller: lastController,
                    decoration: InputDecoration(
                      hintText: 'Enter Customer Last Name',
                      label: Text('Last Name'),
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                //color: Colors.deepPurple.shade100,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Customer Email Id',
                      label: Text('Email Id'),
                      icon: Icon(Icons.mail),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                //color: Colors.deepPurple.shade100,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: 'Enter Date',
                      label: Text('Date'),
                      icon: Icon(Icons.date_range),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // color: Colors.deepPurple.shade100,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: TextFormField(
                    controller: vnoController,
                    decoration: InputDecoration(
                      hintText: 'Enter Vehicle No',
                      label: Text('Vehicle No'),
                      icon: Icon(Icons.format_list_numbered_sharp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // color: Colors.deepPurple.shade100,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: TextFormField(
                    controller: vmakeController,
                    decoration: InputDecoration(
                      hintText: 'Enter Customer vehicle Model Name',
                      label: Text('Vehicle Make'),
                      icon: Icon(Icons.date_range_sharp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // color: Colors.deepPurple.shade100,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: TextFormField(
                    controller: telController,
                    decoration: InputDecoration(
                      hintText: 'Enter Customer Phone No',
                      label: Text('telephone no'),
                      icon: Icon(Icons.phone),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // color: Colors.deepPurple.shade100,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: TextFormField(
                    controller: kmsController,
                    decoration: InputDecoration(
                      hintText: 'Enter How Many Kms Vehicle Run',
                      label: Text('kms'),
                      icon: Icon(Icons.run_circle_sharp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                //color: Colors.deepPurple.shade100,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: TextFormField(
                    controller: EController,
                    decoration: InputDecoration(
                      hintText: 'Enter How Much Litre Of Fuel',
                      label: Text('Fuel'),
                      icon: Icon(Icons.local_gas_station_sharp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Select Item',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w200),
              ),
              SizedBox(height: 5),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.symmetric(horizontal: 380),
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
                    child: CheckboxListTile(
                      value: jack,
                      onChanged: (val) {
                        setState(() {
                          jack = val!;
                        });
                      },
                      title: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.green.shade100,
                              Colors.cyan,
                            ],
                          )),
                          child: Text('Jack & Tommy')),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.symmetric(horizontal: 380),
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
                    child: CheckboxListTile(
                      value: stepney,
                      onChanged: (val) {
                        setState(() {
                          stepney = val!;
                        });
                      },
                      title: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.green.shade100,
                              Colors.cyan,
                            ],
                          )),
                          child: Text('Stepney')),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.symmetric(horizontal: 380),
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
                    child: CheckboxListTile(
                      value: tool_kit,
                      onChanged: (val) {
                        setState(() {
                          tool_kit = val!;
                        });
                      },
                      title: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.green.shade100,
                              Colors.cyan,
                            ],
                          )),
                          child: Text('Tool Kit')),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.symmetric(horizontal: 380),
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
                    child: CheckboxListTile(
                      value: tape,
                      onChanged: (val) {
                        tape = val!;
                      },
                      title: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.green.shade100,
                              Colors.cyan,
                            ],
                          )),
                          child: Text('Tape')),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.symmetric(horizontal: 380),
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
                    child: CheckboxListTile(
                      value: battery,
                      onChanged: (val) {
                        battery = val!;
                      },
                      title: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.green.shade100,
                              Colors.cyan,
                            ],
                          )),
                          child: Text('Battery')),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: CheckboxListTile(
                    value: mirror_rh,
                    onChanged: (val) {
                      mirror_rh = val!;
                    },
                    title: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.green.shade100,
                            Colors.cyan,
                          ],
                        )),
                        child: Text('Mirror RH')),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.symmetric(horizontal: 380),
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
                    child: CheckboxListTile(
                      value: mirrior_lh,
                      onChanged: (val) {
                        setState(() {
                          mirrior_lh = val!;
                        });
                      },
                      title: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.green.shade100,
                              Colors.cyan,
                            ],
                          )),
                          child: Text('Mirror LH')),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.symmetric(horizontal: 380),
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
                    child: CheckboxListTile(
                      value: mats,
                      onChanged: (val) {
                        setState(() {
                          mats = val!;
                        });
                      },
                      title: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.green.shade100,
                              Colors.cyan,
                            ],
                          )),
                          child: Text('Mats')),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                //color: Colors.deepPurple.shade100,
                margin: EdgeInsets.symmetric(horizontal: 380),
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
                  child: TextFormField(
                    controller: regularController,
                    decoration: InputDecoration(
                      hintText: 'Write Customer Complaints',
                      label: Text('Enter Customer Complaints'),
                      icon: Icon(Icons.text_snippet_sharp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 380,
                child: ElevatedButton(
                  onPressed: () {
                    isEdit
                        ? updateData(
                            nameController.text.toString(),
                            lastController.text.toString(),
                            emailController.text.toString(),
                            dateController.text.toString(),
                            vnoController.text.toString(),
                            vmakeController.text.toString(),
                            telController.text.toString(),
                            kmsController.text.toString(),
                            EController.text.toString(),
                            jack,
                            stepney,
                            tool_kit,
                            tape,
                            battery,
                            mirror_rh,
                            mirrior_lh,
                            mats,
                            regularController.text.toString())
                        : AddData(
                            nameController.text.toString(),
                            lastController.text.toString(),
                            emailController.text.toString(),
                            dateController.text.toString(),
                            vnoController.text.toString(),
                            vmakeController.text.toString(),
                            telController.text.toString(),
                            kmsController.text.toString(),
                            EController.text.toString(),
                            jack,
                            stepney,
                            tool_kit,
                            tape,
                            battery,
                            mirror_rh,
                            mirrior_lh,
                            mats,
                            regularController.text.toString());
                  },
                  child: Text(
                    isEdit ? 'Update' : 'Submit',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateData(
      String name,
      String lastName,
      String emailId,
      String date,
      String vehicleNo,
      String vehicleModel,
      String phoneNo,
      String kms,
      String fuel,
      bool jack,
      bool stepney,
      bool tool_kit,
      bool tape,
      bool battery,
      bool mirror_rh,
      bool mirrior_lh,
      bool mats,
      String complaints) async {
    List itemList = [];
    //print(itemList);
    if (jack == true) {
      itemList.add('Jack & Tommy');
    }
    if (stepney == true) {
      itemList.add('Stepney');
    }
    if (tool_kit == true) {
      itemList.add('Tool Kit');
    }
    if (tape == true) {
      itemList.add('Tape');
    }
    if (mirrior_lh == true) {
      itemList.add('Battery');
    }
    if (battery == true) {
      itemList.add('Mirror RH');
    }
    if (mirror_rh == true) {
      itemList.add('Mirror LH');
    }

    if (mats == true) {
      itemList.add('Mats');
    }
    // print(itemList);
    final todo = widget.todo;
    if (todo == null) {
      print('you can not call updated without the data');
      return;
    }

    final id = todo['id'].toString();
    final body = {
      "name": name,
      "last": lastName,
      "email": emailId,
      "date": date,
      "Vno": vehicleNo,
      "Vmake": vehicleModel,
      "tel": phoneNo,
      "kms": kms,
      "E": fuel,
      "item": itemList,
      "regular": complaints
    };
    // print(itemList);
    // print(body);
    final url = 'http://192.168.1.4:8000/api/update/$id';
    final uri = Uri.parse(url);
    // print(uri);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      //server parse it string into json by itself
      headers: {'content-type': 'application/json'},
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      showSuccessMessage('Updation Has Been Created Successfully');
      setState(() {
        Navigator.pushNamed(context, '/BottomNavigationBar');
      });
    } else {
      showFailedMessage('Updation failed');
    }
  }

  Future<void> AddData(
      String name,
      String lastName,
      String emailId,
      String date,
      String vehicleNo,
      String vehicleModel,
      String phoneNo,
      String kms,
      String fuel,
      bool jack,
      bool stepney,
      bool tool_kit,
      bool tape,
      bool battery,
      bool mirror_rh,
      bool mirrior_lh,
      bool mats,
      String complaints) async {
    List itemList = [];

    if (jack == true) {
      itemList.add('Jack & Tommy');
    }
    if (stepney == true) {
      itemList.add('Stepney');
    }
    if (tool_kit == true) {
      itemList.add('Tool Kit');
    }
    if (tape == true) {
      itemList.add('Tape');
    }
    if (mirrior_lh == true) {
      itemList.add('Battery');
    }
    if (battery == true) {
      itemList.add('Mirror RH');
    }
    if (mirror_rh == true) {
      itemList.add('Mirror LH');
    }

    if (mats == true) {
      itemList.add('Mats');
    }
    final body = {
      "name": name,
      "last": lastName,
      "email": emailId,
      "date": date,
      "Vno": vehicleNo,
      "Vmake": vehicleModel,
      "tel": phoneNo,
      "kms": kms,
      "E": fuel,
      "item": itemList,
      "regular": complaints
    };
    //print(body);
    //print(email);
    //print(tel);
    //print(itemList);
    const url = 'http://192.168.1.4:8000/api/insertdata';
    //const url = 'http://192.168.1.4:8000/api/signin';
    //print(jsonEncode(body));
    final uri = Uri.parse(url);
    // print(uri);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    //  print(response.statusCode);
    // print(response.body);
    final message = jsonDecode(response.body);
    //print(message);

    if (message['Registered'] == "Successfully") {
      showSuccessMessage('Registration Created Successfully');
      Navigator.pushNamed(context, '/homePage');
    } else {
      print('failed');
    }
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showFailedMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
