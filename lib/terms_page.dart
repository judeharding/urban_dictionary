import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
//
import 'package:urban_dictionary/term.dart';

class TermsPage extends StatelessWidget {
  static final valueKey = ValueKey('TermsPage');

  TermsPage({Key key, this.title, this.terms, this.didSelectTerm})
      : super(key: key);

  final String title;
  final List<Term> terms;
  final ValueChanged<Term> didSelectTerm;

  Widget termsList() {
    return ListView.builder(
        itemCount: terms.length,
        itemBuilder: (context, index) {
          final term = terms[index];
          //creates a cell
          return Card(
            child: ListTile(
                title: Text(term.word),
                subtitle: Html(data: term.htmlDefinition),
                onTap: () {
                  // print(term.word);
                  didSelectTerm(term);
                }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16.0), child: termsList()),
    );
  }
}
