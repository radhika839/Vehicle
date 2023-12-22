import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:vehicle_workshop/pages/modelclass.dart';

class New_Customer_Registration_Page extends StatefulWidget {
  const New_Customer_Registration_Page({super.key});

  @override
  State<New_Customer_Registration_Page> createState() =>
      _New_Customer_Registration_PageState();
}

class _New_Customer_Registration_PageState
    extends State<New_Customer_Registration_Page> {
  TextEditingController fnameConrtroller = TextEditingController();
  TextEditingController lnnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController vmakeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController kmsController = TextEditingController();
  TextEditingController fuelController = TextEditingController();
  TextEditingController compalaintController = TextEditingController();
  bool jack = false;
  bool stepney = false;
  bool tool_kit = false;
  bool tape = false;
  bool battery = false;
  bool mirror_rh = false;
  bool mirrior_lh = false;
  bool mats = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 80),
            child: Column(
              children: [
                Text(
                  'New Customer Registration Form',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: fnameConrtroller,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text('First Name'),
                      hintText: 'Enter customer First Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: lnnameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text('Last Name'),
                      hintText: 'Enter customer Last Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.mail),
                        label: Text('Email Id'),
                        hintText: 'Enter Customer Email Id',
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.date_range),
                      label: Text('Date'),
                      hintText: 'Enter Date',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: vehicleNoController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.format_list_numbered_sharp),
                      label: Text('Vehicle No'),
                      hintText: 'Enter Vehicle No',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: vmakeController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.date_range_sharp),
                      label: Text('Vehicle Make'),
                      hintText: 'Enter Customer vehicle Model Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      label: Text('Telephone No'),
                      hintText: 'Enter Customer Phone No',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: kmsController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.run_circle_sharp),
                      label: Text('KMS'),
                      hintText: 'Enter How Many Kms Vehicle Run',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: fuelController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.local_gas_station_sharp),
                      label: Text('Fuel'),
                      hintText: 'Enter How Much Litre Of Fuel',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Selected Item',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CheckboxListTile(
                    value: jack,
                    onChanged: (val) {
                      setState(() {
                        jack = val!;
                      });
                    },
                    title: Text('Jack&Tommy'),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CheckboxListTile(
                    value: stepney,
                    onChanged: (val) {
                      setState(() {
                        stepney = val!;
                      });
                    },
                    title: Text('Stepney'),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CheckboxListTile(
                    value: tool_kit,
                    onChanged: (val) {
                      setState(() {
                        tool_kit = val!;
                      });
                    },
                    title: Text('Tool Kit'),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CheckboxListTile(
                    value: tape,
                    onChanged: (val) {
                      tape = val!;
                    },
                    title: Text('Tape'),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CheckboxListTile(
                    value: battery,
                    onChanged: (val) {
                      battery = val!;
                    },
                    title: Text('Battery'),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CheckboxListTile(
                    value: mirror_rh,
                    onChanged: (val) {
                      mirror_rh = val!;
                    },
                    title: Text('Mirror RH'),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CheckboxListTile(
                    value: mirrior_lh,
                    onChanged: (val) {
                      setState(() {
                        mirrior_lh = val!;
                      });
                    },
                    title: Text('Mirror LH'),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CheckboxListTile(
                    value: mats,
                    onChanged: (val) {
                      setState(() {
                        mats = val!;
                      });
                    },
                    title: Text('Mats'),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: compalaintController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.text_snippet_sharp),
                      label: Text('Custmoer Complaints'),
                      hintText: 'Write Customer Complaints',
                      border: InputBorder.none,
                    ),
                    maxLines: 5,
                    minLines: 1,
                  ),
                ),
                // TextField(
                //   onTap: () {
                //     Navigator.pushNamed(context, '/image');
                //   },
                // ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      submitData(
                          fnameConrtroller.text,
                          lnnameController.text,
                          emailController.text,
                          dateController.text,
                          vehicleNoController.text,
                          vmakeController.text,
                          phoneController.text,
                          kmsController.text,
                          fuelController.text,
                          compalaintController.text);
                    },
                    child: Text('Submit')),
              ],
            )),
      ),
    );
  }

  Future<model> submitData(
      String name,
      String last,
      String email,
      String date,
      String vno,
      String vmake,
      String tel,
      String kms,
      String E,
      String regular) async {
    final name = fnameConrtroller.text;
    final last = lnnameController.text;
    final email = emailController.text;
    final date = dateController.text;
    final vno = vehicleNoController.text;
    final vmake = vmakeController.text;
    final tel = phoneController.text;
    final kms = kmsController.text;
    final E = fuelController.text;
    final regular = compalaintController;
    //request body send to the server
    final body = {
      "name": name,
      "last": last,
      "email": email,
      "date": date,
      "Vno": vno,
      "Vmake": vmake,
      "tel": tel,
      "kms": kms,
      "E": E,
      "regular": regular,
    };
    final url = 'http://192.168.1.5:8000/api/insertdata';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      //server parse it string into json by itself
      headers: {'content-type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 500) {
      // titileController.text = '';
      // descriptionController.text = '';
      showSuccessMessage('Creation Success');
      return model.fromJson(jsonDecode(response.body));
    } else {
      showFailedMessage('creation Failed');
      throw Exception('failed to load model');
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
