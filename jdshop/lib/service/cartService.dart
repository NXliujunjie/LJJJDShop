
import 'dart:convert';
import 'package:jdshop/config/config.dart';
import 'package:jdshop/tool/ljjSaveData.dart';

class CartService {

  static addCart(item) async {
    //把对象转换成map类型的数据
    item = CartService.formatCartData(item);
    print(item);
    try {
      List cartListData =
          json.decode(await LJJSaveData.getString('cartList'));
      bool hasData =  cartListData.any((v){
        //selectAttr:
        if (v['id'] == item['id'] && v['selectAttr'] == item['selectAttr']) {
            return true;
        }
        return false;
      });
      if (hasData) {
        for (var i = 0; i < cartListData.length; i++) {
          if (cartListData[i]['id'] == item['id'] && cartListData[i]['selectAttr'] == item['selectAttr']) {
            cartListData[i]['count'] = cartListData[i]['count'] + 1;
          }
        }
        await LJJSaveData.setString('cartList', json.encode(cartListData));
      }else{
        cartListData.add(item);
        await LJJSaveData.setString('cartList', json.encode(cartListData));
      }

    } catch (e) {
      List tempList = [];
      tempList.add(item);
      await LJJSaveData.setString('cartList', json.encode(tempList));
    }
  }

  //过滤数据
  static formatCartData(item) {

    String pic = item.pic;
    pic = ljjConfig.domain + pic.replaceAll('\\', '/');

    final Map data = new Map<String, dynamic>();
    data['_id'] = item.sId;
    data['title'] = item.title;
    if (item.price is int || item.price is double) {
      data['price'] = item.price;
    }else{
      data['price'] = double.parse(item.price);
    }
    data['selectAttr'] = item.selectAttr;
    data['count'] = item.count;
    data['pic'] = pic;
    //是否选中
    data['checket'] = true;
    return data;
  }
}
// class SearchServices {
// static setHistoryData(keywords) async {
//     try {
//       List searchListData = json.decode(await LJJSaveData.getString('searchList'));

//       print(searchListData);
//       var hasData = searchListData.any((v) {
//         return v == keywords;
//       });
//       if (!hasData) {
//         searchListData.add(keywords);
//         await LJJSaveData.setString('searchList', json.encode(searchListData));
//       }
//     } catch (e) {
//       List tempList = new List();
//       tempList.add(keywords);
//       await LJJSaveData.setString('searchList', json.encode(tempList));
//     }
//   }
//   static getHistoryList() async{
//      try {
//       List searchListData = json.decode(await LJJSaveData.getString('searchList'));
//       return searchListData;
//     } catch (e) {
//       return [];
//     }
//   }

//   static removeHistoryData() async{
//       await LJJSaveData.remove('searchList');
//   }

//   static removeHistoryIteamData(key) async{
//       List searchListData = json.decode(await LJJSaveData.getString('searchList'));
//       searchListData.remove(key);
//       await LJJSaveData.setString('searchList', json.encode(searchListData));
//   }

// }
