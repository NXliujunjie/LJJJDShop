import 'package:flutter/material.dart';
import 'package:jdshop/config/config.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:jdshop/Models/cateModel.dart';
import 'package:dio/dio.dart';
import 'package:jdshop/Models/cateDetailModel.dart';

class CategoryVc extends StatefulWidget {
  CategoryVc({Key key}) : super(key: key);

  _CategoryVcState createState() => _CategoryVcState();
}

class _CategoryVcState extends State<CategoryVc>
    with AutomaticKeepAliveClientMixin {
  int _selectIndex = 0;
  List<CateItemModel> _cateItemModelList = [];
  List<cateDetailItemModel> _cateDetailItemModelList = [];
/*
 * 重写 AutomaticKeepAliveClientMixin 方法
 */
  @override
  bool get wantKeepAlive => true;
  /*
   * 初始化
   */
  @override
  void initState() {
    super.initState();
    _getLeftViewData();
  }

  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.center_focus_weak,
            size: ljjAdaper.sizeFont(35),
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.message,
              size: ljjAdaper.sizeFont(35),
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        title: InkWell(
          child: Container(
            height: ljjAdaper.sizeFont(70),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(233, 233, 233, 0.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.search),
                Text(
                  '笔记本',
                  style: TextStyle(
                    fontSize: ljjAdaper.sizeFont(28),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/Search');
          },
        ),
      ),
      body: Row(
        children: <Widget>[_leftView(), _rightView()],
      ),
    );
  }

/*
 * 左侧分类请求数据
 */
  void _getLeftViewData() async {
    String api = ljjConfig.domain + 'api/pcate';
    var result = await Dio().get(api);
    var list = new CateModel.fromJson(result.data);
    _getRightViewData(list.result[0].sId.toString());

    setState(() {
      this._cateItemModelList = list.result;
    });
  }

/*
 * 右侧分类详情请求数据
 */
  void _getRightViewData(String pid) async {
    String api = '${ljjConfig.domain}api/pcate?pid=$pid';
    var result = await Dio().get(api);
    var list = new cateDetailModel.fromJson(result.data);
    setState(() {
      this._cateDetailItemModelList = list.result;
    });
  }

/*
 * 左侧View
 */
  Widget _leftView() {
    if (this._cateItemModelList.length <= 0) {
      return Container(
        width: ljjAdaper.getScreenWidthDP() / 4,
        height: double.infinity,
      );
    }
    return Container(
        width: ljjAdaper.getScreenWidthDP() / 4,
        height: double.infinity,
        child: ListView.builder(
          itemCount: this._cateItemModelList.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      this._selectIndex = index;
                      this._getRightViewData(
                          this._cateItemModelList[index].sId);
                    });
                  },
                  child: Container(
                    height: ljjAdaper.height(84),
                    alignment: Alignment.center,
                    child: Text(
                      this._cateItemModelList[index].title,
                      textAlign: TextAlign.center,
                    ),
                    color: _selectIndex == index
                        ? Color.fromRGBO(240, 246, 246, 0.9)
                        : Colors.white,
                    width: double.infinity,
                  ),
                ),
                Divider(
                  height: 1,
                ),
              ],
            );
          },
        ));
  }

  /*
 * 
 * 右侧View
 */
  Widget _rightView() {
    /*
    * 计算右侧 GridView 宽高比
    */
    var leftScreenWidth = ljjAdaper.getScreenWidthDP() / 4;
    var rightItemWidth =
        (ljjAdaper.getScreenWidthDP() - leftScreenWidth - 20 - 20) / 3;
    var rightItemHeight =
        (ljjAdaper.getScreenWidthDP() - leftScreenWidth - 20 - 20) / 3 +
            ljjAdaper.height(30) +
            ljjAdaper.height(5);
    if (this._cateItemModelList.length <= 0) {
      return Expanded(
        flex: 1,
        child: Text(ljjConfig.loading),
      );
    }
    return Expanded(
      flex: 1,
      child: Container(
          height: double.infinity,
          color: Color.fromRGBO(240, 246, 246, 0.9),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: rightItemWidth / rightItemHeight,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: this._cateDetailItemModelList.length,
            itemBuilder: (context, index) {
              String spic = this._cateDetailItemModelList[index].pic;
              spic = ljjConfig.domain + spic.replaceAll('\\', '/');
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/ProductList', arguments: {
                    'sId': this._cateDetailItemModelList[index].sId.toString(),
                  });
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(
                          spic,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: ljjAdaper.height(5),
                      ),
                      Container(
                        height: ljjAdaper.height(32),
                        child: Text(this._cateDetailItemModelList[index].title),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
