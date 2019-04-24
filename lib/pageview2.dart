import 'package:flutter/material.dart';
import 'package:pageviewcheck/homepage.dart';

class PageViewCheck2 extends StatefulWidget {
  _PageViewCheck2State createState() => _PageViewCheck2State();
}

class _PageViewCheck2State extends State<PageViewCheck2> {
  final controller = PageController(
    initialPage: 1,
    viewportFraction: 0.9,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: controller,
        // scrollDirection: Axis.vertical,
        children: pageList(),
      ),
    );
  }
}
