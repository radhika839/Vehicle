import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        'Hey Welcome To Radhikas Project!!!!!!',
        style: TextStyle(color: Colors.black),
      )),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey.shade200,
        width: 370,
        child: ListView(
          children: [
            Container(
              color: Colors.grey.shade300,
              height: 200,
              child: DrawerHeader(
                  margin: EdgeInsets.fromLTRB(0, 30, 10, 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/carlogo.jpg'),
                      alignment: Alignment.topRight,
                    ),
                  ),
                  child: ListView(children: [
                    ListTile(
                      leading: Icon(Icons.car_repair),
                      title: Text(
                        'We Can\nRepair AnyThing',
                        //   textAlign: TextAlign.end
                      ),
                    )
                  ])),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pushNamed(context, '/homePage');
              },
            ),
            ListTile(
              title: Text('Search'),
              leading: Icon(Icons.search),
              onTap: () {},
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
