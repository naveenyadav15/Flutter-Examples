import 'package:flutter/material.dart';

const String _name = 'Naveen';
double c_width;

class ChatMessage extends StatelessWidget {
  final String text;

  ChatMessage({this.text});

  @override
  Widget build(BuildContext context) {
    c_width = MediaQuery.of(context).size.width;
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new CircleAvatar(
              child: new Text(
                _name[0],
              ),
            ),
          ),
          new Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(_name, style: Theme.of(context).textTheme.subhead),
                  new Container(
                    width: c_width,
                    margin: EdgeInsets.only(top: 5.0),
                    child: new Text(
                      text,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
