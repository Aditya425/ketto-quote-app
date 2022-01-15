import 'package:flutter/material.dart';
import 'package:quote/networking/get_quote.dart';
import 'package:quote/widgets/quotes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.yellowAccent,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontSize: 25
            )
          ),
        )
      ),
      home: Quotes(),
    );
  }
}
