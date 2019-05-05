import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  final Widget child;

  PageTwo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Page two"),
        ),
      ),
    );
  }
}
