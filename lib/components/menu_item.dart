import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData iconData;

  MenuItem({this.title, this.onTap, this.iconData});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          // elevation: 4.0,
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                    color: Colors.indigo[900],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0))),
                child: Center(
                    child: Icon(
                  iconData,
                  size: 48.0,
                  color: Colors.white,
                )),
              ),
              SizedBox(width: 8.0),
              Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
