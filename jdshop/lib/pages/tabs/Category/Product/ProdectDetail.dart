import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jdshop/Models/prodectDetailModel.dart';
import 'package:jdshop/config/config.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:jdshop/tool/ljjEvent.dart';
import 'package:jdshop/tool/ljjHud.dart';
import 'ProdectContent/ProdectContentFirst.dart';
import 'ProdectContent/ProdectContentThird.dart';
import 'ProdectContent/ProdectContentSecond.dart';
import '../../../../tool/ljjButton.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:jdshop/service/ljjAdaper.dart';
// import 'package:dio/dio.dart';
// import 'package:jdshop/config/config.dart';

class ProdectDetail extends StatefulWidget {
  final Map arguments;
  ProdectDetail({Key key, this.arguments}) : super(key: key);

  _ProdectDetailState createState() => _ProdectDetailState();
}

class _ProdectDetailState extends State<ProdectDetail> {
  List<PredectDetailItemModel> PredectDetailItemModelList = [];
  @override
  void initState() {
    super.initState();
    this._getDetailData();
  }

  void _getDetailData() async {
    var api = '${ljjConfig.domain}api/pcontent?id=${widget.arguments['sId']}';
    var result = await Dio().get(api);
    var productList = new PredectDetailModel.fromJson(result.data);
    setState(() {
      this.PredectDetailItemModelList.add(productList.result);
    });
  }

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
          body: this.PredectDetailItemModelList.length > 0
              ? Stack(
                  children: <Widget>[
                    TabBarView(
                      children: <Widget>[
                        ProdectContentFirst(this.PredectDetailItemModelList),
                        ProdectContentSecond(this.PredectDetailItemModelList),
                        ProdectContentThird(this.PredectDetailItemModelList),
                      ],
                    ),
                    Positioned(
                      width: ljjAdaper.getScreenWidthDP(),
                      height: ljjAdaper.height(88),
                      bottom: 15,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(
                              color: Colors.black87,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            ///ShopCart
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/ShopCart');
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 5),
                                margin: EdgeInsets.only(left: 25),
                                width: ljjAdaper.height(100),
                                height: ljjAdaper.height(80),
                                child: Column(
                                  children: <Widget>[
                                    Icon(Icons.shopping_cart),
                                    Text('购物车')
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ljjButton(
                                color: Color.fromRGBO(253, 1, 0, 0.9),
                                text: '加入购物车',
                                cb: () {
                                  eventBus.fire(
                                      new ljjProductContentEvent('加入购物车')); //广播
                                  // Fluttertoast.showToast(
                                  //     msg: "加入购物车成功",
                                  //     toastLength: Toast.LENGTH_LONG,
                                  //     gravity: ToastGravity.CENTER,
                                  //     fontSize: 16.0);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ljjButton(
                                color: Color.fromRGBO(253, 1, 0, 0.9),
                                text: '立即购买',
                                cb: () {
                                  eventBus.fire(
                                      new ljjProductContentEvent('立即购买')); //广播
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : ljjHud()),
    );
  }
}
