// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:vehicle_workshop/pages/add.dart';

// class UpdateData extends StatefulWidget {
//   const UpdateData({super.key});

//   @override
//   State<UpdateData> createState() => _UpdateDataState();
// }

// class _UpdateDataState extends State<UpdateData> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController lastController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   TextEditingController vnoController = TextEditingController();
//   TextEditingController vmakeController = TextEditingController();
//   TextEditingController telController = TextEditingController();
//   TextEditingController kmsController = TextEditingController();
//   TextEditingController EController = TextEditingController();
//   TextEditingController regularController = TextEditingController();
//   List vdetails = [];
//   bool isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//           itemCount: vdetails.length,
//           padding: EdgeInsets.all(12),
//           itemBuilder: (context, index) {
//             final item = vdetails[index];
//             return Card(
//               child: Column(
//                 children: [
//                   Text(item['name']),
//                   Text(item['last']),
//                   Text(item['email']),
//                   Text(item['date']),
//                   Text(item['Vno']),
//                   Text(item['Vmake']),
//                   Text(item['tel']),
//                   Text(item['kms']),
//                   Text(item['E']),
//                   Text(item['regular']),
//                   ElevatedButton(
//                     onPressed: () {
//                       navigateToAddPage(item);
//                     },
//                     child: Text('Update'),
//                   ),
//                 ],
//               ),
//               //   child: ListTile(
//               //     title: Text(item['title']),
//               //     subtitle: Text(item['description']),
//             );
//           }),
//     );
//   }

//   Future<void> navigateToAddPage(Map item) async {
//     final route =
//         MaterialPageRoute(builder: (context) => AddPage(VehicleDetails: item));
//     await Navigator.push(context, route);
//     setState(() {
//       isLoading = true;
//     });
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final url = 'http://192.168.1.5:8000/api/view?search=';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       //give me a data as decode format
//       final json = jsonDecode(response.body) as Map;
//       final result = json['vdetails'] as List;

//       //we will get the data and update the state
//       setState(() {
//         vdetails = result;
//       });
//     }
//   }
// }
