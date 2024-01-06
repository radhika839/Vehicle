import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_workshop/pages/add.dart';

var store;

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  List vdetails = [];
  TextEditingController searchcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signIn_screen');
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(
            'Customer Details List',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan.shade700,
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
                          backgroundColor: Colors.cyan.shade700,
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
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: TextFormField(
                              controller: searchcontroller,
                              decoration: InputDecoration(
                                hintText:
                                    'Search by name ,date and vehicle number',
                                suffixIcon: InkWell(
                                  onTap: fetchData,
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.blue,
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.zero)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                          itemCount: vdetails.length,
                          itemBuilder: (context, index) {
                            final item = vdetails[index];
                            final id = item['id'].toString();
                            return GestureDetector(
                              onTap: () {
                                fetchById(id);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.zero)),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 5, 80, 0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            PopupMenuButton(
                                                color: Colors.grey,
                                                onSelected: (value) {
                                                  if (value == 'edit') {
                                                    navigateToEditPage(item);
                                                  } else if (value ==
                                                      'delete') {
                                                    deleteById(id);
                                                  }
                                                },
                                                itemBuilder: (context) {
                                                  return [
                                                    PopupMenuItem(
                                                      child: Text('delete'),
                                                      value: 'delete',
                                                    ),
                                                    PopupMenuItem(
                                                      child: Text('edit'),
                                                      value: 'edit',
                                                    )
                                                  ];
                                                }),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item['name'].toString() +
                                                      ' ' +
                                                      item['last'].toString(),
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blue.shade400),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.email,
                                                ),
                                                Text(item['email'].toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.call),
                                                Text(item['tel'].toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Created Date:' +
                                                      '\n ' +
                                                      item['date'].toString(),
                                                ),
                                                SizedBox(
                                                  width: 190,
                                                ),
                                                Text('Vehicle No:' +
                                                    '\n' +
                                                    item['Vno'].toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('Vehicle Make:' +
                                                    '\n ' +
                                                    item['Vmake'].toString()),
                                                SizedBox(
                                                  width: 190,
                                                ),
                                                Text(
                                                  'Vehicle Inventory:' +
                                                      '\n' +
                                                      item['kms'].toString() +
                                                      'kms/' +
                                                      item['E'].toString(),
                                                )
                                              ],
                                            ),
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                // child: Column(
                //   children: [
                //     Text('Job Cards'),
                //     Padding(
                //       padding: const EdgeInsets.all(13.0),
                //       child: TextFormField(
                //         decoration: InputDecoration(
                //           hintText: 'Search by name ,date and vehicle number',
                //           suffixIcon: Container(
                //             padding: EdgeInsets.all(16),
                //             color: Colors.blue,
                //             child: Icon(
                //               Icons.search,
                //               color: Colors.white,
                //             ),
                //           ),
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.all(Radius.zero)),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                height: height * 0.574,
                width: width * 1.0,
              )
            ],
          ),
        ));
  }

  Future<void> fetchById(String id) async {
    print(id);
    final url = 'http://192.168.1.4:8000/api/srecord/$id';
    final uri = Uri.parse(url);
    print(uri);
    final response = await http.get(
      uri,
      //server parse it string into json by itself
      headers: {'content-type': 'application/json'},
    );
    print(response.statusCode);
    store = response.body;
    print(store);
    //print(response.body);
    if (response.statusCode == 200) {
      // final json = jsonDecode(store);
      // final result = json[vdetails];
      // setState(() {
      //   vdetails = result;
      // });
      Navigator.pushNamed(context, '/viewalldata');
    }
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
      //print(filtered);
      setState(() {
        vdetails = filtered;
      });
    } else {}
  }

  Future<void> fetchData() async {
    final data = searchcontroller.text;
    final url = 'http://192.168.1.4:8000/api/view?search=' + data;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    //print(response.body);
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
