import 'package:flutter/material.dart';

class Containers with ChangeNotifier {

  int _count = 0;

  Containers(){//初始化赋值
  this._count = 10;
  }
 
  int get count => _count; //获取状态
  incount(){
    this._count ++;
    notifyListeners();//表示更新状态
  }
}