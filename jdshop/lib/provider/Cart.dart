import 'package:flutter/material.dart';
import 'package:jdshop/tool/ljjSaveData.dart';
import 'dart:convert';

class Cart with ChangeNotifier {

  List cartList = [];
  int get cartNum => this.cartList.length;
  bool _getCheckedAll = false;//状态
  bool get getCheckedAll => _getCheckedAll;//全选//状态
  double _allPrice;//总价
  double get allPrice  => this._allPrice ;//全选//状态

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
     //计算总价
    this.computeAllPrice();
    notifyListeners();//表示更新状态
  }

  updateCartList(){
    this.init();
  }

  changeItemCount(){
    LJJSaveData.setString("cartList", json.encode(this.cartList));
     //计算总价
    this.computeAllPrice();
    notifyListeners();//表示更新状态
  }

  //全选反选
  checkAll(value){
    for (var i = 0; i < this.cartList.length; i++) {
      this.cartList[i]['checket'] = value;
    }
    _getCheckedAll = value;
    //计算总价
    this.computeAllPrice();
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
    //计算总价
    this.computeAllPrice();
    LJJSaveData.setString("cartList", json.encode(this.cartList));
    notifyListeners();//表示更新状态
  }

  //计算总价
  computeAllPrice(){
     double tempAllPrice = 0;
     for (var i = 0; i < this.cartList.length; i++) {
      if (this.cartList[i]['checket'] == true) {
         tempAllPrice += this.cartList[i]['price'] * this.cartList[i]['count'];
      }
    }

    this._allPrice = tempAllPrice;
    notifyListeners();//表示更新状态
  }

  //删除数据
  removeItem(){
    var tempList = [];

     for (var i = 0; i < this.cartList.length; i++) {
      if (this.cartList[i]['checket'] == false) {
         tempList.add(this.cartList[i]);
      }
    }
    this.cartList = tempList;
    
    LJJSaveData.setString("cartList", json.encode(this.cartList));
   //计算总价
   this.computeAllPrice();

  }
}