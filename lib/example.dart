import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class CalendarPage2 extends StatefulWidget {
  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
}

List<DateTime> presentDates = [
  DateTime(2019, 2, 1),
  DateTime(2019, 2, 3),
  DateTime(2019, 2, 4),
  DateTime(2019, 2, 5),
  DateTime(2019, 2, 6),
  DateTime(2019, 2, 9),
  DateTime(2019, 2, 10),
  DateTime(2019, 2, 11),
  DateTime(2019, 2, 15),
  DateTime(2019, 2, 11),
  DateTime(2019, 2, 15),
];
List<DateTime> absentDates = [
  DateTime(2019, 2, 2),
  DateTime(2019, 2, 7),
  DateTime(2019, 2, 8),
  DateTime(2019, 2, 12),
  DateTime(2019, 2, 13),
  DateTime(2019, 2, 14),
  DateTime(2019, 2, 16),
  DateTime(2019, 2, 17),
  DateTime(2019, 2, 18),
  DateTime(2019, 2, 17),
  DateTime(2019, 2, 18),
];

class _CalendarPage2State extends State<CalendarPage2> {
  DateTime _currentDate2 = DateTime.now();
  static Widget _presentIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
  static Widget _absentIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  CalendarCarousel _calendarCarouselNoHeader;

  var len = 9;
  double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        presentDates[i],
        new Event(
          date: presentDates[i],
          title: 'Event 5',
          icon: _presentIcon(
            presentDates[i].day.toString(),
          ),
        ),
      );

      for (int i = 0; i < len; i++) {
        _markedDateMap.add(
          absentDates[i],
          new Event(
            date: absentDates[i],
            title: 'Event 5',
            icon: _absentIcon(
              absentDates[i].day.toString(),
            ),
          ),
        );
      }
    }

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      todayButtonColor: Colors.blue[200],
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
          null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calender"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _calendarCarouselNoHeader,
            markerRepresent(Colors.red, "Absent"),
            markerRepresent(Colors.green, "Present"),
          ],
        ),
      ),
    );
  }

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title: new Text(
        data,
      ),
    );
  }
}
