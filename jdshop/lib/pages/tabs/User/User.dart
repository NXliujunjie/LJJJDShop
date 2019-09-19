import 'package:flutter/material.dart';

class UserVc extends StatefulWidget {
  UserVc({Key key}) : super(key: key);

  _UserVcState createState() => _UserVcState();
}

class _UserVcState extends State<UserVc> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
        body: Text('个人中心'),
       ),
    );
  }
}