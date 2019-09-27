import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:jdshop/tool/ljjButton.dart';

class ProdectContentFirst extends StatefulWidget {
  ProdectContentFirst({Key key}) : super(key: key);

  _ProdectContentFirstState createState() => _ProdectContentFirstState();
}

class _ProdectContentFirstState extends State<ProdectContentFirst> {
  //返回Warp组件
  Widget backWarp(text) {
    return Wrap(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: ljjAdaper.height(30)),
          width: ljjAdaper.width(100),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: ljjAdaper.getScreenWidthDP() - ljjAdaper.width(150),
          child: Wrap(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  child: Chip(
                    label: Text('白色'),
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Chip(
                    label: Text('白色'),
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Chip(
                    label: Text('白色'),
                  )),
            ],
          ),
        )
      ],
    );
  }

  void _attrBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return GestureDetector(
              onTap: () {},
              child: Stack(children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    child: ListView(children: <Widget>[
                      Column(children: <Widget>[
                        this.backWarp('颜色：'),
                        this.backWarp('尺寸：'),
                        this.backWarp('其他：'),
                      ])
                    ])),
                Positioned(
                    bottom: 20,
                    width: ljjAdaper.getScreenWidthDP(),
                    height: ljjAdaper.width(80),
                    child: Row(children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ljjButton(
                                  color: Color.fromRGBO(253, 1, 0, 0.5),
                                  text: '加入购物车'))),
                      Expanded(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ljjButton(
                                  color: Color.fromRGBO(253, 165, 0, 0.9),
                                  text: '立即购买'))),
                    ]))
              ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Container(
      padding: EdgeInsets.all(ljjAdaper.width(10)),
      child: ListView(
        children: <Widget>[
          AspectRatio(
            //图片
            aspectRatio: 16 / 9,
            child: Image.network('https://itying.com/images/flutter/p1.jpg',
                fit: BoxFit.cover),
          ),
          Container(
            //主标题
            padding: EdgeInsets.only(top: ljjAdaper.height(10)),
            child: Text(
              '联想Thinkpad 489 (0VCD) 英特尔瑞i5 14英寸情债博笔记本电脑',
              style: TextStyle(
                color: Colors.black87,
                fontSize: ljjAdaper.sizeFont(36),
              ),
            ),
          ),
          Container(
            //子标题
            padding: EdgeInsets.only(top: ljjAdaper.height(10)),
            child: Text(
              '联想Thinkpad 489 (0VCD) 英特尔瑞i5 14英寸情债博笔记本电脑',
              style: TextStyle(
                color: Colors.black54,
                fontSize: ljjAdaper.sizeFont(28),
              ),
            ),
          ),
          Container(
            //价格
            padding: EdgeInsets.only(top: ljjAdaper.height(10)),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Text('价格:'),
                      Text(
                        ' &23',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: ljjAdaper.sizeFont(36)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('原价:'),
                      Text(
                        ' &50',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: ljjAdaper.sizeFont(28),
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
              //筛选
              margin: EdgeInsets.only(top: ljjAdaper.height(10)),
              height: ljjAdaper.height(80),
              child: InkWell(
                  onTap: () {
                    this._attrBottomSheet();
                  },
                  child: Row(
                    children: <Widget>[
                      Text('已选', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: ljjAdaper.width(10)),
                      Text('115黑色, XL, 1件')
                    ],
                  ))),
          Divider(),
          Container(
            //运费
            height: ljjAdaper.height(80),
            child: Row(
              children: <Widget>[
                Text(
                  '运费',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: ljjAdaper.width(10),
                ),
                Text('免运费'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
