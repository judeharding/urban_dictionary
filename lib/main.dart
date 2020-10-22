import 'package:flutter/material.dart';
//
import 'package:urban_dictionary/enter_term_page.dart';
import 'package:urban_dictionary/networking_service.dart';
import 'package:urban_dictionary/term_details_page.dart';
import 'package:urban_dictionary/terms_page.dart';
import 'package:urban_dictionary/term.dart';

void main() {
  runApp(MyApp());
}

// https://www.youtube.com/watch?v=yAsd67eFIeE
// ...209
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // handler for the stack
  String _searchedTerm;
  Term _selectedTerm;
  List<Term> _terms = [];

  final _networkingService = NetworkingService();

  void _searchForTerm(String term) async {
    final terms = await _networkingService.defineTerm(term);

    setState(() {
      this._searchedTerm = term;
      this._terms = terms;
      print(term);
    });
  }

  void _didSelectTerm(Term term) {
    setState(() {
      this._selectedTerm = term;
      print(term.word);
      print(term.definition);
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
                terms: this._terms,
                didSelectTerm: _didSelectTerm,
              ),
            ),
          //show term details page
          if (_selectedTerm != null)
            MaterialPage(
              key: TermDetailsPage.valueKey,
              child: TermDetailsPage(
                term: _selectedTerm,
              ),
            ),
        ],
        onPopPage: (route, result) {
          final materialPage = route.settings as MaterialPage;
          final pageKey = materialPage.key;
          // using if stmts instead of setstate to clear out the values
          if (pageKey == TermsPage.valueKey) {
            this._searchedTerm = null;
          }

          if (pageKey == TermDetailsPage.valueKey) {
            this._selectedTerm = null;
          }
          return route.didPop(result);
        },
      ),
    );
  }
}
