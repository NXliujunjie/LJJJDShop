import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:jdshop/Models/homePageModel.dart';
import 'package:dio/dio.dart';

class HomeVc extends StatefulWidget {
  HomeVc({Key key}) : super(key: key);

  _HomeVcState createState() => _HomeVcState();
}

class _HomeVcState extends State<HomeVc> {
  List _focusData = [];

/*
 * 初始化
 */
  @override
  void initState() {
    super.initState();
    _getFocusData();
  }

/*
 * 请求数据
 */
  _getFocusData() async {
    var api = 'http://jd.itying.com/api/focus';
    var source = await Dio().get(api);
    var pageSource = homePageModel.fromJson(source.data);
    setState(() {
      this._focusData = pageSource.result;
    });
  }

/* *
 * 轮播图
 */
  Widget _swiper() {
    if (this._focusData.length <= 0) {
      return Text('loading...');
    } else {
      return Container(
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              String pic = this._focusData[index].pic;
              return new Image.network(
                "http://jd.itying.com/${pic.replaceAll('\\', '/')}",
                fit: BoxFit.fill,
              );
            },
            itemCount: this._focusData.length,
            autoplay: true,
            pagination: new SwiperPagination(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return ListView(
      children: <Widget>[
        _swiper(),
        SizedBox(height: 10),
        _titleWodget('猜你喜欢'), //猜你喜欢
        SizedBox(height: 10),
        _hostWidget(), //猜你喜欢
        _titleWodget('热门商品'), //热门商品
        _recProductWidget(),//热门商品
      ],
    );
  }
}

/*
 * 公共组件
 */
Widget _titleWodget(value) {
  return Container(
      height: ljjAdaper.height(42),
      margin: EdgeInsets.only(
        left: ljjAdaper.width(14),
      ),
      padding: EdgeInsets.only(left: 5, top: 5),
      decoration: BoxDecoration(
          border: Border(
              left:
                  BorderSide(color: Colors.red, width: ljjAdaper.height(10)))),
      child: Text(value, style: TextStyle(color: Colors.black54)));
}

/*
 * 猜你喜欢
 */
Widget _hostWidget() {
  return Container(
    height: ljjAdaper.height(220),
    // width: double.infinity, //自适应
    padding: EdgeInsets.all(ljjAdaper.width(10)),
    child: ListView.builder(
      scrollDirection: Axis.horizontal, //横向滚动
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
              height: ljjAdaper.height(140),
              width: ljjAdaper.height(140),
              margin: EdgeInsets.only(right: ljjAdaper.width(21)),
              child: Image.network(
                  'https://www.itying.com/images/flutter/hot${index + 1}.jpg',
                  fit: BoxFit.cover),
            ),
            Container(
              padding: EdgeInsets.only(top: ljjAdaper.height(10)),
              height: ljjAdaper.height(44),
              child: Text('第${index + 1}条'),
            ),
          ],
        );
      },
      itemCount: 10,
    ),
  );
}

/*
 * 热门商品
 */
Widget _recProductWidget() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Wrap(
      runSpacing: 10,
      spacing: 10,
      children: <Widget>[
        _recProductItemWidget(),
        _recProductItemWidget(),
        _recProductItemWidget(),
        _recProductItemWidget(),
        _recProductItemWidget(),
        _recProductItemWidget()
      ],
    ),
  );
}

/*
 * 热门商品 子控件
 */
Widget _recProductItemWidget() {
  var itemWidth = (ljjAdaper.getScreenWidthDP() - 30) / 2;

  return Container(
    padding: EdgeInsets.all(10),
    width: itemWidth,
    decoration: BoxDecoration(
        border:
            Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
    child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: AspectRatio(
            //防止服务器返回的图片大小不一致导致高度不一致问题
            aspectRatio: 1 / 1,
            child: Image.network(
              "https://www.itying.com/images/flutter/list1.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: ljjAdaper.height(20)),
          child: Text(
            "2019夏季新款气质高贵洋气阔太太有女人味中长款宽松大码",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black54),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: ljjAdaper.height(20)),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "¥188.0",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("¥198.0",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough)),
              )
            ],
          ),
        )
      ],
    ),
  );
}
