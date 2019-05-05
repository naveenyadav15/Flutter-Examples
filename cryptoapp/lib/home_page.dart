import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _color = [Colors.blue, Colors.green, Colors.teal];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Crypto App')),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: ListView.builder(
              itemCount:
                  widget.currencies == null ? 0 : widget.currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color = _color[index % _color.length];

                return getListItemUi(currency, color);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget getListItemUi(Map currency, MaterialColor color) {
    return ListTile(
      leading: new CircleAvatar(
        child: new Text(currency["name"][0]),
      ),
      title: new Text(
        currency["name"],
        style: new TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: _getSubtitleText(
          currency["price_usd"], currency["percent_change_1h"]),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
      text: "\$$priceUSD\n",
      style: new TextStyle(
        color: Colors.black,
      ),
    );
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: "\$$percentageChange\n",
          style: TextStyle(
            color: Colors.green,
          ));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: "\$$percentageChange",
          style: new TextStyle(
            color: Colors.red,
          ));
    }

    return new RichText(
      text: new TextSpan(
        children: [priceTextWidget, percentageChangeTextWidget],
      ),
    );
  }
}
