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
    events: {
      absentDates[1]: [
        Event(
          date: absentDates[1],
          title: 'Event 1',
          icon: _absentIcon(
            absentDates[1].day.toString(),
          ),
        ),
      ],
      absentDates[2]: [
        Event(
          date: absentDates[2],
          title: 'Event 1',
          icon: _absentIcon(
            absentDates[2].day.toString(),
          ),
        ),
      ],
      absentDates[3]: [
        Event(
          date: absentDates[3],
          title: 'Event 1',
          icon: _absentIcon(
            absentDates[3].day.toString(),
          ),
        ),
      ],
      absentDates[4]: [
        Event(
          date: absentDates[4],
          title: 'Event 1',
          icon: _absentIcon(
            absentDates[4].day.toString(),
          ),
        ),
      ],
      absentDates[5]: [
        Event(
          date: absentDates[5],
          title: 'Event 1',
          icon: _absentIcon(
            absentDates[5].day.toString(),
          ),
        ),
      ],

      // present

      presentDates[1]: [
        Event(
          date: presentDates[1],
          title: "Event",
          icon: _presentIcon(
            presentDates[1].day.toString(),
          ),
        ),
      ],
      presentDates[2]: [
        Event(
          date: presentDates[2],
          title: "Event",
          icon: _presentIcon(
            presentDates[2].day.toString(),
          ),
        ),
      ],
      presentDates[3]: [
        Event(
          date: presentDates[3],
          title: "Event",
          icon: _presentIcon(
            presentDates[3].day.toString(),
          ),
        ),
      ],
    },
  );

  CalendarCarousel _calendarCarouselNoHeader;

  var len = 4;
  double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        presentDates[4 + i],
        new Event(
          date: presentDates[4 + i],
          title: 'Event 5',
          icon: _presentIcon(
            presentDates[4 + i].day.toString(),
          ),
        ),
      );
    }

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      todayButtonColor: Colors.blue[200],
      todayBorderColor: Colors.red[900],
      selectedDayBorderColor: Colors.grey[600],
      selectedDayButtonColor: Colors.grey[400],
      thisMonthDayBorderColor: Colors.grey,
      markedDatesMap: _markedDateMap,
      height: cHeight * 0.54,
      selectedDateTime: _currentDate2,
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
