import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home_screen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //To trigger loading spinner
  bool isLoading = false;
  //form key
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //email controller
  TextEditingController _emailController = TextEditingController();
  //password controller
  TextEditingController _passwordController = TextEditingController();

  //Clear the email and password fields

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Sign Up Screen"),
      ),
      body: Form(
        key: _formKey,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 24.0,
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 24.0,
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                      ),
                    ),
                  ),
                  RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    color: Colors.orange,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          final snackBar = SnackBar(
                              content: Text('Enter the following Field'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }

                      register(_emailController.text, _passwordController.text);
                    },
                  ),
                ],
              ),
      ),
    );
  }

  //Method to do http post request for sign up
  register(String email, password) async {
    //Variable to hold  decoded data
    var jsonResponse;

    //maps  email and password to data
    Map data = {
      'email': email,
      'password': password,
    };

    //Replace API with a working API

    var response = await http.post(Uri.parse("https://reqres.in/api/register"),
        body: data);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print("$jsonResponse is jsonResponse");
      //print("$response,response");
      //print("${response.body},$response");
      if (jsonResponse != null) {
        setState(() {
          isLoading = false;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
          );
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      var errorMsg = response.body;
      print("The error message is $errorMsg");
    }
  }
}