import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';

class UserVc extends StatefulWidget {
  UserVc({Key key}) : super(key: key);

  _UserVcState createState() => _UserVcState();
}

class _UserVcState extends State<UserVc> {
  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: ljjAdaper.height(220),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/user_bg.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ClipOval(
                    child: Image.asset(
                      'images/user.png',
                      fit: BoxFit.cover,
                      width: ljjAdaper.width(120),
                      height: ljjAdaper.width(120),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Text('登录/注册', style: TextStyle(color: Colors.white,)),
                    onTap: (){
                      Navigator.pushNamed(context, "/Login");
                    },
                  ),
                )
                // Text('登录/注册', style: TextStyle(color: Colors.white,))
                // Expanded(
                //   flex: 1,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Text("用户名:123123123",
                //           style: TextStyle(
                //             color: Colors.white,
                //           )),
                //       Text('普通会员',
                //           style: TextStyle(
                //             color: Colors.white,
                //           )),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.assessment,
              color: Colors.red,
            ),
            title: Text('全部订单'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Colors.green,
            ),
            title: Text('待付款'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.local_car_wash,
              color: Colors.orange,
            ),
            title: Text('待收货'),
          ),
          Container(
            height: 20,
            width: double.infinity,
            color: Colors.green,
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.lightGreen,
            ),
            title: Text('我的收藏'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.black54,
            ),
            title: Text('在线客服'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
