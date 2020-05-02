import 'package:corona/country2.dart';
import 'package:flutter/material.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Countrycard('65,851', '161,666', '905,712','1,133,229', 'icons/flags/png/us.png',
             'U.S.A'),
                Countrycard('25,100', '146,233', '74,234','245,5679', 'icons/flags/png/es.png',
             'Spain'),
                     Countrycard('28,236', '78,249', '100,943','207,428', 'icons/flags/png/it.png',
             'Italy'),
                     Countrycard('27,510', '55,253', '90,712','177,454', 'icons/flags/png/de.png',
             'U.K.'),
                     Countrycard('24,594', '50,212', '92,540','167,346', 'icons/flags/png/fr.png',
             'France'),     
      ],
    );
  }
}
