
import 'package:flutter/material.dart';
import 'package:jdshop/pages/tabs/ShopCar/CartItem.dart';
import 'package:jdshop/provider/Container.dart';
import 'package:provider/provider.dart';
import 'CartItem.dart';
import 'CartNum.dart';
import 'package:jdshop/provider/Cart.dart';
import 'package:provider/provider.dart';

class ShopCarVc extends StatefulWidget {
  ShopCarVc({Key key}) : super(key: key);

  _ShopCarVcState createState() => _ShopCarVcState();
}

class _ShopCarVcState extends State<ShopCarVc> {

  @override
  Widget build(BuildContext context) {

    var CounterProcider = Provider.of<Containers>(context);
    var CartProcider = Provider.of<Cart>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          CounterProcider.incount();

          //给购物车增加数据
          CartProcider.addData('哈哈${CounterProcider.count}');
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text('统计数量${CounterProcider.count}'),
          ),
          Divider(),
          //购物车列表
          CartItem(),
          Divider(),
          CartNum(),
        ],
      ),
    );
  }
}