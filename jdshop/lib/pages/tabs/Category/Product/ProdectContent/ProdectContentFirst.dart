import 'package:flutter/material.dart';
import 'package:jdshop/Models/prodectDetailModel.dart';
import 'package:jdshop/config/config.dart';
import 'package:jdshop/pages/tabs/Category/Product/ProdectContent/ProductNum.dart';
import 'package:jdshop/provider/Cart.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:jdshop/tool/ljjButton.dart';
import 'package:jdshop/tool/ljjEvent.dart';
import 'package:jdshop/service/cartService.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProdectContentFirst extends StatefulWidget {
  final List predectDetailItemModelList;
  ProdectContentFirst(this.predectDetailItemModelList, {Key key})
      : super(key: key);
  _ProdectContentFirstState createState() => _ProdectContentFirstState();
}

class _ProdectContentFirstState extends State<ProdectContentFirst>
    with AutomaticKeepAliveClientMixin {
  PredectDetailItemModel _prodectContant;
  List<PredectDetailItemAttrModel> _attr = [];
  @override
  bool get wantKeepAlive => true;
  String _selectValue;
  var actionEventBus;
  var cartProvider;
  @override
  void initState() {
    super.initState();
    this._prodectContant = widget.predectDetailItemModelList[0];
    this._attr = this._prodectContant.attr;
    this._initAttr();
    this.actionEventBus = eventBus.on<ljjProductContentEvent>().listen((event) {
      print(event);
      if (this._prodectContant.attr.length > 0) {
        this._attrBottomSheet();
      }
    });
  }

  //销毁
  @override
  void dispose() {
    super.dispose();
    this.actionEventBus.cancel();
  }

  //格式化数据
  void _initAttr() {
    var attr = this._attr;
    for (var i = 0; i < attr.length; i++) {
      attr[i].attrList.clear(); //清空数组的属性

      for (var j = 0; j < attr[i].list.length; j++) {
        attr[i].attrList.add({
          'title': attr[i].list[j],
          'checket': j == 0 ? true : false,
        });
      }
    }
    _getAttr();
  }

  //改变数据
  void _chageAttr(cate, title, setBottomState) {
    var attr = this._attr;

    for (var i = 0; i < attr.length; i++) {
      if (attr[i].cate == cate) {
        for (var j = 0; j < attr[i].attrList.length; j++) {
          attr[i].attrList[j]['checket'] = false;
          if (title == attr[i].attrList[j]['title']) {
            attr[i].attrList[j]['checket'] = true;
          }
        }
      }
    }
    setBottomState(() {
      //改变showModalBottomSheet 数据
      this._attr = attr;
    });
    _getAttr();
  }

  //获取选中的值
  void _getAttr() {
    var _list = this._attr;
    List tempAttr = [];
    for (var i = 0; i < _list.length; i++) {
      for (var j = 0; j < _list[i].attrList.length; j++) {
        if (_list[i].attrList[j]['checket'] == true) {
          tempAttr.add(_list[i].attrList[j]['title']);
        }
      }
    }
    setState(() {
      this._selectValue = tempAttr.join(',');
      this._prodectContant.selectAttr = this._selectValue;
    });
  }

  //返回Warp组件
  Widget backWarp(PredectDetailItemAttrModel model, setBottomState) {
    return Wrap(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: ljjAdaper.height(30)),
          width: ljjAdaper.width(130),
          child: Text(
            model.cate.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: ljjAdaper.getScreenWidthDP() - ljjAdaper.width(170),
          child: Wrap(
            children: model.attrList.map((v) {
              return Container(
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      this._chageAttr(model.cate, v['title'], setBottomState);
                    },
                    child: Chip(
                      backgroundColor:
                          v['checket'] == true ? Colors.red : Colors.black12,
                      label: Text(v['title']),
                    ),
                  ));
            }).toList(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) { // ignore: must_call_super
    this.cartProvider = Provider.of<Cart>(context);
    ljjAdaper.init(context);
    String spic = this._prodectContant.pic;
    spic = ljjConfig.domain + spic.replaceAll('\\', '/');
    return Container(
      padding: EdgeInsets.all(ljjAdaper.width(10)),
      child: ListView(
        children: <Widget>[
          AspectRatio(
            //图片
            aspectRatio: 16 / 15,
            child: Image.network(spic, fit: BoxFit.cover),
          ),
          Container(
            //主标题
            padding: EdgeInsets.only(top: ljjAdaper.height(10)),
            child: Text(
              this._prodectContant.title,
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
              this._prodectContant.subTitle,
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
                        ' &${this._prodectContant.price.toString()}',
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
                        ' &${this._prodectContant.oldPrice.toString()}',
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
                      Text('${this._selectValue}')
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

  //底部弹窗
  void _attrBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, setBottomState) {
              return GestureDetector(
                  onTap: () {},
                  child: Stack(children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10),
                        child: ListView(children: <Widget>[
                          Column(
                            children: this
                                ._attr
                                .map((PredectDetailItemAttrModel model) {
                              return backWarp(model, setBottomState);
                            }).toList(),
                          ),
                          Divider(),
                          Container(
                              //筛选
                              margin:
                                  EdgeInsets.only(top: ljjAdaper.height(10)),
                              height: ljjAdaper.height(80),
                              child: InkWell(
                                  child: Row(
                                children: <Widget>[
                                  Text('数量',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  ProductNum(this._prodectContant),
                                ],
                              ))),
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
                                text: '加入购物车',
                                cb: () async {
                                  await CartService.addCart(
                                      this._prodectContant);
                                  Navigator.of(context).pop(); //关闭底部弹出框
                                  //调用Provider 更新数据
                                  this.cartProvider.updateCartList();
                                  Fluttertoast.showToast(
                                      msg: "加入购物车成功",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      fontSize: 16.0);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ljjButton(
                                  color: Color.fromRGBO(253, 165, 0, 0.9),
                                  text: '立即购买'),
                            ),
                          ),
                        ]))
                  ]));
            },
          );
        });
  }
}
