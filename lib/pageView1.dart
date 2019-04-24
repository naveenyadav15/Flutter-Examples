import 'package:flutter/material.dart';
import 'package:pageviewcheck/homepage.dart';

class PageViewCheck1 extends StatefulWidget {
  _PageViewCheck1State createState() => _PageViewCheck1State();
}

class _PageViewCheck1State extends State<PageViewCheck1> {
  final controller = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: pageList(),
      ),
    );
  }
}


