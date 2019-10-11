import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';

class ljjTextField extends StatelessWidget {
  final String text;
  final bool password;
  final Object onChanged;
  ljjTextField(
      {Key key,
      this.text = "输入内容",
      this.password = false,
      this.onChanged = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Container(
      child: TextField(
        obscureText: this.password,
        decoration: InputDecoration(
            hintText: this.text,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none)),
        onChanged: this.onChanged,
      ),
      height: ljjAdaper.height(68),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
    );
  }
}
