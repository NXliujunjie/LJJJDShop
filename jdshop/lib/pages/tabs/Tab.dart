import 'package:flutter/material.dart';
import 'Home//Home.dart';
import 'Category/Category.dart';
import 'User/User.dart';
import 'ShopCar/ShopCar.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  
  int _currentIndex = 0;

  List _pageList = [
    HomeVc(),
    CategoryVc(),
    ShopCarVc(),
    UserVc()
  ];

    List _titleList = [
    '首页',
    '分类',
    '购物车',
    '我的'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleList[this._currentIndex]),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index){
          setState(() {
            this._currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('分类')),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('购物车')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的'))
        ],
      ),
    );
  }
}
