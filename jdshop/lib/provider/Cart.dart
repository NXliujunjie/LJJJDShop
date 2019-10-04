import 'package:flutter/material.dart';

class Cart with ChangeNotifier {

  List _cartList = [];
  int get cartNum => this._cartList.length;
}