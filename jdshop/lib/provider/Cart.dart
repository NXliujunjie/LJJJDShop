import 'package:flutter/material.dart';
import 'package:jdshop/tool/ljjSaveData.dart';
import 'dart:convert';

class Cart with ChangeNotifier {

  List cartList = [];
  int get cartNum => this.cartList.length;
  bool _getCheckedAll = false;//状态
  bool get getCheckedAll => _getCheckedAll;//状态

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

  changeItemCount(){
    LJJSaveData.setString("cartList", json.encode(this.cartList));
    notifyListeners();//表示更新状态
  }

  //全选反选
  checkAll(value){
    for (var i = 0; i < this.cartList.length; i++) {
      this.cartList[i]['checket'] = value;
    }
    _getCheckedAll = value;
    LJJSaveData.setString("cartList", json.encode(this.cartList));
    notifyListeners();//表示更新状态
  }

  //判断是否全选
  bool isChecketAll(){
    for (var i = 0; i < this.cartList.length; i++) {
      if (this.cartList[i]['checket'] == false) {
        return false;
      }
    }
    return true;
  }

  //监听每一项
   itemChange(){
    if (this.isChecketAll()) {
      this._getCheckedAll = true;
    }else{
      this._getCheckedAll = false;
    }
    LJJSaveData.setString("cartList", json.encode(this.cartList));
    notifyListeners();//表示更新状态
  }
}