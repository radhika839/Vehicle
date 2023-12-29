import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please Enter An Email';
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'please Enter A Valid Email';
    }
    return null;
  }

  Future<void> loginscreen(String email, String password) async {
    final body = {'email': email, 'password': password};
    //print(email);
    //print(password);
    // const url = 'http://192.168.1.10:8000/api/signIn';
    const url = 'http://192.168.1.4:8000/api/signIn';
    //print(url);
    print(jsonEncode(body));
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    //  print(response.body);
    final message = jsonDecode(response.body);
    // print(message['Login']);

    if (message['Login'] == "successfully") {
      // print('login successfully');
      showSuccessMessage('Login Successfully');
      Navigator.pushNamed(context, '/BottomNavigationBar');
    } else {
      print('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade700,
        title: Text(
          'Sign In',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 200),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/image.png',
                height: 200,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 280),
                  child: Card(
                    color: Colors.purple.shade50,
                    child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Email',
                          label: Text('Email'),
                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                        ),
                        validator: validateEmail),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 280),
                  child: Card(
                    color: Colors.purple.shade50,
                    child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          label: Text('Password'),
                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.length < 3) {
                            return 'Password Is Too Short';
                          }
                          return null;
                        }),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 310,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      loginscreen(emailController.text.toString(),
                          passwordController.text.toString());
                    }
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have An Account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup_screen');
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
