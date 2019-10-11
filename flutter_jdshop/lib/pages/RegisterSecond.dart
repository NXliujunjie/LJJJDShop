import 'package:flutter/material.dart';
import '../widget/JdText.dart';
import '../widget/JdButton.dart';
import '../services/ScreenAdapter.dart';
import 'dart:async';

// ignore: must_be_immutable
class RegisterSecondPage extends StatefulWidget {
  Map arguments;
  RegisterSecondPage({Key key, this.arguments}) : super(key: key);
  _RegisterSecondPageState createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends State<RegisterSecondPage> {
  String tell;
  bool sendCodeBtn = false;
  int second = 10;
  Timer t;

  //倒计时
  void _showTime() {
    t = Timer.periodic(Duration(milliseconds: 1000), (v) {
      setState(() {
        this.second--;
        if (this.second == 0) {
          v.cancel();
          this.sendCodeBtn = true;
        }
      });
    });
  }

  //重新发送
  void _sendCode() {
    this.sendCodeBtn = false;
    this.second = 10;
    this._showTime();
  }

  //验证验证码
  void validaCode() {
    Navigator.pushNamed(context, '/registerThird');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tell = widget.arguments['tell'];
    this._showTime(); // ignore: must_call_super
  }

  @override
  // ignore: must_call_super
  void dispose() {
    // TODO: implement dispose
    t.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户注册-第二步"),
      ),
      body: Container(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text("请输入xxx手机收到的验证码,请输入xxx手机收到的验证码"),
            ),
            SizedBox(height: 40),
            Stack(
              children: <Widget>[
                JdText(
                  text: "请输入验证码",
                  onChanged: (value) {
                    print(value);
                  },
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: this.sendCodeBtn == true
                      ? RaisedButton(
                          child: Text('重新发送'),
                          onPressed: this._sendCode,
                        )
                      : RaisedButton(
                          child: Text('${this.second}秒后重发'),
                          onPressed: () {},
                        ),
                ),
              ],
            ),
            SizedBox(height: 20),
            JdButton(
              text: "下一步",
              color: Colors.red,
              height: 74,
              cb: this.validaCode,
            ),
          ],
        ),
      ),
    );
  }
}
