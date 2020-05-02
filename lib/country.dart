import 'package:corona/country2.dart';
import 'package:flutter/material.dart';

class Country extends StatefulWidget {
  final List<dynamic> data;
  Country(this.data);
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            widget.data == null
                ? CircularProgressIndicator()
                : Countrycard(
                    widget.data[index]['deaths'].toString(),
                    widget.data[index]['recovered'].toString(),
                    widget.data[index]['active'].toString(),
                    widget.data[index]['cases'].toString(),
                    widget.data[index]['countryInfo']['flag'],
                    widget.data[index]['country']),
          ],
        );
      },
      itemCount: 5,
    );
  }
}
