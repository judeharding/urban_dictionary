import 'package:flutter/material.dart';
//
import 'package:urban_dictionary/term.dart';

class TermsPage extends StatelessWidget {
  static final valueKey = ValueKey('TermsPage');

  TermsPage({Key key, this.title, this.terms}) : super(key: key);

  final String title;
  final List<Term> terms;

  Widget termsList() {
    return ListView.builder(
        itemCount: terms.length,
        itemBuilder: (context, index) {
          final term = terms[index];
          //creates a cell
          return Card(
            child: ListTile(
                title: Text(term.word),
                subtitle: Text(term.definition),
                onTap: () {
                  print(term.word);
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
