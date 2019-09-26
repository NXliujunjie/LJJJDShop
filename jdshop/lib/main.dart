import 'package:flutter/material.dart';
import 'package:jdshop/routes/router.dart' as prefix0;
import 'pages/tabs/Tab.dart';
import 'routes/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Tabs()
      initialRoute: '/',
      onGenerateRoute: prefix0.onGenerateRoute,
      // theme: ThemeData(
      //   primaryColor: Colors.white
      // ),
    );
  }
}
