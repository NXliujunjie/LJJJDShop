import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class ProdectContentSecond extends StatefulWidget {
  final List predectDetailItemModelList;
  ProdectContentSecond(this.predectDetailItemModelList, {Key key})
      : super(key: key);
  _ProdectContentSecondState createState() => _ProdectContentSecondState();
}

class _ProdectContentSecondState extends State<ProdectContentSecond> with AutomaticKeepAliveClientMixin{
 
  var _id;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() { 
    super.initState();
    print(widget.predectDetailItemModelList[0]);
    this._id = widget.predectDetailItemModelList[0].sId;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
        children: <Widget>[
       // (progress != 1.0) ? LinearProgressIndicator(value: progress) : null,
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: InAppWebView(
              initialUrl: "http://jd.itying.com/pcontent?id=${this._id}",
              initialHeaders: {},
            ),
          ),
        )
      ],
    ));
  }
}
