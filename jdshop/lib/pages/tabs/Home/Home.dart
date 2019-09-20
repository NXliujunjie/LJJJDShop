import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:jdshop/service/ljjAdaper.dart';

class HomeVc extends StatefulWidget {
  HomeVc({Key key}) : super(key: key);

  _HomeVcState createState() => _HomeVcState();
}

class _HomeVcState extends State<HomeVc> {
  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return ListView(
      children: <Widget>[
        _swiper(),
        SizedBox(height: 10),
        _titleWodget('猜你喜欢'), //猜你喜欢
        SizedBox(height: 10),
        _hostWidget(), //热门
      ],
    );
  }
}

/* *
 * 轮播图
 */
Widget _swiper() {
  List<Map> imageList = [
    {'url': 'https://www.itying.com/images/flutter/1.png'},
    {'url': 'https://www.itying.com/images/flutter/2.png'},
    {'url': 'https://www.itying.com/images/flutter/3.png'},
  ];
  return Container(
    child: AspectRatio(
      aspectRatio: 2 / 1,
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            imageList[index]['url'].toString(),
            fit: BoxFit.fill,
          );
        },
        itemCount: imageList.length,
        autoplay: true,
        pagination: new SwiperPagination(),
      ),
    ),
  );
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
 * 热门
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
              margin: EdgeInsets.only(right:ljjAdaper.width(21)),
              child: Image.network(
                  'https://www.itying.com/images/flutter/hot${index + 1}.jpg',
                  fit: BoxFit.cover),
            ),
            Container(
              padding: EdgeInsets.only(top: ljjAdaper.height(10)),
              height: ljjAdaper.height(44),
              child:Text('第${index + 1}条'),
            ),
          ],
        );
      },
      itemCount: 10,
    ),
  );
}
