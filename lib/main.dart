import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasty_Pizza',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Tasty Pizza'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List foods = [
    'Chicken Tikka',
    'Chicken Fajita',
    'Chilli Chicken',
  ];

  Widget searchListBuilder(dynamic lise) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(Icons.search_rounded),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search here',
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFAFAFA),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size(60, 203),
            child: Center(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          elevation: 0,
                          child: Icon(
                            Icons.notes_outlined,
                            size: 30,
                          ),
                          backgroundColor: Color(0),
                          shape: Border.all(color: Color(0)),
                        ),
                        Expanded(
                          child: Text(
                            'Home',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        FloatingActionButton(
                          elevation: 0,
                          child: Image(
                            image: AssetImage('assets/livreur.jpg'),
                            height: 30,
                          ),
                          backgroundColor: Color(0),
                          shape: Border.all(color: Color(0)),
                        ),
                      ],
                    ),
                    Row(children: <Widget>[
                      Text(
                        "Tasty Pizza",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )
                    ]),
                    Container(
                      width: 135,
                      height: 12,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                    GFSearchBar(
                      searchList: foods,
                    ),
                    Container(
                      height: 40,
                      child: TabBar(
                        tabs: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  Text("All", style: TextStyle(fontSize: 20))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Pizza",
                                  style: TextStyle(fontSize: 20))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  Text("Food", style: TextStyle(fontSize: 20))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Drink",
                                  style: TextStyle(fontSize: 20))),
                        ],
                        indicator: ShapeDecoration(
                            shape: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                              color: Colors.cyan,
                              width: 100,
                              style: BorderStyle.solid),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: [
            Icon(Icons.food_bank_outlined),
            Icon(Icons.directions_transit),
            Icon(Icons.food_bank_rounded),
            Icon(Icons.food_bank_sharp),
          ],
        ),
      ),
    );
  }
}
