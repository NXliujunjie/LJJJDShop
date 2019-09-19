import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeVc extends StatefulWidget {
  HomeVc({Key key}) : super(key: key);

  _HomeVcState createState() => _HomeVcState();
}

class _HomeVcState extends State<HomeVc> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return ListView(
      children: <Widget>[
        _swiper(),
        SizedBox(height: 10),
        _titleWodget('猜你喜欢'),
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
      height:ScreenUtil.getInstance().setHeight(46) ,
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.red, 
              width: ScreenUtil.getInstance().setWidth(10)
              ))),
      child: Text(value, style: TextStyle(color: Colors.black54)));
}
