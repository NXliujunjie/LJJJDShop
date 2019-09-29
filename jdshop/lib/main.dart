import 'package:flutter/material.dart';
import 'package:jdshop/provider/Cart.dart';
import 'package:jdshop/provider/Container.dart';
import 'package:jdshop/routes/router.dart';
import 'package:provider/provider.dart';

// import 'pages/tabs/Tab.dart';
// import 'routes/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => Containers()),
        ChangeNotifierProvider(builder: (_) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          primaryColor: Colors.white
        ),
      ),
    );
  }
}
