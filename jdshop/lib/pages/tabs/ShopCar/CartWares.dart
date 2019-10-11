import 'package:flutter/material.dart';
import 'package:jdshop/pages/tabs/ShopCar/CartTotal.dart';
import 'package:jdshop/provider/Cart.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:provider/provider.dart';

class CartWares extends StatefulWidget {
  Map _itemData;

  CartWares(this._itemData, {Key key}) : super(key: key);
  _CartWaresState createState() => _CartWaresState();
}

class _CartWaresState extends State<CartWares> {
  Map _itemData;
  
  @override
  Widget build(BuildContext context) {
    this._itemData = widget._itemData;
    ljjAdaper.init(context);
    var cartProcider = Provider.of<Cart>(context);
    return Container(
      height: ljjAdaper.height(200),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: ljjAdaper.width(60),
            child: Checkbox(
              value: this._itemData['checket'],
              onChanged: (v) {
                  this._itemData['checket'] = !this._itemData['checket'];
                  cartProcider.itemChange();
           
              },
              activeColor: Colors.pink,
            ),
          ),
          Container(
            width: ljjAdaper.width(160),
            height: ljjAdaper.width(160),
            child: Image.network(
              '${this._itemData['pic']}',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${this._itemData['title']}',
                    maxLines: 2,
                  ),
                  Text(
                    '${this._itemData['selectAttr']}',
                    maxLines: 1,
                  ),
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '￥${this._itemData['price']}',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CartTotal(this._itemData),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
