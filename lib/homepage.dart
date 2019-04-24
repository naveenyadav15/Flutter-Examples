import 'package:flutter/material.dart';
import 'package:pageviewcheck/pageview2.dart';
import 'package:pageviewcheck/pageView1.dart';
import 'package:pageviewcheck/pageview3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
      ),
      body: PageViewCheck3(),
    );
  }
}

List<Widget> pageList() {
  return [
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.teal,
    ),
  ];
}
