import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_workshop/pages/addProduct.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List productDetails = [];
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
          'Product Details List',
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
                        Navigator.pushNamed(context, '/addProduct');
                      },
                      child: Text(
                        'Add New Product',
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
                                        'Product Id',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Product Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Product Price',
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
                                      productDetails.length,
                                      (index) {
                                        final productData =
                                            productDetails[index];
                                        final id = productData['id'].toString();
                                        //   final id = productData['id'].toString();
                                        return DataRow(
                                          cells: [
                                            DataCell(
                                              Text('${index + 1}'),
                                            ),
                                            // DataCell(Text(item['id'].toString())),
                                            DataCell(Text(productData['Product']
                                                .toString())),
                                            DataCell(Text(productData['Price']
                                                .toString())),
                                            DataCell(TextButton(
                                              onPressed: () {
                                                navigateToEditPage(productData);
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
        ),
      ),
    );
  }

  Future<void> navigateToEditPage(Map productData) async {
    final route = MaterialPageRoute(
        builder: (context) => AddProduct(product: productData));
    await Navigator.push(context, route);
    // setState(() {
    //   isLoading = true;
    // });
    // fetchData();
  }

  Future<void> fetchData() async {
    var url = 'http://192.168.1.4:8000/api/viewproduct';
    //print(url);
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // print(response.statusCode);
    //  print(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = json['productDetails'];
      setState(() {
        productDetails = result;
      });
    }
  }

  Future<void> deleteById(String id) async {
    final url = 'http://192.168.1.4:8000/api/productdelete/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      final filtered = productDetails
          .where((element) => element['id'].toString() != id)
          .toList();
      //print(filtered);
      setState(() {
        productDetails = filtered;
      });
    } else {}
  }
}
