import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  final Map? product;
  const AddProduct({super.key, this.product});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final product = widget.product;
    if (product != null) {
      isEdit = true;
      final Product = product['Product'].toString();
      final Price = product['Price'].toString();
      productController.text = Product;
      priceController.text = Price;
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
            isEdit ? 'Update Product' : 'Add New Product',
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
                image: DecorationImage(
                    image: AssetImage('assets/images/productimage.jpg')),
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
                      controller: productController,
                      decoration: InputDecoration(
                          hintText: 'Enter Product Name',
                          label: Text('Product Name'),
                          icon: Icon(Icons.shopping_cart),
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
                      controller: priceController,
                      decoration: InputDecoration(
                          hintText: 'Enter Product Price',
                          label: Text('Product Price'),
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
                              ? updateData(productController.text.toString(),
                                  priceController.text.toString())
                              : addProduct(productController.text.toString(),
                                  priceController.text.toString());
                        },
                        child: Text(
                          isEdit ? 'Update Product' : 'Add Product',
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

  Future<void> addProduct(String Product, String Price) async {
    final body = {'Product': Product, 'Price': Price};

    const url = 'http://192.168.1.4:8000/api/addproduct';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.statusCode);
    print(response.body);
    if (response.body == 'Product Added !!') {
      showSuccessMessage('Product Added Successfully');
      setState(() {
        Navigator.pushNamed(context, '/product');
      });
    }
  }

  Future<void> updateData(String Product, String Price) async {
    final product = widget.product;
    if (product == null) {
      print('you can not call updated without the data');
      return;
    }
    final id = product['id'].toString();
    final body = {'Product': Product, 'Price': Price};
    final url = 'http://192.168.1.4:8000/api/productupdate/$id';
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
      Navigator.pushNamed(context, '/product');
    }
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
