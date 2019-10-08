import 'package:flutter/material.dart';
import 'package:jdshop/pages/tabs/ShopCar/CartWares.dart';
import 'package:jdshop/provider/Cart.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:provider/provider.dart';

class ShopCarVc extends StatefulWidget {
  ShopCarVc({Key key}) : super(key: key);

  _ShopCarVcState createState() => _ShopCarVcState();
}

class _ShopCarVcState extends State<ShopCarVc> {
  @override
  
  Widget build(BuildContext context) {
    ljjAdaper.init(context);

    var cartProcider = Provider.of<Cart>(context);
    print("wwwwwwwwwwwwwww${cartProcider.cartList}");
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.launch),
            onPressed: null,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: cartProcider.cartList.map((v) {
              return CartWares(v);
            }).toList(),
          ),
          Positioned(
            bottom: 0,
            width: ljjAdaper.getScreenWidthDP(),
            height: ljjAdaper.height(78),
            child: Container(
              width: ljjAdaper.getScreenWidthDP(),
              height: ljjAdaper.height(78),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          width: ljjAdaper.width(60),
                          child: Checkbox(
                            value: true,
                            activeColor: Colors.pink,
                            onChanged: (v) {},
                          ),
                        ),
                        Text('全选'),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      child: RaisedButton(
                        child: Text(
                          '结算',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(top: BorderSide(width: 1, color: Colors.black12))),
            ),
          )
        ],
      ),
    );
  }
}
