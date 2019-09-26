import 'package:flutter/material.dart';

class SearchVc extends StatefulWidget {
  SearchVc({Key key}) : super(key: key);

  _SearchVcState createState() => _SearchVcState();
}

class _SearchVcState extends State<SearchVc> {
  @override
  Widget build(BuildContext context) {
   return Container(
       child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                )
              ),
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
                    onTap: (){
                      print('123123123123123');
                    },
                  )
                ],
              ),
            )
          ],
        ),
        body: Text('搜索界面'),
       ),
    );
  }
}