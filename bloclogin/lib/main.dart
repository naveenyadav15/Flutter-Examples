import 'package:bloclogin/loginPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: LoginPage(),
      ),
    );
  }
}
