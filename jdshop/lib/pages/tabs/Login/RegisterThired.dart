import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:jdshop/tool/ljjButton.dart';
import 'package:jdshop/tool/ljjTextField.dart';

class RegisterThired extends StatefulWidget {
  RegisterThired({Key key}) : super(key: key);

  _RegisterThiredState createState() => _RegisterThiredState();
}

class _RegisterThiredState extends State<RegisterThired> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册-第三步'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            ljjTextField(
              text: '输入密码',
            ),
            SizedBox(
              height: ljjAdaper.height(20),
            ),
            ljjTextField(
              text: '确认密码',
            ),
            SizedBox(
              height: ljjAdaper.height(20),
            ),
            ljjButton(
              text: '完成',
              color: Colors.grey,
              cb: () {
               // Navigator.pushNamed(context, '/RegisterThiredSecond');
              },
            )
          ],
        ),
      ),
    );
  }
}
