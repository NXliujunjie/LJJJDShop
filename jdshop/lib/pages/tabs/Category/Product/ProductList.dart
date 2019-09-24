import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';

class ProductList extends StatefulWidget {
  final Map arguments;
  ProductList({Key key, this.arguments}) : super(key: key);
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('商品列表'),
        actions: <Widget>[
          Text(''),//去除右侧筛选按钮
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          child: Text('筛选功能'),
        ),
      ),
      body: Stack(
        children: <Widget>[
          _productWidget(), // 列表界面
          _headerWidget(),
        ],
      ),
    );
  }

/*
 * 筛选导航
 */
  Widget _headerWidget() {
    return Positioned(
      top: 0,
      height: ljjAdaper.height(80),
      width: ljjAdaper.getScreenWidthDP(),
      child: Container(
        height: ljjAdaper.height(80),
        width: ljjAdaper.getScreenWidthDP(),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromRGBO(233, 233, 233, 0.9)))),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ljjAdaper.height(20), 0, ljjAdaper.height(20)),
                  child: Text(
                    '综合',
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ljjAdaper.height(20), 0, ljjAdaper.height(20)),
                  child: Text(
                    '销量',
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ljjAdaper.height(20), 0, ljjAdaper.height(20)),
                  child: Text(
                    '价格',
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ljjAdaper.height(20), 0, ljjAdaper.height(20)),
                  child: Text(
                    '筛选',
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {
                  _scaffoldKey.currentState.openEndDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

/*
 * 列表界面
 */
  Widget _productWidget() {
    return Container(
      margin: EdgeInsets.only(top: ljjAdaper.width(80)),
      padding: EdgeInsets.all(ljjAdaper.width(10)),
      child: ListView.builder(
        itemBuilder: (c, i) {
          return Column(
            //每一个元素
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: ljjAdaper.width(180),
                    height: ljjAdaper.height(180),
                    child: Image.network(
                        'https://www.itying.com/images/flutter/list2.jpg',
                        fit: BoxFit.cover),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: ljjAdaper.height(180),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '戴尔(DELL)灵越3331 英特尔酷睿处理器 台式机(九代))',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '&999',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
              ),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }
}
