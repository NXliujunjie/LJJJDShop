import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';

class ljjButton extends StatelessWidget {

  final Color color;
  final String text;
  final Object cb;
  ljjButton({Key key, this.color = Colors.black87,  this.text = '按钮', this.cb = null}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        height: ljjAdaper.height(72),
        width: double.infinity,
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      onTap: this.cb,
    );
  }
}
