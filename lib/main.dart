import 'package:flutter/material.dart';
import 'package:urban_dictionary/enter_term_page.dart';
import 'package:urban_dictionary/terms_page.dart';

void main() {
  runApp(MyApp());
}

// https://www.youtube.com/watch?v=yAsd67eFIeE
// 55:00 to 101
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // handler for the stack
  String _searchedTerm;

  void _searchForTerm(String term) {
    this._searchedTerm = term;
    print(term);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urban Dictionary App',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: EnterTermPage.valueKey,
            child: EnterTermPage(
              searchForTerm: _searchForTerm,
            ),
          ),
          // MaterialPage(
          //   key: TermsPage.valueKey,
          //   child: TermsPage(),
          // ),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
