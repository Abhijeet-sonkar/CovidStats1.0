import 'package:flutter/material.dart';
import './tile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: Text('Awareness'),
          backgroundColor: Colors.orange,),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
              0.1,
           
            ],
                colors: [
              Colors.orange[100],
           
            ]),
         
            ),
            
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
       
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: TabBar(
                  controller: tabController,
                  indicatorColor: Colors.orangeAccent,
                  labelColor: Colors.deepOrange,
                  unselectedLabelColor: Colors.grey.withOpacity(0.9),
                  isScrollable: true,
                  tabs: <Widget>[
                       Tab(
                      
                        child: Text('Info',
                            style: TextStyle(
                            
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold))),
                    Tab(
                      
                        child: Text('Precautions',
                            style: TextStyle(
                            
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold))),
                    Tab(
                        child: Text('Symptoms',
                            style: TextStyle(
                       
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold))),
                  ],
                )),
            Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.6,
                child: TabBarView(controller: tabController, children: <Widget>[
                       new Tiles('images/info.jpg'),
                  new Tiles('images/precautions.jpg'),
                  new Tiles('images/symptoms.jpg'),
                ])),
              
          ],
        ),
      ),
    );
  }
}
