import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagePickerPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<imagePickerPage> {
  NetworkImage? networkImage;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebFun"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              // height: 140,
              // width: 180,
              color: Colors.black12,
              child: networkImage == null
                  ? Icon(
                      Icons.image,
                      size: 50,
                    )
                  : Image.asset(
                      networkImage!.toString(),
                      fit: BoxFit.fill,
                      scale: 1.0,
                    ),
            ),
            MaterialButton(
              onPressed: () {
                getgall();
              },
              color: Colors.blue[900],
              child: Text(
                "take from gallery",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                getcam();
              },
              color: Colors.blue[900],
              child: Text(
                "take from camera",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getcam() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      networkImage = NetworkImage(img!.path);
    });
  }

  getgall() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      networkImage = NetworkImage(img!.path);
    });
  }
}
