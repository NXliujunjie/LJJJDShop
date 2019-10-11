import 'package:flutter/material.dart';
import 'package:jdshop/tool/ljjButton.dart';
import 'package:jdshop/tool/ljjTextField.dart';

class RegisterSecond extends StatefulWidget {
  RegisterSecond({Key key}) : super(key: key);

  _RegisterSecondState createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册-第二步'),

      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
           Stack(
             children: <Widget>[
                ljjTextField(
              text: '输入验证码',
            ),
            Positioned(
              right: 0,
              top: 10,
              child: RaisedButton(
                child: Text('从新发送'),
                onPressed: (){
                },
              ),
            )
             ],
           ),
            SizedBox(
              height: 20,
            ),
            ljjButton(
              text: '下一步',
              color: Colors.grey,
              cb: () {
                Navigator.pushNamed(context, '/RegisterThired');
              },
            )
          ],
        ),
      ),
    );
  }
}