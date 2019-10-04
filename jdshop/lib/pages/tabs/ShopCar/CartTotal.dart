import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';

class CartTotal extends StatefulWidget {
  CartTotal({Key key}) : super(key: key);

  _CartTotalState createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Container(
      width: ljjAdaper.width(166),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black12,
        ),
      ),
      child: Row(
        children: <Widget>[
          _leftButton(),
          _centerArea(),
          _rightButton(),
        ],
      ),
    );
  }

  //左侧按钮
  Widget _leftButton() {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: ljjAdaper.width(45),
        height: ljjAdaper.height(45),
        child: Text('-'),
      ),
    );
  }

  //右侧按钮
  Widget _rightButton() {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: ljjAdaper.width(45),
        height: ljjAdaper.height(45),
        child: Text('+'),
      ),
    );
  }

  //中间
  Widget _centerArea() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
          right: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      alignment: Alignment.center,
      width: ljjAdaper.width(70),
      height: ljjAdaper.height(45),
      child: Text('1'),
    );
  }
}
