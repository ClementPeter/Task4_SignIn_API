import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignUp extends StatefulWidget {  

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  //form key  
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  //scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  //email controller
  TextEditingController _emailController = TextEditingController();
  
  //password controller
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Sign Up Screen"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
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
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              color: Colors.orange,
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () async {
       
              },
            ),
          ],
        ),
      ),
    );
  }
}
