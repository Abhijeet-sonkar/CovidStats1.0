import 'package:flutter/material.dart';

class Countrycard extends StatelessWidget {
  final String death;
  final String recovered;
  final String active;
  final String flag;
  final String name;
  final String total;
  Countrycard(this.death, this.recovered, this.active, this.total, this.flag,
      this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.width * 0.05),
      child: Card(
        elevation: 30,
        color: Colors.orange[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        
        child: Row(children: [
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 32),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Image.network(
                      this.flag,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(this.name),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Total Cases",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      this.total,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      Text(
                        'Deceased   ',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(this.death),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Recovered  ',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(this.recovered),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Active Cases',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(this.active),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
