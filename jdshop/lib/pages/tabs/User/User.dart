import 'package:flutter/material.dart';
import 'package:jdshop/provider/Container.dart';
import 'package:provider/provider.dart';

class UserVc extends StatefulWidget {
  UserVc({Key key}) : super(key: key);

  _UserVcState createState() => _UserVcState();
}

class _UserVcState extends State<UserVc> {
  @override
  Widget build(BuildContext context) {

    var CounterProcider = Provider.of<Containers>(context);
    return Center(
      child: Text('_UserVcState:------${CounterProcider.count}'),
    );
  }
}
