import 'package:flutter/material.dart';

class PageViewCheck3 extends StatefulWidget {
  _PageViewCheck3State createState() => _PageViewCheck3State();
}

class _PageViewCheck3State extends State<PageViewCheck3> {
  final controller = PageController(
    // initialPage: 1,
    viewportFraction: 0.8,
  );
  int currentPage = 0;
  String activeTag = "day";
  @override
  void initState() {
    super.initState();
    print("next $currentPage");
    controller.addListener(() {
      int next = controller.page.round();
      print("next $next");
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        controller: controller,
        itemCount: 11,
        itemBuilder: (context, int currentIndex) {
          if (currentIndex == 0) {
            return _buildTagPage();
          } else {
            bool active = currentIndex == currentPage;
            return _buildStoryPage(colorList(currentIndex - 1), active);
          }
        },
      ),
    );
  }

  colorList(index) {
    List<Color> color = [
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.red,
      Colors.teal,
    ];
    return color[index];
  }
}

_buildTagPage() {
  return Container(
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Stories",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Filter",
            style: TextStyle(
              color: Colors.black26,
            ),
          ),
          _buildButton("Happy Day "),
          _buildButton("Sad Day "),
          _buildButton("Normal Day "),
        ]),
  );
}

_buildButton(tag) {
  return FlatButton(
    onPressed: () {},
    child: Text(
      tag,
      style: TextStyle(
        color: Colors.black45,
      ),
    ),
  );
}

_buildStoryPage(Color color, bool active) {
  final double blur = active ? 30 : 0;
  final double offset = active ? 15 : 0;
  final double top = active ? 50 : 80;
  final double bottom = active ? 50 : 80;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeOutQuint,
    margin: EdgeInsets.only(
      top: top,
      bottom: bottom,
      right: 30,
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(
        20,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black87,
          blurRadius: blur,
          offset: Offset(offset, offset),
        ),
      ],
    ),
    child: Center(
      child: Text(
        "Happy Day",
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
        ),
      ),
    ),
  );
}
