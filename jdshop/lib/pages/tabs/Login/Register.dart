import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:jdshop/tool/ljjButton.dart';
import 'package:jdshop/tool/ljjTextField.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册-第一步'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            ljjTextField(
              text: '输入手机号',
            ),
            SizedBox(
              height: ljjAdaper.height(20),
            ),
            ljjButton(
              text: '下一步',
              color: Colors.grey,
              cb: () {
                Navigator.pushNamed(context, '/RegisterSecond');
              },
            )
          ],
        ),
      ),
    );
  }
}
