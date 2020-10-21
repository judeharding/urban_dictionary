import 'package:flutter/material.dart';
//
import 'package:urban_dictionary/enter_term_page.dart';
import 'package:urban_dictionary/terms_page.dart';
import 'package:urban_dictionary/term.dart';

void main() {
  runApp(MyApp());
}

// https://www.youtube.com/watch?v=yAsd67eFIeE
// ...105
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // handler for the stack
  String _searchedTerm;

  void _searchForTerm(String term) {
    setState(() {
      this._searchedTerm = term;
      print(term);
    });
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
          // show enter term page from this stack
          MaterialPage(
            key: EnterTermPage.valueKey,
            child: EnterTermPage(
              searchForTerm: _searchForTerm,
            ),
          ),
          // show enter terms page if searched term has value
          // no curly braces in an array but yes on the if stmt in array
          if (_searchedTerm != null && _searchedTerm.isNotEmpty)
            MaterialPage(
              key: TermsPage.valueKey,
              child: TermsPage(
                title: _searchedTerm,
                terms: [
                  Term(
                      word: 'dummy term',
                      definition: 'fake definition',
                      likes: 5,
                      dislikes: 2)
                ],
              ),
            ),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
