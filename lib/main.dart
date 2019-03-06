//import packages flutter
import 'package:flutter/material.dart';
import 'package:dates_app/components/menu_item.dart';

//imports pages
import 'package:dates_app/pages/flutter_cupertino_date.dart';
import 'package:dates_app/pages/flutter_date_picker.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  final Widget child;

  Home({Key key, this.child}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets Date'),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        children: <Widget>[
          SizedBox(height: 32.0),
          MenuItem(
              iconData: Icons.calendar_today,
              title: 'Flutter Cupertino Date Picker',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CupertinoDate()));
              }),
          MenuItem(
              iconData: Icons.date_range,
              title: 'Flutter Date Picker',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlutterDatePicker()));
              }),
        ],
      ),
    );
  }
}
