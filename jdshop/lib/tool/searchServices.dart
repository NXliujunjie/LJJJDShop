import 'dart:convert';
import 'ljjSaveData.dart';

class SearchServices {
static setHistoryData(keywords) async {
    try {
      List searchListData = json.decode(await LJJSaveData.getString('searchList'));

      print(searchListData);
      var hasData = searchListData.any((v) {
        return v == keywords;
      });
      if (!hasData) {
        searchListData.add(keywords);
        await LJJSaveData.setString('searchList', json.encode(searchListData));
      }
    } catch (e) {
      List tempList = new List();
      tempList.add(keywords);
      await LJJSaveData.setString('searchList', json.encode(tempList));
    }
  }
  static getHistoryList() async{
     try {
      List searchListData = json.decode(await LJJSaveData.getString('searchList'));
      return searchListData;
    } catch (e) {
      return [];
    }
  }


  static removeHistoryData() async{    
      await LJJSaveData.remove('searchList');
  }

  static removeHistoryIteamData(key) async{    
      List searchListData = json.decode(await LJJSaveData.getString('searchList'));
      searchListData.remove(key);
      await LJJSaveData.setString('searchList', json.encode(searchListData));
  }
  
}
