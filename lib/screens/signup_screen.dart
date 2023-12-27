import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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

  Future<void> signUpscreen(
      String name, String email, String password, String confirm) async {
    print('hey');
    final body = {
      'name': name,
      'email': email,
      'password': password,
      'confirm': confirm
    };
    //print(email);
    //print(password);
    //const url = 'http://192.168.1.10:8000/api/signUp';
    const url = 'http://192.168.1.4:8000/api/signUp';
    //print(url);
    final uri = Uri.parse(url);
    //print(uri);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    // final message = jsonDecode(response.body);
    // print(message);

    if (response.body == "Successfully Registerd") {
      showSuccessMessage('Sign Up Has been Created Successfully');
      Navigator.pushNamed(context, '/signIn_screen');
    } else {
      print('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Sign Up',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/carimage.jpg', height: 250),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 450),
                  child: Card(
                    color: Colors.purple.shade50,
                    child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Name',
                          label: Text('Name'),
                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please Enter Your Name';
                          }
                          return null;
                        }),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 450),
                  child: Card(
                    color: Colors.purple.shade50,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        label: Text('Email'),
                        icon: Icon(Icons.email),
                        border: InputBorder.none,
                      ),
                      validator: validateEmail,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 450),
                  child: Card(
                    color: Colors.purple.shade50,
                    child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 450),
                  child: Card(
                    color: Colors.purple.shade50,
                    child: TextFormField(
                        obscureText: true,
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: 'Confirm Your Password',
                          label: Text('Confirm Password'),
                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.length < 3) {
                            return 'Password Is Too Short';
                          }
                          if (value != passwordController.text) {
                            return 'Enter Correct Password';
                          }
                          return null;
                        }),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 370,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      signUpscreen(
                          nameController.text.toString(),
                          emailController.text.toString(),
                          passwordController.text.toString(),
                          confirmPasswordController.text.toString());
                    }
                  },
                  child: Text(
                    'SIGN UP',
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
                  Text("Already Have An Account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signIn_screen');
                      },
                      child: Text(
                        'Sign In',
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
