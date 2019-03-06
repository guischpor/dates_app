//imports packages flutter
import 'package:flutter/material.dart';

//imports dates widget
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

void main() {
  runApp(MaterialApp(
    home: CupertinoDate(),
    debugShowCheckedModeBanner: false,
  ));
}

class CupertinoDate extends StatefulWidget {
  final Widget child;

  CupertinoDate({Key key, this.child}) : super(key: key);

  _CupertinoDateState createState() => _CupertinoDateState();
}

class _CupertinoDateState extends State<CupertinoDate> {
  String _datetime = '';
  int _date = 11;
  int _month = 11;
  int _year = 2018;

  String _lang = 'br';
  String _format = 'dd-mm-yyyy';
  bool _showTitleActions = true;

  TextEditingController _langCtrl = TextEditingController();
  TextEditingController _formatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _langCtrl.text = 'br';
    _formatCtrl.text = 'dd-mm-yyyy';

    DateTime now = DateTime.now();
    _year = now.year;
    _month = now.month;
    _date = now.day;
  }

  /// Display date picker.
  void _showDatePicker() {
    final bool showTitleActions = false;
    DatePicker.showDatePicker(
      context,
      showTitleActions: _showTitleActions,
      minYear: 1930,
      maxYear: 2050,
      initialYear: _year,
      initialMonth: _month,
      initialDate: _date,
      confirm: Text(
        'Confirmar',
        style: TextStyle(color: Colors.red),
      ),
      cancel: Text(
        'Cancelar',
        style: TextStyle(color: Colors.cyan),
      ),
      locale: _lang,
      dateFormat: _format,
      onChanged: (year, month, date) {
        debugPrint('onChanged date: $date-$month-$year');

        if (!showTitleActions) {
          _changeDatetime(date, month, year);
        }
      },
      onConfirm: (year, month, date) {
        _changeDatetime(year, month, date);
      },
    );
  }

  void _changeDatetime(int year, int month, int date) {
    setState(() {
      _year = year;
      _month = month;
      _date = date;
      _datetime = '$date/$month/$year';
    });
    print(_datetime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Cupertino Date Picker'),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            // show title actions checkbox
            Row(
              children: <Widget>[
                Text(
                  'Show title actions',
                  style: TextStyle(fontSize: 16.0),
                ),
                Checkbox(
                  value: _showTitleActions,
                  onChanged: (value) {
                    setState(() {
                      _showTitleActions = value;
                    });
                  },
                )
              ],
            ),

            // Language input field

            TextField(
              controller: _langCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Language',
                hintText: 'en / br ...',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) {
                _lang = value;
              },
            ),

            // Formatter input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Formato de data',
                hintText: 'dd-mm-yyyy / dd-mm-yyyy  / dd-mmmm-yyyy',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) {
                _format = value;
              },
            ),

            // Selected date
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Selecione uma Data:',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      '$_datetime',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: RaisedButton(
                      onPressed: _showDatePicker,
                      child: Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                      color: Colors.indigo[900],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
