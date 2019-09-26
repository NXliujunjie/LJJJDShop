import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:dio/dio.dart';
import 'package:jdshop/config/config.dart';
import 'package:jdshop/Models/prodectModel.dart';
import '../../../../tool/ljjHud.dart';

class ProductList extends StatefulWidget {
  final Map arguments;
  ProductList({Key key, this.arguments}) : super(key: key);
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //分页
  int _page = 1;

  int _pageSize = 5;

  //数据
  List<ProdectItemModel> _prodectData = [];
  //排序
  String _sort = '';

  //当前是否在加载, 解决重复加载的问题
  bool _flag = true;

  //是否有数据
  bool _isHaveSource = true;

  //是否有搜索数据
  bool _isHaveData = true;

  //用于上拉加载更多
  ScrollController _scrollController = ScrollController();

  /*
  二级导航数据
  */
  List _subHeaderList = [
    {
      'id': 1,
      'title': '综合',
      'fields': 'all',
      'sort': -1,
    },
    {
      'id': 2,
      'title': '销量',
      'fields': 'salecount',
      'sort': -1,
    },
    {
      'id': 3,
      'title': '价格',
      'fields': 'price',
      'sort': -1,
    },
    {
      'id': 4,
      'title': '筛选',
      'fields': 'all',
      'sort': -1,
    },
  ];

  int _selectIndex = 1;

  //配置搜索框默认值
  var _initKeywordController = new TextEditingController();

  //cid
  var _cid;
  var _keyword;

  @override
  void initState() {
    super.initState();

    this._cid = widget.arguments['cid'];
    this._keyword = widget.arguments['keyWords'];
    this._initKeywordController.text = this._keyword;
    _getProdectListData();
    print(widget.arguments);
    /**
     * 监听滚动条滚动事件
     */
    this._scrollController.addListener(() {
      var pixels = this._scrollController.position.pixels; //获取滚动条滚动高度
      var maxScrollExtent =
          this._scrollController.position.maxScrollExtent; //获取页面最大高度
      //var minScrollExtent = this._scrollController.position.minScrollExtent;//获取页面最小高度

      if (pixels >= maxScrollExtent) {
        if (this._flag == true && this._isHaveSource == true) {
          this._page++;
          this._getProdectListData();
        }
      }
    });

    //给serach框框赋值
    _initKeywordController.text = widget.arguments['keyWords'];
  }

/*
 * 二级分类点击事件
 */
  void _subHeaderChange(v) {
    if (v['id'].toString() == '4') {
      _scaffoldKey.currentState.openEndDrawer();
      setState(() {
        this._selectIndex = v['id'];
      });
    } else {
      setState(() {
        this._selectIndex = v['id'];
        this._sort = '${v['fields']}_${v['sort']}';
        //重置分页数
        this._page = 1;
        //回到顶部
        this._scrollController.jumpTo(0);
        //重置 hasMore
        this._isHaveSource = true;
        //重新请求数据
        this._getProdectListData();
        v['sort'] = v['sort'] * -1;
      });
    }
  }

/*
 * 获取数据
 */
  void _getProdectListData() async {
    String api = '';
    print('++++++++++++${this._keyword}');
    if (this._keyword == null) {
      api =
          '${ljjConfig.domain}api/plist?cid=${this._cid}&page=${this._page}&sort=${this._sort}&pageSize=${this._pageSize}';
    } else {
      api =
          '${ljjConfig.domain}api/plist?search=${this._keyword}&page=${this._page}&sort=${this._sort}&pageSize=${this._pageSize}';
    }
    print(api);
    var result = await Dio().get(api);
    var list = new ProdectModel.fromJson(result.data);
    if (list.result.length < this._pageSize) {
      setState(() {
        if (this._page == 1) {
          this._prodectData = list.result;
        } else {
          this._prodectData.addAll(list.result);
        }
        this._isHaveSource = false;
        this._flag = false;
      });
    } else {
      setState(() {
        if (this._page == 1) {
          this._prodectData = list.result;
        } else {
          this._prodectData.addAll(list.result);
        }
        this._flag = true;
      });
    }

    //判断是否有搜索数据
    if (list.result.length == 0) {
      setState(() {
        this._isHaveData = false;
      });
    } else {
      setState(() {
        this._isHaveData = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Container(
          child: TextField(
            controller: this._initKeywordController,
            autofocus: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            onChanged: (v) {
              setState(() {
                this._keyword = v;
              });
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
                    this._subHeaderChange(this._subHeaderList[0]);
                  },
                )
              ],
            ),
          )
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          child: Text('筛选功能'),
        ),
      ),
      body: this._isHaveData
          ? Stack(
              children: <Widget>[
                _productWidget(), // 列表界面
                _headerWidget(),
              ],
            )
          : Text('没有搜索的数据'),
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
          children: this._subHeaderList.map(
            (v) {
              return Expanded(
                flex: 1,
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, ljjAdaper.height(20), 0, ljjAdaper.height(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          v['title'].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: (this._selectIndex == v['id'])
                                ? Colors.red
                                : Colors.black87,
                          ),
                        ),
                        this._showIcon(v),
                      ],
                    ),
                  ),
                  onTap: () {
                    this._subHeaderChange(v);
                  },
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

/*
 * 列表界面
 */
  Widget _productWidget() {
    if (this._prodectData.length <= 0) {
      return ljjHud();
    }
    return Container(
      margin: EdgeInsets.only(top: ljjAdaper.width(80)),
      padding: EdgeInsets.all(ljjAdaper.width(10)),
      child: ListView.builder(
        controller: this._scrollController,
        itemBuilder: (c, i) {
          String spic = this._prodectData[i].pic;
          spic = ljjConfig.domain + spic.replaceAll('\\', '/');
          return Column(
            //每一个元素
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: ljjAdaper.width(180),
                    height: ljjAdaper.height(180),
                    child: Image.network(spic, fit: BoxFit.cover),
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
                            this._prodectData[i].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            this._prodectData[i].price.toString(),
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
              this._showMore(i),
            ],
          );
        },
        itemCount: this._prodectData.length,
      ),
    );
  }

/*
 * show More
 */
  Widget _showMore(i) {
    if (this._isHaveSource == true) {
      return i == this._prodectData.length - 1 ? ljjHud() : Text('');
    } else {
      return i == this._prodectData.length - 1 ? Text('我是有底线的') : Text('');
    }
  }

/*
 * 展示箭头
 */
  Widget _showIcon(v) {
    if (v['id'] == 2 || v['id'] == 3) {
      if (v['sort'] == 1) {
        return Icon(Icons.arrow_drop_down);
      } else {
        return Icon(Icons.arrow_drop_up);
      }
    } else {
      return Text('');
    }
  }
}
