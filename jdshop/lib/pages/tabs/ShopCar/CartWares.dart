import 'package:flutter/material.dart';
import 'package:jdshop/pages/tabs/ShopCar/CartTotal.dart';
import 'package:jdshop/service/ljjAdaper.dart';

class CartWares extends StatefulWidget {
  CartWares({Key key}) : super(key: key);

  _CartWaresState createState() => _CartWaresState();
}

class _CartWaresState extends State<CartWares> {
  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Container(
      height: ljjAdaper.height(200),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: ljjAdaper.width(60),
            child: Checkbox(
              value: true,
              onChanged: (v) {},
              activeColor: Colors.pink,
            ),
          ),
          Container(
            width: ljjAdaper.width(160),
            height: ljjAdaper.width(160),
            child: Image.network(
              'https://www.itying.com/images/flutter/list2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '文档翻译 专业论文 产品介绍 合同标书 简历证件 留学移民 创意翻译 我知道了 翻译API 翻译APP 登录 划词 自动检测语言 自动检测语言 中文» 英语 英语» ...',
                    maxLines: 2,
                  ),
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '￥${20}',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CartTotal(),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
