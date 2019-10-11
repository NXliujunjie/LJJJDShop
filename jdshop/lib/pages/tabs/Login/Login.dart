import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:jdshop/tool/ljjButton.dart';
import 'package:jdshop/tool/ljjTextField.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('客服'),
              onPressed: () {},
            )
          ],
        ),
        body: this.loginBody(),
      ),
    );
  }

  //登录界面
  Widget loginBody() {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(top: ljjAdaper.height(30)),
            height: ljjAdaper.width(160),
            width: ljjAdaper.width(160),
            child: Image.asset('images/login.png'),
          ),
        ),
        SizedBox(height: 20),
        ljjTextField(
          text: '请输入用户名',
          password: false,
          onChanged: (v) {},
        ),
        SizedBox(height: 20),
        ljjTextField(
          text: '请输入密码',
          password: true,
          onChanged: (v) {},
        ),
        SizedBox(height: 20),
        Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text('忘记密码'),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text('新用户注册'),
                  onTap: (){
                    Navigator.pushNamed(context, '/Register');
                  },
                )
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        ljjButton(
          text:'登录',
          color: Colors.grey,
          cb: (){

          },
        )
      ],
    ),
    );
  }
}
