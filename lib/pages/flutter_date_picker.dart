import 'package:flutter/material.dart';
import 'package:flutter_date_picker/flutter_date_picker.dart';
import 'package:flutter_date_picker/flutter_time_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlutterDatePicker(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FlutterDatePicker extends StatefulWidget {
  @override
  _FlutterDatePickerState createState() => _FlutterDatePickerState();
}

class _FlutterDatePickerState extends State<FlutterDatePicker> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Function _showBottomSheetCallback;
  bool showDatePicker = false;

  @override
  void initState() {
    super.initState();

    _showBottomSheetCallback = _showBottomSheet;
  }

  void _snackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
  }

  _showBottomSheet(String picker) {
    setState(() {
      // disable the button
      _showBottomSheetCallback = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet<Null>(
          (BuildContext context) {
            switch (picker) {
              case 'DatePicker':
                return DatePicker(
                  key: dobKey,
                  setDate: _setDate,
                  customShape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  customItemColor: Colors.indigo[900],
                  customGradient:
                      LinearGradient(begin: Alignment(-0.5, 1.0), colors: [
                    Colors.indigo[900],
                    Colors.indigo[900],
                    Colors.indigo[900],
                  ]),
                );
              case 'TimePicker':
                return TimePicker(
                  key: tobKey,
                  setTime: _setTime,
                  customShape: StadiumBorder(
                      side: BorderSide(
                    color: Colors.indigo[900],
                  )),
                  customItemColor: Colors.indigo[900],
                  customGradient:
                      LinearGradient(begin: Alignment(-0.5, 1.0), colors: [
                    Colors.indigo[900],
                    Colors.indigo[900],
                    Colors.indigo[900],
                  ]),
                );
            }
          },
        )
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              // re-enable the button
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  void _setDate() {
    Navigator.of(context).pop();

    _snackBar(dobKey.currentState.dobDate +
        ' ${dobKey.currentState.dobStrMonth}' +
        ' ${dobKey.currentState.dobYear}');
  }

  void _setTime() {
    Navigator.of(context).pop();
    var hour = tobKey.currentState.hour;

    var min = tobKey.currentState.minute;

    var sec = tobKey.currentState.seconds;

    _snackBar("$hour:$min:$sec ${tobKey.currentState.sunOrMoon}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text('Date and Time Picker'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.topCenter,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.indigo[900],
                child: Text('Date Picker'),
                onPressed: () {
                  _showBottomSheet('DatePicker');
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.topCenter,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.indigo[900],
                child: Text('Time Picker'),
                onPressed: () {
                  _showBottomSheet('TimePicker');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
