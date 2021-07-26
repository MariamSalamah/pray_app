import 'package:flutter/material.dart';
import 'package:pray_app/firstpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primaryColor: Color.fromRGBO(39,167,205, 1),
        //scaffoldBackgroundColor: Color.fromRGBO(89,68,90, 1),

      ),
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

