import 'package:flutter/material.dart';

class ljjHud extends StatefulWidget {
  ljjHud({Key key}) : super(key: key);

  _ljjHudState createState() => _ljjHudState();
}

class _ljjHudState extends State<ljjHud> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
