import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';

class ProductNum extends StatefulWidget {
  var _prodectContent;

  ProductNum(this._prodectContent, {Key key}) : super(key: key);

  _ProductNumState createState() => _ProductNumState();
}

class _ProductNumState extends State<ProductNum> {
  var _prodectContent;

  @override
  void initState() {
    super.initState();
    this._prodectContent = widget._prodectContent;
  }

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
      onTap: () {
        setState(() {
          if (this._prodectContent.count > 1) {
            this._prodectContent.count--;
          }
        });
      },
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
      onTap: () {
        setState(() {
          this._prodectContent.count++;
        });
      },
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
      child: Text('${this._prodectContent.count.toString()}'),
    );
  }
}
