import 'package:flutter/material.dart';
import 'package:jdshop/service/ljjAdaper.dart';
import 'package:jdshop/tool/searchServices.dart';

class SearchVc extends StatefulWidget {
  SearchVc({Key key}) : super(key: key);

  _SearchVcState createState() => _SearchVcState();
}

class _SearchVcState extends State<SearchVc> {
  
  var _keyWords;

  List _historyListData = [];

  @override
  void initState() { 
    super.initState();
    this._getHistoryData();
  }

  /*
   * 获取历史记录
   */
  void _getHistoryData() async {
    var _historyListData = await SearchServices.getHistoryList();
    setState((){
      this._historyListData = _historyListData;
    });
  }

  @override
  Widget build(BuildContext context) {
    ljjAdaper.init(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
              onChanged: (v) {
                this._keyWords = v;
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
                      SearchServices.setHistoryData(this._keyWords);
                      Navigator.pushReplacementNamed(context, '/ProductList',
                          arguments: {
                            'keyWords': this._keyWords,
                          });
                    },
                  )
                ],
              ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(ljjAdaper.height(10)),
          child: ListView(
            children: <Widget>[
              Container(
                child: Text(
                  '热搜',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Divider(),
              Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text('女装'),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text('女装'),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text('女装女装'),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text('女装'),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ljjAdaper.height(10)),
              _historyListWidget(),//历史记录
            ],
          ),
        ),
      ),
    );
  }

  /*
历史记录
*/
  Widget _historyListWidget() {
    if (this._historyListData.length <=0) {
      return Text('没有数据');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            '历史记录',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Column(
          children: this._historyListData.map((v){
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text('$v'),
                  onLongPress: (){
                    print(v);
                    this._showAlertDialog(v);
                  },
                )
              ],
            );
          }).toList(),
        ),
        InkWell(
          onTap: (){
            SearchServices.removeHistoryData();
            _getHistoryData();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.delete),
              Text('删除'),
            ],
          ),
        )
      ],
    );
  }

  /*
   * 提示框
   */
    _showAlertDialog(keywords) async{
     await showDialog(
        barrierDismissible:false,   //表示点击灰色背景的时候是否消失弹出框
        context:context,
        builder: (context){
          return AlertDialog(
            title: Text("提示信息!"),
            content:Text("您确定要删除吗?") ,
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: (){
                  print("取消");
                  Navigator.pop(context,'Cancle');
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () async{            
                  //注意异步      
                  print('1231231231$keywords');
                  await SearchServices.removeHistoryIteamData(keywords);
                  this._getHistoryData();
                  Navigator.pop(context,"Ok");
                },
              )
            ],

          );
        }
     );
  }
}
