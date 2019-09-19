import 'package:flutter/material.dart';

class CategoryVc extends StatefulWidget {
  CategoryVc({Key key}) : super(key: key);

  _CategoryVcState createState() => _CategoryVcState();
}

class _CategoryVcState extends State<CategoryVc> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
        body: Text('分类'),
       ),
    );
  }
}