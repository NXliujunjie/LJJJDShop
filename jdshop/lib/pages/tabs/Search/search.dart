import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';

class SearchVc extends StatefulWidget {
  SearchVc({Key key}) : super(key: key);

  _SearchVcState createState() => _SearchVcState();
}

class _SearchVcState extends State<SearchVc> {
  var _keyWords;
  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
              onChanged: (v) {
                this._keyWords = v;
              },
            ),
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          actions: <Widget>[
            Container(
              height: 68,
              width: 80,
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: Text('搜索'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/ProductList', arguments: {
                        'keyWords': this._keyWords,
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(ljjAdaper.height(10)),
          child: ListView(
            children: <Widget>[
              Container(
                child: Text(
                  '热搜',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Divider(),
              Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text('女装'),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text('女装'),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text('女装女装'),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text('女装'),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ljjAdaper.height(10)),
              Container(
                child: Text(
                  '历史记录',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text('123123'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('123123'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('123123'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('123123'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('123123'),
                  ),
                  Divider(),
                ],
              ),
              SizedBox(
                height: ljjAdaper.height(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Color.fromRGBO(233, 233, 233, 0.7),
                          width: 1,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.delete),
                        Text('清空历史记录'),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
