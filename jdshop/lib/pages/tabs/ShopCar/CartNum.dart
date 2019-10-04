import 'package:flutter/material.dart';
import 'package:jdshop/provider/Cart.dart';
import 'package:provider/provider.dart';

class CartNum extends StatefulWidget {
  CartNum({Key key}) : super(key: key);

  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  @override
  Widget build(BuildContext context) {
    var cartProcider = Provider.of<Cart>(context);

    return Container(
       child: Column(
         children: <Widget>[
           Text('我是数量${cartProcider.cartNum}')
         ],
       ),
    );
  }
}