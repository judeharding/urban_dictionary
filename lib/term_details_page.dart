import 'package:flutter/material.dart';
//
import 'package:urban_dictionary/term.dart';

class TermDetailsPage extends StatelessWidget {
  static final valueKey = ValueKey('TermDetailsPage');

  //initializer
  TermDetailsPage({Key key, this.term}) : super(key: key);
  final Term term;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(term.word),
      ),
    );
  }
}
