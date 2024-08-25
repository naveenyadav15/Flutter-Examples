
import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:  ThemeData(
      primaryColor: const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67),
    ),
    home: const SafeArea(
      child: CalendarPage(),
    ),
  ));
}
