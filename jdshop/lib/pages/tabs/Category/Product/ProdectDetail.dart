import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'ProdectContent/ProdectContentFirst.dart';
import 'ProdectContent/ProdectContentThird.dart';
import 'ProdectContent/ProdectContentSecond.dart';

// import 'package:jdshop/service/ljjAdaper.dart';
// import 'package:dio/dio.dart';
// import 'package:jdshop/config/config.dart';

class ProdectDetail extends StatefulWidget {
  final Map arguments;
  ProdectDetail({Key key, this.arguments}) : super(key: key);

  _ProdectDetailState createState() => _ProdectDetailState();
}

class _ProdectDetailState extends State<ProdectDetail> {
  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more),
              onPressed: () {
                showMenu(
                  context: context,
                  position:
                      RelativeRect.fromLTRB(ljjAdaper.width(600), 76, 10, 0),
                  items: [
                    PopupMenuItem(
                      child: Row(
                        children: <Widget>[Icon(Icons.home), Text('搜索1')],
                      ),
                    )
                  ],
                );
              },
            )
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ljjAdaper.width(400),
                child: TabBar(
                  indicatorColor: Colors.red,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(
                      child: Text('商品'),
                    ),
                    Tab(
                      child: Text('详情'),
                    ),
                    Tab(
                      child: Text('评价'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            TabBarView(
              children: <Widget>[
                ProdectContentFirst(),
                ProdectContentSecond(),
                ProdectContentThird(),
              ],
            ),
            Positioned(
              
              width: 750,
              height: 80,
              bottom: 0,
              child: Text('123'),
            )
          ],
        ),
      ),
    );
  }
}
