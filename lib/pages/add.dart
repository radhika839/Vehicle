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
      final last = todo['last'].toString();
      final email = todo['email'].toString();
      final date = todo['date'].toString();
      final Vno = todo['Vno'].toString();
      final Vmake = todo['Vmake'].toString();
      final tel = todo['tel'].toString();
      final kms = todo['kms'].toString();
      final E = todo['E'].toString();
      final regular = todo['regular'].toString();

      nameController.text = name;
      lastController.text = last;
      emailController.text = email;
      dateController.text = date;
      vnoController.text = Vno;
      vmakeController.text = Vmake;
      telController.text = tel;
      kmsController.text = kms;
      EController.text = E;
      regularController.text = regular;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      appBar: AppBar(
        // title: Text(
        //   'Customer Registration Form',
        //   style: TextStyle(fontSize: 25),
        // ),
        // centerTitle: true,
        // leading: IconButton(
        //     tooltip: 'Back',
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/homePage');
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios_new,
        //       size: 30,
        //     )),
        backgroundColor: Colors.grey,
        // backgroundColor: Colors.blue.shade700,
      ),
      body: Container(
        // height: 1500,
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.4,
              image: AssetImage("assets/images/bg1.jpg"),
              fit: BoxFit.cover),
        ),
        // height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/images/carimage.jpg',
            //   height: 250,
            //   fit: BoxFit.cover,
            // ),
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
              //  color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 380),
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
            SizedBox(height: 10),
            Card(
              // color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 380),
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
            SizedBox(height: 10),
            Card(
              //color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 380),
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
            SizedBox(height: 10),
            Card(
              //color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 380),
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
            SizedBox(height: 10),
            Card(
              // color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 380),
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
            SizedBox(height: 10),
            Card(
              // color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 380),
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
            SizedBox(height: 10),
            Card(
              // color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 380),
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
            SizedBox(height: 10),
            Card(
              // color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 380),
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
            SizedBox(height: 10),
            Card(
              //color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 380),
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
            // SizedBox(height: 10),
            // Text(
            //   'Select Item',
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 20,
            //       fontWeight: FontWeight.w200),
            // ),
            // SizedBox(height: 5),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 380),
            //   child: CheckboxListTile(
            //     value: jack,
            //     onChanged: (val) {
            //       setState(() {
            //         jack = val!;
            //       });
            //     },
            //     title: Text('Jack&Tommy'),
            //     visualDensity: VisualDensity.compact,
            //   ),
            // ),
            // SizedBox(height: 5),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 380),
            //   child: CheckboxListTile(
            //     value: stepney,
            //     onChanged: (val) {
            //       setState(() {
            //         stepney = val!;
            //       });
            //     },
            //     title: Text('Stepney'),
            //     visualDensity: VisualDensity.compact,
            //   ),
            // ),
            // SizedBox(height: 5),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 380),
            //   child: CheckboxListTile(
            //     value: tool_kit,
            //     onChanged: (val) {
            //       setState(() {
            //         tool_kit = val!;
            //       });
            //     },
            //     title: Text('Tool Kit'),
            //     visualDensity: VisualDensity.compact,
            //   ),
            // ),
            // SizedBox(height: 5),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 380),
            //   child: CheckboxListTile(
            //     value: tape,
            //     onChanged: (val) {
            //       tape = val!;
            //     },
            //     title: Text('Tape'),
            //     visualDensity: VisualDensity.compact,
            //   ),
            // ),
            // SizedBox(height: 5),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 380),
            //   child: CheckboxListTile(
            //     value: battery,
            //     onChanged: (val) {
            //       battery = val!;
            //     },
            //     title: Text('Battery'),
            //     visualDensity: VisualDensity.compact,
            //   ),
            // ),
            // SizedBox(height: 5),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 380),
            //   child: CheckboxListTile(
            //     value: mirror_rh,
            //     onChanged: (val) {
            //       mirror_rh = val!;
            //     },
            //     title: Text('Mirror RH'),
            //     visualDensity: VisualDensity.compact,
            //   ),
            // ),
            // SizedBox(height: 5),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 380),
            //   child: CheckboxListTile(
            //     value: mirrior_lh,
            //     onChanged: (val) {
            //       setState(() {
            //         mirrior_lh = val!;
            //       });
            //     },
            //     title: Text('Mirror LH'),
            //     visualDensity: VisualDensity.compact,
            //   ),
            // ),
            // SizedBox(height: 5),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 380),
            //   child: CheckboxListTile(
            //     value: mats,
            //     onChanged: (val) {
            //       setState(() {
            //         mats = val!;
            //       });
            //     },
            //     title: Text('Mats'),
            //     visualDensity: VisualDensity.compact,
            //   ),
            // ),
            SizedBox(height: 10),
            Card(
              //color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 380),
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
                          //  jack.toString(),
                          regularController.text.toString());
                },
                child: Text(
                  isEdit ? 'Update' : 'Submit',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateData(
      String name,
      String last,
      String email,
      String date,
      String Vno,
      String Vmake,
      String tel,
      String kms,
      String E,
      String regular) async {
    final todo = widget.todo;
    if (todo == null) {
      print('you can not call updated without the data');
      return;
    }
    final id = todo['id'].toString();
    final body = {
      "name": name,
      "last": last,
      "email": email,
      "date": date,
      "Vno": Vno,
      "Vmake": Vmake,
      "tel": tel,
      "kms": kms,
      "E": E,
      "regular": regular
    };
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
        Navigator.pushNamed(context, '/homePage');
      });
    } else {
      showFailedMessage('Updation failed');
    }
  }

  Future<void> AddData(
      String name,
      String last,
      String email,
      String date,
      String Vno,
      String Vmake,
      String tel,
      String kms,
      String E,
      //  String item,
      String regular) async {
    //print('hey');
    final body = {
      "name": name,
      "last": last,
      "email": email,
      "date": date,
      "Vno": Vno,
      "Vmake": Vmake,
      "tel": tel,
      "kms": kms,
      "E": E,
      //"item": item,
      "regular": regular
    };
    //print(body);
    //print(email);
    //print(tel);
    // print(last);
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
