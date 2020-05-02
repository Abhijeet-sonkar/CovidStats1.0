import 'package:flutter/material.dart';
import './homepage.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            color: Colors.orange[400].withOpacity(0.4),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0))),
        child: Row(children: [
          SizedBox(width: 30),
          Text(
            'Awareness',
          ),
          SizedBox(width: 10),
          Icon(Icons.lightbulb_outline),
        ]),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
    );
  }
}
