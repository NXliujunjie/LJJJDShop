import 'package:flutter/material.dart';
import 'package:jdshop/tool/ljjSaveData.dart';
import 'dart:convert';

class Cart with ChangeNotifier {

  List cartList = [];
  int get cartNum => this.cartList.length;

  Cart(){
    this.init();
  }
  //初始化的时候获取购物车数据
  init() async {
    try {
      List cartListData = json.decode(await LJJSaveData.getString('cartList'));
      this.cartList = cartListData;
      print(11111);
    } catch (e) {
      this.cartList=[];
      print(222222);
    }
    notifyListeners();//表示更新状态
  }

  updateCartList(){
    this.init();
  }
}