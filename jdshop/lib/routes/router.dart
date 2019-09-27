/**
 * Flutter 分离命名路由代码
 */

import 'package:flutter/material.dart';
import '../pages/tabs/Tab.dart';
import '../pages/tabs/Category/Product/ProductList.dart';
import '../pages/tabs/Search/search.dart';
import '../pages/tabs/Category/Product/ProdectDetail.dart';

//配置路由
final routes = {
  '/': (context) => Tabs(),
  '/ProductList': (context,{arguments}) => ProductList(arguments:arguments),
  '/Search': (context,{arguments}) => SearchVc(),
  '/ProdectDetail': (context,{arguments}) => ProdectDetail(arguments:arguments),
};
//固定写法
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
