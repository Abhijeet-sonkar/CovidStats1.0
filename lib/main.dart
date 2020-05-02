import 'package:corona/button.dart';
import 'package:corona/country.dart';

import 'package:corona/piechart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mainpage(),
    );
  }
}

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List<dynamic> data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull('https://corona.lmao.ninja/v2/countries?sort=cases'),
        headers: {"Accept": "application/json"});
    setState(() {
      data = json.decode(response.body);
    });
    print(data[0]['deaths']);
  }

  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid-19 Stats'),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                0.1,
                0.9,
              ],
                  colors: [
                Colors.orange[100],
                Colors.orange[200],
              ])),
          child: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 40, top: 10),
                  child: Text(
                    'Worldwide Stats',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Positioned(top: 35, left: 30, child: HomePage()),
              Positioned(
                bottom: 440,
                left: 40,
                child: Text(
                  'Most Affected Countries',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 90,
                left: 15,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.0),
                          bottomLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                          topLeft: Radius.circular(25.0))),
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: Country(data),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.025,
                    ),
                    child: Button()),
              ),
              GestureDetector(
                onTap: () {
                  return showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('To get Live Update'),
                        content: const Text('Connect to a network and tap on refresh button at bottom left'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.040,
                          right: MediaQuery.of(context).size.height * 0.030,
                        ),
                        child: Icon(Icons.info_outline))),
              ),
              Positioned(
                left: 30,
                bottom: 32,
                child: GestureDetector(onTap: getData, child: Icon(Icons.sync)),
              )
            ],
          ),
        ));
  }
}
