import 'package:flutter/material.dart';
import 'package:urban_dictionary/enter_term_page.dart';

void main() {
  runApp(MyApp());
}

// https://www.youtube.com/watch?v=yAsd67eFIeE
// 36:00
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urban Dictionary App',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EnterTermPage(),
    );
  }
}
