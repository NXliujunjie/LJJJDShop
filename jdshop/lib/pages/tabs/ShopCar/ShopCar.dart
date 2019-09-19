import 'package:flutter/material.dart';

class ShopCarVc extends StatefulWidget {
  ShopCarVc({Key key}) : super(key: key);

  _ShopCarVcState createState() => _ShopCarVcState();
}

class _ShopCarVcState extends State<ShopCarVc> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
        body: Text('购物车'),
       ),
    );
  }
}