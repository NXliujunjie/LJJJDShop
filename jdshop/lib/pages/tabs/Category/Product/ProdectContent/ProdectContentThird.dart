import 'package:flutter/material.dart';

class ProdectContentThird extends StatefulWidget {
  
  List predectDetailItemModelList;
  ProdectContentThird(this.predectDetailItemModelList, {Key key}) : super(key: key);
  _ProdectContentThirdState createState() => _ProdectContentThirdState();
}

class _ProdectContentThirdState extends State<ProdectContentThird> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text(''),
    );
  }

  @override
  bool get wantKeepAlive => true;
}